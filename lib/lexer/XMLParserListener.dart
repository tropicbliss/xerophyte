// Generated from XMLParser.g4 by ANTLR 4.13.2
// ignore_for_file: unused_import, unused_local_variable, prefer_single_quotes
import 'package:antlr4/antlr4.dart';

import 'XMLParser.dart';

/// This abstract class defines a complete listener for a parse tree produced by
/// [XMLParser].
abstract class XMLParserListener extends ParseTreeListener {
  /// Enter a parse tree produced by [XMLParser.document].
  /// [ctx] the parse tree
  void enterDocument(DocumentContext ctx);

  /// Exit a parse tree produced by [XMLParser.document].
  /// [ctx] the parse tree
  void exitDocument(DocumentContext ctx);

  /// Enter a parse tree produced by [XMLParser.prolog].
  /// [ctx] the parse tree
  void enterProlog(PrologContext ctx);

  /// Exit a parse tree produced by [XMLParser.prolog].
  /// [ctx] the parse tree
  void exitProlog(PrologContext ctx);

  /// Enter a parse tree produced by [XMLParser.content].
  /// [ctx] the parse tree
  void enterContent(ContentContext ctx);

  /// Exit a parse tree produced by [XMLParser.content].
  /// [ctx] the parse tree
  void exitContent(ContentContext ctx);

  /// Enter a parse tree produced by [XMLParser.element].
  /// [ctx] the parse tree
  void enterElement(ElementContext ctx);

  /// Exit a parse tree produced by [XMLParser.element].
  /// [ctx] the parse tree
  void exitElement(ElementContext ctx);

  /// Enter a parse tree produced by [XMLParser.reference].
  /// [ctx] the parse tree
  void enterReference(ReferenceContext ctx);

  /// Exit a parse tree produced by [XMLParser.reference].
  /// [ctx] the parse tree
  void exitReference(ReferenceContext ctx);

  /// Enter a parse tree produced by [XMLParser.attribute].
  /// [ctx] the parse tree
  void enterAttribute(AttributeContext ctx);

  /// Exit a parse tree produced by [XMLParser.attribute].
  /// [ctx] the parse tree
  void exitAttribute(AttributeContext ctx);

  /// Enter a parse tree produced by [XMLParser.chardata].
  /// [ctx] the parse tree
  void enterChardata(ChardataContext ctx);

  /// Exit a parse tree produced by [XMLParser.chardata].
  /// [ctx] the parse tree
  void exitChardata(ChardataContext ctx);

  /// Enter a parse tree produced by [XMLParser.misc].
  /// [ctx] the parse tree
  void enterMisc(MiscContext ctx);

  /// Exit a parse tree produced by [XMLParser.misc].
  /// [ctx] the parse tree
  void exitMisc(MiscContext ctx);
}
