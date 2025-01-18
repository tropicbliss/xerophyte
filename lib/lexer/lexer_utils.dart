import 'package:antlr4/antlr4.dart';
import 'package:re_editor/re_editor.dart';
import 'package:xerophyte/lexer/XMLLexer.dart';
import 'package:xerophyte/lexer/XMLParser.dart';
import 'package:xerophyte/lexer/XMLParserBaseListener.dart';

List<CodeChunk> getFoldingLinePairs(String xml) {
  final inputStream = InputStream.fromString(xml);
  _CustomErrorListener customErrorListener = _CustomErrorListener();
  final lexer = XMLLexer(inputStream)
    ..removeErrorListeners()
    ..addErrorListener(customErrorListener);
  final tokens = CommonTokenStream(lexer);
  final parser = XMLParser(tokens)..removeErrorListeners();
  final listener = XMLStructureListener();
  ParseTreeWalker.DEFAULT.walk(listener, parser.document());
  return customErrorListener.errorFound ? [] : listener.linePairs;
}

class _CustomErrorListener extends BaseErrorListener {
  bool errorFound = false;

  @override
  void syntaxError(recognizer, offendingSymbol, line, column, msg, e) {
    errorFound = true;
  }
}

class XMLStructureListener extends XMLParserBaseListener {
  List<CodeChunk> linePairs = [];

  @override
  void enterElement(ElementContext ctx) {
    int? start = ctx.start?.line;
    int? stop = ctx.stop?.line;
    if (start != null && stop != null && start != stop) {
      linePairs.add(CodeChunk(start - 1, stop - 1));
    }
  }
}
