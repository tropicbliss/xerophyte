import 'package:highlight/highlight.dart' show highlight, Node;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

/// Highlight Flutter Widget
class PrintHighlightView {
  /// The original code to be highlighted
  final String source;

  /// Highlight language
  ///
  /// It is recommended to give it a value for performance
  ///
  /// [All available languages](https://github.com/pd4d10/highlight/tree/master/highlight/lib/languages)
  final String? language;

  /// Highlight theme
  ///
  /// [All available themes](https://github.com/pd4d10/highlight/blob/master/flutter_highlight/lib/themes)
  final Map<String, pw.TextStyle> theme;

  /// Padding
  final pw.EdgeInsetsGeometry? padding;

  /// Text styles
  ///
  /// Specify text styles such as font family and font size
  final pw.TextStyle? textStyle;

  PrintHighlightView(
    this.source, {
    this.language,
    this.theme = const {},
    this.padding,
    this.textStyle,
  });

  List<pw.TextSpan> _convert(List<Node> nodes) {
    List<pw.TextSpan> spans = [];
    var currentSpans = spans;
    List<List<pw.TextSpan>> stack = [];

    traverse(Node node) {
      if (node.value != null) {
        currentSpans.add(node.className == null
            ? pw.TextSpan(text: node.value)
            : pw.TextSpan(text: node.value, style: theme[node.className!]));
      } else if (node.children != null) {
        List<pw.TextSpan> tmp = [];
        currentSpans
            .add(pw.TextSpan(children: tmp, style: theme[node.className!]));
        stack.add(currentSpans);
        currentSpans = tmp;

        for (var n in node.children!) {
          traverse(n);
          if (n == node.children!.last) {
            currentSpans = stack.isEmpty ? spans : stack.removeLast();
          }
        }
      }
    }

    for (var node in nodes) {
      traverse(node);
    }

    return spans;
  }

  static const _rootKey = 'root';
  static const _defaultFontColor = PdfColor(1, 0, 0);

  static final _defaultFont = pw.Font.courier();

  pw.Widget build() {
    var tempTextStyle = pw.TextStyle(
      font: _defaultFont,
      color: theme[_rootKey]?.color ?? _defaultFontColor,
    );
    if (textStyle != null) {
      tempTextStyle = tempTextStyle.merge(textStyle);
    }

    return pw.RichText(
        overflow: pw.TextOverflow.span,
        text: pw.TextSpan(
          style: tempTextStyle,
          children:
              _convert(highlight.parse(source, language: language).nodes!),
        ));
  }
}
