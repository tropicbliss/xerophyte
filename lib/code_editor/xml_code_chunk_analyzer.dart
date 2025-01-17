import 'package:re_editor/re_editor.dart';

class XmlCodeChunkAnalyzer implements CodeChunkAnalyzer {
  @override
  List<CodeChunk> run(CodeLines codeLines) {
    final lines = codeLines.toList().map((codeLine) => codeLine.text).toList();
    final tagStack = <(String, int)>[];
    final tagPairs = <CodeChunk>[];
    for (int i = 0; i < lines.length; i++) {
      var line = lines[i].trim();
      if (line.isEmpty) {
        continue;
      }
      var currentPos = 0;
      while (currentPos < line.length) {
        final tagStart = line.indexOf('<', currentPos);
        if (tagStart == -1) {
          break;
        }
        final tagEnd = line.indexOf('>', tagStart);
        if (tagEnd == -1) {
          break;
        }
        final tagContent = line.substring(tagStart + 1, tagEnd);
        currentPos = tagEnd + 1;
        if (tagContent.startsWith('!') ||
            tagContent.startsWith('?') ||
            tagContent.endsWith("/")) {
          continue;
        }
        if (tagContent.startsWith('/')) {
          final tagName = tagContent.substring(1);
          if (tagStack.isNotEmpty && tagStack.last.$1 == tagName) {
            final openingTag = tagStack.removeLast();
            if (openingTag.$2 != i) {
              tagPairs.add(CodeChunk(openingTag.$2, i));
            }
          }
        } else {
          final tagName = tagContent.split(RegExp(r'\s+')).first;
          tagStack.add((tagName, i));
        }
      }
    }
    tagPairs.sort((a, b) => a.index - b.index);
    return tagPairs;
  }
}
