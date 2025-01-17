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
    xml = xml.replaceAll(RegExp(r'<!--[\s\S]*?-->'), '');
    xml = xml.replaceAll(RegExp(r'>\s+<'), '><');
    xml = xml.trim();
    xml = xml.replaceAll(RegExp(r'\s+(?=[^<]*\>)'), ' ');
    xml = xml.replaceAll(RegExp(r'(\s+)'), ' ');
    xml = xml.replaceAll(RegExp(r'\s*=\s*'), '=');
    final cdataRegex = RegExp(r'(<!\[CDATA\[.*?\]\]>)');
    final cdataSections = <String>[];
    xml = xml.replaceAllMapped(cdataRegex, (match) {
      cdataSections.add(match.group(0)!);
      return '__CDATA_${cdataSections.length - 1}__';
    });
    for (var i = 0; i < cdataSections.length; i++) {
      xml = xml.replaceAll('__CDATA_${i}__', cdataSections[i]);
    }
    return xml;
  }
}
