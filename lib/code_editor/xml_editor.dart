import 'package:flutter/material.dart';
import 'package:re_editor/re_editor.dart';
import 'package:re_highlight/languages/xml.dart';
import 'package:re_highlight/styles/atom-one-light.dart';
import 'package:re_highlight/styles/atom-one-dark.dart';
import 'package:xerophyte/code_editor/find.dart';
import 'package:xerophyte/code_editor/xml_code_chunk_analyzer.dart';

class XmlEditor extends StatefulWidget {
  final CodeLineEditingController editorController;
  final CodeFindController findController;
  final void Function() onChange;

  const XmlEditor({
    super.key,
    required this.editorController,
    required this.findController,
    required this.onChange,
  });

  @override
  State<XmlEditor> createState() => _XmlEditorState();
}

class _XmlEditorState extends State<XmlEditor> {
  late ValueNotifier<String> _lastSourceCode;

  @override
  void initState() {
    super.initState();
    _lastSourceCode = ValueNotifier(
        widget.editorController.codeLines.asString(TextLineBreak.lf));
    _lastSourceCode.addListener(() {
      widget.onChange();
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final theme = isDarkMode ? atomOneDarkTheme : atomOneLightTheme;

    return CodeEditor(
      style: CodeEditorStyle(
          codeTheme: CodeHighlightTheme(
              languages: {'xml': CodeHighlightThemeMode(mode: langXml)},
              theme: theme),
          fontFamily: "monospace"),
      indicatorBuilder:
          (context, editingController, chunkController, notifier) {
        return Row(
          children: [
            DefaultCodeLineNumber(
                notifier: notifier, controller: editingController),
            DefaultCodeChunkIndicator(
                width: 20, controller: chunkController, notifier: notifier)
          ],
        );
      },
      chunkAnalyzer: XmlCodeChunkAnalyzer(),
      wordWrap: false,
      autofocus: false,
      controller: widget.editorController,
      findController: widget.findController,
      findBuilder: (context, controller, readOnly) =>
          CodeFindPanelView(controller: controller, readOnly: readOnly),
      onChanged: (e) {
        _lastSourceCode.value = e.codeLines.asString(TextLineBreak.lf);
      },
      autocompleteSymbols: false,
      sperator: Container(width: 1, color: Colors.grey),
    );
  }
}
