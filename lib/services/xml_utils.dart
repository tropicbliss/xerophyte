import 'package:xml/xml.dart';

class XmlUtils {
  static String prettifyXmlString(String source) {
    final document = XmlDocument.parse(source);
    return prettifyXml(document);
  }

  static String prettifyXml(XmlDocument document) {
    return document.toXmlString(
        pretty: true, spaceBeforeSelfClose: (node) => true);
  }

  static String minifyXml(String xml) {
    return xml
        .replaceAll(
            RegExp(r'\<![ \r\n\t]*(--([^\-]|[\r\n]|-[^\-])*--[ \r\n\t]*)\>'),
            '')
        .replaceAll(RegExp(r'[ \r\n\t]{1,}xmlns'), ' xmlns')
        .replaceAll(RegExp(r'>\s{0,}<'), '><');
  }
}
