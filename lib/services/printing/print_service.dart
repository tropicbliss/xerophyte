import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:xerophyte/services/l10n.dart';
import 'package:xerophyte/services/printing/print_highlight_theme.dart';
import 'package:xerophyte/services/printing/print_highlight_view.dart';
import 'package:xerophyte/services/toast_notification.dart';
import 'package:xerophyte/services/xml_utils.dart';

class PrintService {
  static Future<void> printDocument(
    BuildContext context, {
    required String sourceCode,
  }) async {
    try {
      sourceCode = XmlUtils.prettifyXmlString(sourceCode);
    } catch (e) {
      // don't format source code if not valid xml
    }
    try {
      PrintHighlightView highlightView =
          PrintHighlightView(sourceCode, language: "xml", theme: printingTheme);
      final pdf = pw.Document();
      pdf.addPage(pw.MultiPage(build: (context) => [highlightView.build()]));
      Printing.layoutPdf(
        onLayout: (format) async => pdf.save(),
      );
    } catch (e) {
      Toast.error(getTranslations(context).unexpectedError);
      rethrow;
    }
  }
}
