import 'package:flutter/material.dart';
import 'package:re_editor/re_editor.dart';
import 'package:re_highlight/languages/xml.dart';
import 'package:re_highlight/styles/atom-one-light.dart';
import 'package:re_highlight/styles/atom-one-dark.dart';
import 'package:xerophyte/code_editor/find.dart';
import 'package:xerophyte/code_editor/xml_code_chunk_analyzer.dart';

class XmlEditor extends StatelessWidget {
  final CodeLineEditingController editorController;
  final CodeFindController findController;
  final void Function() onChange;

  const XmlEditor(
      {super.key,
      required this.editorController,
      required this.findController,
      required this.onChange});

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
      controller: editorController,
      findController: findController,
      findBuilder: (context, controller, readOnly) =>
          CodeFindPanelView(controller: controller, readOnly: readOnly),
      onChanged: (e) {
        onChange();
      },
      autocompleteSymbols: false,
      sperator: Container(width: 1, color: Colors.grey),
    );
  }
}
