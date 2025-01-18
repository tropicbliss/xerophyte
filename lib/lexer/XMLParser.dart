// Generated from XMLParser.g4 by ANTLR 4.13.2
// ignore_for_file: unused_import, unused_local_variable, prefer_single_quotes
import 'package:antlr4/antlr4.dart';

import 'XMLParserListener.dart';
import 'XMLParserBaseListener.dart';

const int RULE_document = 0,
    RULE_prolog = 1,
    RULE_content = 2,
    RULE_element = 3,
    RULE_reference = 4,
    RULE_attribute = 5,
    RULE_chardata = 6,
    RULE_misc = 7;

class XMLParser extends Parser {
  static final checkVersion =
      () => RuntimeMetaData.checkVersion('4.13.2', RuntimeMetaData.VERSION);
  static const int TOKEN_EOF = IntStream.EOF;

  static final List<DFA> _decisionToDFA = List.generate(
      _ATN.numberOfDecisions, (i) => DFA(_ATN.getDecisionState(i), i));
  static final PredictionContextCache _sharedContextCache =
      PredictionContextCache();
  static const int TOKEN_COMMENT = 1,
      TOKEN_CDATA = 2,
      TOKEN_DTD = 3,
      TOKEN_EntityRef = 4,
      TOKEN_CharRef = 5,
      TOKEN_SEA_WS = 6,
      TOKEN_OPEN = 7,
      TOKEN_XMLDeclOpen = 8,
      TOKEN_TEXT = 9,
      TOKEN_CLOSE = 10,
      TOKEN_SPECIAL_CLOSE = 11,
      TOKEN_SLASH_CLOSE = 12,
      TOKEN_SLASH = 13,
      TOKEN_EQUALS = 14,
      TOKEN_STRING = 15,
      TOKEN_Name = 16,
      TOKEN_S = 17,
      TOKEN_PI = 18;

  @override
  final List<String> ruleNames = [
    'document',
    'prolog',
    'content',
    'element',
    'reference',
    'attribute',
    'chardata',
    'misc'
  ];

  static final List<String?> _LITERAL_NAMES = [
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    "'<'",
    null,
    null,
    "'>'",
    null,
    "'/>'",
    "'/'",
    "'='"
  ];
  static final List<String?> _SYMBOLIC_NAMES = [
    null,
    "COMMENT",
    "CDATA",
    "DTD",
    "EntityRef",
    "CharRef",
    "SEA_WS",
    "OPEN",
    "XMLDeclOpen",
    "TEXT",
    "CLOSE",
    "SPECIAL_CLOSE",
    "SLASH_CLOSE",
    "SLASH",
    "EQUALS",
    "STRING",
    "Name",
    "S",
    "PI"
  ];
  static final Vocabulary VOCABULARY =
      VocabularyImpl(_LITERAL_NAMES, _SYMBOLIC_NAMES);

  @override
  Vocabulary get vocabulary {
    return VOCABULARY;
  }

  @override
  String get grammarFileName => 'XMLParser.g4';

  @override
  List<int> get serializedATN => _serializedATN;

  @override
  ATN getATN() {
    return _ATN;
  }

  XMLParser(TokenStream input) : super(input) {
    interpreter =
        ParserATNSimulator(this, _ATN, _decisionToDFA, _sharedContextCache);
  }

