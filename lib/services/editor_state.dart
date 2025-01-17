import 'dart:io';
import 'dart:typed_data';
import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:re_editor/re_editor.dart';
import 'package:xerophyte/services/editor_persistence.dart';
import 'package:xerophyte/services/xml_utils.dart';
import 'package:xml/xml.dart';
import 'package:xml/xpath.dart';

enum DialogResult { confirm, cancel }

sealed class XmlResult {
  const XmlResult();
}

final class XmlSuccess extends XmlResult {
  final XmlDocument document;
  const XmlSuccess(this.document);
}

final class XmlError {
  final String message;
  final int line;

  XmlError({required this.message, required this.line});
}

final class XmlFailure extends XmlResult {
  final List<XmlError> error;
  const XmlFailure(this.error);
}

final class XPathResult {
  final bool isError;
  final String message;
  XPathResult({required this.isError, required this.message});
}

class EditorState {
  late String _originalSourceCode;
  String? _path;
  late final CodeLineEditingController _editorController;
  late final CodeFindController _findController;

  EditorState._({required String? path, required String sourceCode}) {
    _editorController = CodeLineEditingController.fromText(sourceCode);
    _originalSourceCode = _editorController.text;
    _findController = CodeFindController(_editorController);
    _path = path;
  }

  void undo() => _editorController.undo();

  void redo() => _editorController.redo();

  void selectAll() => _editorController.selectAll();

  static Future<EditorState> create() async {
    final path = await EditorPersistence.getLastPath();
    if (path != null) {
      final file = File(path);
      final fileExists = await file.exists();
      if (fileExists) {
        final sourceCode = await file.readAsString();
        return EditorState._(path: path, sourceCode: sourceCode);
      }
    }
    return EditorState._(path: null, sourceCode: "");
  }

  bool get isModified {
    return _originalSourceCode != _editorController.text;
  }

  Future<void> reset(
      {required Future<DialogResult> Function()
          progressLossConfirmationDialog}) async {
    if (isModified) {
      DialogResult result = await progressLossConfirmationDialog();
      if (result == DialogResult.cancel) {
        return;
      }
    }
    EditorPersistence.clearLastPath();
    _originalSourceCode = "";
    _editorController.text = "";
    _editorController.clearHistory();
    _path = null;
  }

  Future<void> open(
      {required Future<DialogResult> Function()
          progressLossConfirmationDialog}) async {
    if (isModified) {
      DialogResult result = await progressLossConfirmationDialog();
      if (result == DialogResult.cancel) {
        return;
      }
    }
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ["xml"]);
    if (result == null) {
      return;
    }
    File file = File(result.files.single.path!);
    String text = await file.readAsString();
    _originalSourceCode = text;
    _editorController.text = text;
    _editorController.clearHistory();
    _path = result.files.single.path;
    EditorPersistence.saveLastPath(_path!);
  }

  Future<void> save() async {
    Uint8List bytes = utf8.encode(_editorController.text);
    if (_path == null) {
      await FilePicker.platform.saveFile(
          dialogTitle: "Please select an output file:",
          allowedExtensions: ["xml"],
          bytes: bytes);
    } else {
      File file = File(_path!);
      await file.writeAsBytes(bytes);
    }
    _originalSourceCode = _editorController.text;
  }

  void format() {
    try {
      _editorController.text =
          XmlUtils.prettifyXmlString(_editorController.text);
    } catch (e) {
      return;
    }
  }

  void minify() {
    String minified = XmlUtils.minifyXml(_editorController.text);
    _editorController.text = minified;
  }

  XPathResult transform(String xpath) {
    if (xml case XmlSuccess result) {
      final document = result.document;
      if (xpath.isEmpty) {
        return XPathResult(
            isError: false, message: XmlUtils.prettifyXml(document));
      }
      try {
        final result = document
            .xpath(xpath)
            .map((node) {
              try {
                return XmlUtils.prettifyXmlString(node.toXmlString());
              } catch (e) {
                return node.toString().trim();
              }
            })
            .toList()
            .toString();
        return XPathResult(isError: false, message: result);
      } catch (e) {
        if (e is XPathParserException) {
          final errorMessage = e.message;
          return XPathResult(isError: true, message: errorMessage);
        } else {
          throw UnimplementedError("Found weird error: $e");
        }
      }
    }
    return XPathResult(isError: true, message: "");
  }

  bool get isValidXml => xml is XmlSuccess;

  bool get canUndo => _editorController.canUndo;

  bool get canRedo => _editorController.canRedo;

  String? get path => _path;

  String get sourceCode => _editorController.text;

  CodeLineEditingController get editorController => _editorController;

  CodeFindController get findController => _findController;

  XmlResult get xml {
    try {
      final document = XmlDocument.parse(_editorController.text);
      return XmlSuccess(document);
    } catch (e) {
      String errorMessage;
      int line;
      if (e is XmlParserException) {
        line = e.line;
        errorMessage = e.message;
      } else if (e is XmlTagException) {
        line = e.line;
        errorMessage = e.message;
      } else {
        throw UnimplementedError("Found weird error: $e");
      }
      return XmlFailure([XmlError(message: errorMessage, line: line)]);
    }
  }

  void openFindPanel() => _findController.findMode();
}
