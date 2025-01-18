import 'package:re_editor/re_editor.dart';
import 'package:xerophyte/lexer/lexer_utils.dart';

class XmlCodeChunkAnalyzer implements CodeChunkAnalyzer {
  XmlCodeChunkAnalyzer();

  @override
  List<CodeChunk> run(CodeLines codeLines) {
    String xml = codeLines.asString(TextLineBreak.lf);
    return getFoldingLinePairs(xml);
  }
}