  DocumentContext document() {
    dynamic _localctx = DocumentContext(context, state);
    enterRule(_localctx, 0, RULE_document);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 17;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      if (_la == TOKEN_XMLDeclOpen) {
        state = 16;
        prolog();
      }

      state = 22;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while ((((_la) & ~0x3f) == 0 && ((1 << _la) & 262210) != 0)) {
        state = 19;
        misc();
        state = 24;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      }
      state = 25;
      element();
      state = 29;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while ((((_la) & ~0x3f) == 0 && ((1 << _la) & 262210) != 0)) {
        state = 26;
        misc();
        state = 31;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      }
      state = 32;
      match(TOKEN_EOF);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  PrologContext prolog() {
    dynamic _localctx = PrologContext(context, state);
    enterRule(_localctx, 2, RULE_prolog);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 34;
      match(TOKEN_XMLDeclOpen);
      state = 38;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while (_la == TOKEN_Name) {
        state = 35;
        attribute();
        state = 40;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      }
      state = 41;
      match(TOKEN_SPECIAL_CLOSE);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  ContentContext content() {
    dynamic _localctx = ContentContext(context, state);
    enterRule(_localctx, 4, RULE_content);
    int _la;
    try {
      int _alt;
      enterOuterAlt(_localctx, 1);
      state = 44;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      if (_la == TOKEN_SEA_WS || _la == TOKEN_TEXT) {
        state = 43;
        chardata();
      }

      state = 58;
      errorHandler.sync(this);
      _alt = interpreter!.adaptivePredict(tokenStream, 7, context);
      while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
        if (_alt == 1) {
          state = 51;
          errorHandler.sync(this);
          switch (tokenStream.LA(1)!) {
            case TOKEN_OPEN:
              state = 46;
              element();
              break;
            case TOKEN_EntityRef:
            case TOKEN_CharRef:
              state = 47;
              reference();
              break;
            case TOKEN_CDATA:
              state = 48;
              match(TOKEN_CDATA);
              break;
            case TOKEN_PI:
              state = 49;
              match(TOKEN_PI);
              break;
            case TOKEN_COMMENT:
              state = 50;
              match(TOKEN_COMMENT);
              break;
            default:
              throw NoViableAltException(this);
          }
          state = 54;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
          if (_la == TOKEN_SEA_WS || _la == TOKEN_TEXT) {
            state = 53;
            chardata();
          }
        }
        state = 60;
        errorHandler.sync(this);
        _alt = interpreter!.adaptivePredict(tokenStream, 7, context);
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  ElementContext element() {
    dynamic _localctx = ElementContext(context, state);
    enterRule(_localctx, 6, RULE_element);
    int _la;
    try {
      state = 85;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 10, context)) {
        case 1:
          enterOuterAlt(_localctx, 1);
          state = 61;
          match(TOKEN_OPEN);
          state = 62;
          match(TOKEN_Name);
          state = 66;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
          while (_la == TOKEN_Name) {
            state = 63;
            attribute();
            state = 68;
            errorHandler.sync(this);
            _la = tokenStream.LA(1)!;
          }
          state = 69;
          match(TOKEN_CLOSE);
          state = 70;
          content();
          state = 71;
          match(TOKEN_OPEN);
          state = 72;
          match(TOKEN_SLASH);
          state = 73;
          match(TOKEN_Name);
          state = 74;
          match(TOKEN_CLOSE);
          break;
        case 2:
          enterOuterAlt(_localctx, 2);
          state = 76;
          match(TOKEN_OPEN);
          state = 77;
          match(TOKEN_Name);
          state = 81;
          errorHandler.sync(this);
          _la = tokenStream.LA(1)!;
          while (_la == TOKEN_Name) {
            state = 78;
            attribute();
            state = 83;
            errorHandler.sync(this);
            _la = tokenStream.LA(1)!;
          }
          state = 84;
          match(TOKEN_SLASH_CLOSE);
          break;
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  ReferenceContext reference() {
    dynamic _localctx = ReferenceContext(context, state);
    enterRule(_localctx, 8, RULE_reference);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 87;
      _la = tokenStream.LA(1)!;
      if (!(_la == TOKEN_EntityRef || _la == TOKEN_CharRef)) {
        errorHandler.recoverInline(this);
      } else {
        if (tokenStream.LA(1)! == IntStream.EOF) matchedEOF = true;
        errorHandler.reportMatch(this);
        consume();
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  AttributeContext attribute() {
    dynamic _localctx = AttributeContext(context, state);
    enterRule(_localctx, 10, RULE_attribute);
    try {
      enterOuterAlt(_localctx, 1);
      state = 89;
      match(TOKEN_Name);
      state = 90;
      match(TOKEN_EQUALS);
      state = 91;
      match(TOKEN_STRING);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  ChardataContext chardata() {
    dynamic _localctx = ChardataContext(context, state);
    enterRule(_localctx, 12, RULE_chardata);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 93;
      _la = tokenStream.LA(1)!;
      if (!(_la == TOKEN_SEA_WS || _la == TOKEN_TEXT)) {
        errorHandler.recoverInline(this);
      } else {
        if (tokenStream.LA(1)! == IntStream.EOF) matchedEOF = true;
        errorHandler.reportMatch(this);
        consume();
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  MiscContext misc() {
    dynamic _localctx = MiscContext(context, state);
    enterRule(_localctx, 14, RULE_misc);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 95;
      _la = tokenStream.LA(1)!;
      if (!((((_la) & ~0x3f) == 0 && ((1 << _la) & 262210) != 0))) {
        errorHandler.recoverInline(this);
      } else {
        if (tokenStream.LA(1)! == IntStream.EOF) matchedEOF = true;
        errorHandler.reportMatch(this);
        consume();
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  static const List<int> _serializedATN = [
    4,
    1,
    18,
    98,
    2,
    0,
    7,
    0,
    2,
    1,
    7,
    1,
    2,
    2,
    7,
    2,
    2,
    3,
    7,
    3,
    2,
    4,
    7,
    4,
    2,
    5,
    7,
    5,
    2,
    6,
    7,
    6,
    2,
    7,
    7,
    7,
    1,
    0,
    3,
    0,
    18,
    8,
    0,
    1,
    0,
    5,
    0,
    21,
    8,
    0,
    10,
    0,
    12,
    0,
    24,
    9,
    0,
    1,
    0,
    1,
    0,
    5,
    0,
    28,
    8,
    0,
    10,
    0,
    12,
    0,
    31,
    9,
    0,
    1,
    0,
    1,
    0,
    1,
    1,
    1,
    1,
    5,
    1,
    37,
    8,
    1,
    10,
    1,
    12,
    1,
    40,
    9,
    1,
    1,
    1,
    1,
    1,
    1,
    2,
    3,
    2,
    45,
    8,
    2,
    1,
    2,
    1,
    2,
    1,
    2,
    1,
    2,
    1,
    2,
    3,
    2,
    52,
    8,
    2,
    1,
    2,
    3,
    2,
    55,
    8,
    2,
    5,
    2,
    57,
    8,
    2,
    10,
    2,
    12,
    2,
    60,
    9,
    2,
    1,
    3,
    1,
    3,
    1,
    3,
    5,
    3,
    65,
    8,
    3,
    10,
    3,
    12,
    3,
    68,
    9,
    3,
    1,
    3,
    1,
    3,
    1,
    3,
    1,
    3,
    1,
    3,
    1,
    3,
    1,
    3,
    1,
    3,
    1,
    3,
    1,
    3,
    5,
    3,
    80,
    8,
    3,
    10,
    3,
    12,
    3,
    83,
    9,
    3,
    1,
    3,
    3,
    3,
    86,
    8,
    3,
    1,
    4,
    1,
    4,
    1,
    5,
    1,
    5,
    1,
    5,
    1,
    5,
    1,
    6,
    1,
    6,
    1,
    7,
    1,
    7,
    1,
    7,
    0,
    0,
    8,
    0,
    2,
    4,
    6,
    8,
    10,
    12,
    14,
    0,
    3,
    1,
    0,
    4,
    5,
    2,
    0,
    6,
    6,
    9,
    9,
    3,
    0,
    1,
    1,
    6,
    6,
    18,
    18,
    103,
    0,
    17,
    1,
    0,
    0,
    0,
    2,
    34,
    1,
    0,
    0,
    0,
    4,
    44,
    1,
    0,
    0,
    0,
    6,
    85,
    1,
    0,
    0,
    0,
    8,
    87,
    1,
    0,
    0,
    0,
    10,
    89,
    1,
    0,
    0,
    0,
    12,
    93,
    1,
    0,
    0,
    0,
    14,
    95,
    1,
    0,
    0,
    0,
    16,
    18,
    3,
    2,
    1,
    0,
    17,
    16,
    1,
    0,
    0,
    0,
    17,
    18,
    1,
    0,
    0,
    0,
    18,
    22,
    1,
    0,
    0,
    0,
    19,
    21,
    3,
    14,
    7,
    0,
    20,
    19,
    1,
    0,
    0,
    0,
    21,
    24,
    1,
    0,
    0,
    0,
    22,
    20,
    1,
    0,
    0,
    0,
    22,
    23,
    1,
    0,
    0,
    0,
    23,
    25,
    1,
    0,
    0,
    0,
    24,
    22,
    1,
    0,
    0,
    0,
    25,
    29,
    3,
    6,
    3,
    0,
    26,
    28,
    3,
    14,
    7,
    0,
    27,
    26,
    1,
    0,
    0,
    0,
    28,
    31,
    1,
    0,
    0,
    0,
    29,
    27,
    1,
    0,
    0,
    0,
    29,
    30,
    1,
    0,
    0,
    0,
    30,
    32,
    1,
    0,
    0,
    0,
    31,
    29,
    1,
    0,
    0,
    0,
    32,
    33,
    5,
    0,
    0,
    1,
    33,
    1,
    1,
    0,
    0,
    0,
    34,
    38,
    5,
    8,
    0,
    0,
    35,
    37,
    3,
    10,
    5,
    0,
    36,
    35,
    1,
    0,
    0,
    0,
    37,
    40,
    1,
    0,
    0,
    0,
    38,
    36,
    1,
    0,
    0,
    0,
    38,
    39,
    1,
    0,
    0,
    0,
    39,
    41,
    1,
    0,
    0,
    0,
    40,
    38,
    1,
    0,
    0,
    0,
    41,
    42,
    5,
    11,
    0,
    0,
    42,
    3,
    1,
    0,
    0,
    0,
    43,
    45,
    3,
    12,
    6,
    0,
    44,
    43,
    1,
    0,
    0,
    0,
    44,
    45,
    1,
    0,
    0,
    0,
    45,
    58,
    1,
    0,
    0,
    0,
    46,
    52,
    3,
    6,
    3,
    0,
    47,
    52,
    3,
    8,
    4,
    0,
    48,
    52,
    5,
    2,
    0,
    0,
    49,
    52,
    5,
    18,
    0,
    0,
    50,
    52,
    5,
    1,
    0,
    0,
    51,
    46,
    1,
    0,
    0,
    0,
    51,
    47,
    1,
    0,
    0,
    0,
    51,
    48,
    1,
    0,
    0,
    0,
    51,
    49,
    1,
    0,
    0,
    0,
    51,
    50,
    1,
    0,
    0,
    0,
    52,
    54,
    1,
    0,
    0,
    0,
    53,
    55,
    3,
    12,
    6,
    0,
    54,
    53,
    1,
    0,
    0,
    0,
    54,
    55,
    1,
    0,
    0,
    0,
    55,
    57,
    1,
    0,
    0,
    0,
    56,
    51,
    1,
    0,
    0,
    0,
    57,
    60,
    1,
    0,
    0,
    0,
    58,
    56,
    1,
    0,
    0,
    0,
    58,
    59,
    1,
    0,
    0,
    0,
    59,
    5,
    1,
    0,
    0,
    0,
    60,
    58,
    1,
    0,
    0,
    0,
    61,
    62,
    5,
    7,
    0,
    0,
    62,
    66,
    5,
    16,
    0,
    0,
    63,
    65,
    3,
    10,
    5,
    0,
    64,
    63,
    1,
    0,
    0,
    0,
    65,
    68,
    1,
    0,
    0,
    0,
    66,
    64,
    1,
    0,
    0,
    0,
    66,
    67,
    1,
    0,
    0,
    0,
    67,
    69,
    1,
    0,
    0,
    0,
    68,
    66,
    1,
    0,
    0,
    0,
    69,
    70,
    5,
    10,
    0,
    0,
    70,
    71,
    3,
    4,
    2,
    0,
    71,
    72,
    5,
    7,
    0,
    0,
    72,
    73,
    5,
    13,
    0,
    0,
    73,
    74,
    5,
    16,
    0,
    0,
    74,
    75,
    5,
    10,
    0,
    0,
    75,
    86,
    1,
    0,
    0,
    0,
    76,
    77,
    5,
    7,
    0,
    0,
    77,
    81,
    5,
    16,
    0,
    0,
    78,
    80,
    3,
    10,
    5,
    0,
    79,
    78,
    1,
    0,
    0,
    0,
    80,
    83,
    1,
    0,
    0,
    0,
    81,
    79,
    1,
    0,
    0,
    0,
    81,
    82,
    1,
    0,
    0,
    0,
    82,
    84,
    1,
    0,
    0,
    0,
    83,
    81,
    1,
    0,
    0,
    0,
    84,
    86,
    5,
    12,
    0,
    0,
    85,
    61,
    1,
    0,
    0,
    0,
    85,
    76,
    1,
    0,
    0,
    0,
    86,
    7,
    1,
    0,
    0,
    0,
    87,
    88,
    7,
    0,
    0,
    0,
    88,
    9,
    1,
    0,
    0,
    0,
    89,
    90,
    5,
    16,
    0,
    0,
    90,
    91,
    5,
    14,
    0,
    0,
    91,
    92,
    5,
    15,
    0,
    0,
    92,
    11,
    1,
    0,
    0,
    0,
    93,
    94,
    7,
    1,
    0,
    0,
    94,
    13,
    1,
    0,
    0,
    0,
    95,
    96,
    7,
    2,
    0,
    0,
    96,
    15,
    1,
    0,
    0,
    0,
    11,
    17,
    22,
    29,
    38,
    44,
    51,
    54,
    58,
    66,
    81,
    85
  ];

  static final ATN _ATN = ATNDeserializer().deserialize(_serializedATN);
}

class DocumentContext extends ParserRuleContext {
  ElementContext? element() => getRuleContext<ElementContext>(0);
  TerminalNode? EOF() => getToken(XMLParser.TOKEN_EOF, 0);
  PrologContext? prolog() => getRuleContext<PrologContext>(0);
  List<MiscContext> miscs() => getRuleContexts<MiscContext>();
  MiscContext? misc(int i) => getRuleContext<MiscContext>(i);
  DocumentContext([ParserRuleContext? parent, int? invokingState])
      : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_document;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is XMLParserListener) listener.enterDocument(this);
  }

  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is XMLParserListener) listener.exitDocument(this);
  }
}

class PrologContext extends ParserRuleContext {
  TerminalNode? XMLDeclOpen() => getToken(XMLParser.TOKEN_XMLDeclOpen, 0);
  TerminalNode? SPECIAL_CLOSE() => getToken(XMLParser.TOKEN_SPECIAL_CLOSE, 0);
  List<AttributeContext> attributes() => getRuleContexts<AttributeContext>();
  AttributeContext? attribute(int i) => getRuleContext<AttributeContext>(i);
  PrologContext([ParserRuleContext? parent, int? invokingState])
      : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_prolog;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is XMLParserListener) listener.enterProlog(this);
  }

  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is XMLParserListener) listener.exitProlog(this);
  }
}

class ContentContext extends ParserRuleContext {
  List<ChardataContext> chardatas() => getRuleContexts<ChardataContext>();
  ChardataContext? chardata(int i) => getRuleContext<ChardataContext>(i);
  List<ElementContext> elements() => getRuleContexts<ElementContext>();
  ElementContext? element(int i) => getRuleContext<ElementContext>(i);
  List<ReferenceContext> references() => getRuleContexts<ReferenceContext>();
  ReferenceContext? reference(int i) => getRuleContext<ReferenceContext>(i);
  List<TerminalNode> CDATAs() => getTokens(XMLParser.TOKEN_CDATA);
  TerminalNode? CDATA(int i) => getToken(XMLParser.TOKEN_CDATA, i);
  List<TerminalNode> PIs() => getTokens(XMLParser.TOKEN_PI);
  TerminalNode? PI(int i) => getToken(XMLParser.TOKEN_PI, i);
  List<TerminalNode> COMMENTs() => getTokens(XMLParser.TOKEN_COMMENT);
  TerminalNode? COMMENT(int i) => getToken(XMLParser.TOKEN_COMMENT, i);
  ContentContext([ParserRuleContext? parent, int? invokingState])
      : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_content;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is XMLParserListener) listener.enterContent(this);
  }

  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is XMLParserListener) listener.exitContent(this);
  }
}

class ElementContext extends ParserRuleContext {
  List<TerminalNode> OPENs() => getTokens(XMLParser.TOKEN_OPEN);
  TerminalNode? OPEN(int i) => getToken(XMLParser.TOKEN_OPEN, i);
  List<TerminalNode> Names() => getTokens(XMLParser.TOKEN_Name);
  TerminalNode? Name(int i) => getToken(XMLParser.TOKEN_Name, i);
  List<TerminalNode> CLOSEs() => getTokens(XMLParser.TOKEN_CLOSE);
  TerminalNode? CLOSE(int i) => getToken(XMLParser.TOKEN_CLOSE, i);
  ContentContext? content() => getRuleContext<ContentContext>(0);
  TerminalNode? SLASH() => getToken(XMLParser.TOKEN_SLASH, 0);
  List<AttributeContext> attributes() => getRuleContexts<AttributeContext>();
  AttributeContext? attribute(int i) => getRuleContext<AttributeContext>(i);
  TerminalNode? SLASH_CLOSE() => getToken(XMLParser.TOKEN_SLASH_CLOSE, 0);
  ElementContext([ParserRuleContext? parent, int? invokingState])
      : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_element;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is XMLParserListener) listener.enterElement(this);
  }

  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is XMLParserListener) listener.exitElement(this);
  }
}

class ReferenceContext extends ParserRuleContext {
  TerminalNode? EntityRef() => getToken(XMLParser.TOKEN_EntityRef, 0);
  TerminalNode? CharRef() => getToken(XMLParser.TOKEN_CharRef, 0);
  ReferenceContext([ParserRuleContext? parent, int? invokingState])
      : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_reference;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is XMLParserListener) listener.enterReference(this);
  }

  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is XMLParserListener) listener.exitReference(this);
  }
}

class AttributeContext extends ParserRuleContext {
  TerminalNode? Name() => getToken(XMLParser.TOKEN_Name, 0);
  TerminalNode? EQUALS() => getToken(XMLParser.TOKEN_EQUALS, 0);
  TerminalNode? STRING() => getToken(XMLParser.TOKEN_STRING, 0);
  AttributeContext([ParserRuleContext? parent, int? invokingState])
      : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_attribute;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is XMLParserListener) listener.enterAttribute(this);
  }

  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is XMLParserListener) listener.exitAttribute(this);
  }
}

class ChardataContext extends ParserRuleContext {
  TerminalNode? TEXT() => getToken(XMLParser.TOKEN_TEXT, 0);
  TerminalNode? SEA_WS() => getToken(XMLParser.TOKEN_SEA_WS, 0);
  ChardataContext([ParserRuleContext? parent, int? invokingState])
      : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_chardata;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is XMLParserListener) listener.enterChardata(this);
  }

  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is XMLParserListener) listener.exitChardata(this);
  }
}

class MiscContext extends ParserRuleContext {
  TerminalNode? COMMENT() => getToken(XMLParser.TOKEN_COMMENT, 0);
  TerminalNode? PI() => getToken(XMLParser.TOKEN_PI, 0);
  TerminalNode? SEA_WS() => getToken(XMLParser.TOKEN_SEA_WS, 0);
  MiscContext([ParserRuleContext? parent, int? invokingState])
      : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_misc;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is XMLParserListener) listener.enterMisc(this);
  }

  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is XMLParserListener) listener.exitMisc(this);
  }
}
