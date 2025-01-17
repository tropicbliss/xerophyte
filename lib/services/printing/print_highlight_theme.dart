import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

final printingTheme = {
  'root': pw.TextStyle(
      color: PdfColor(
          0.2196078431372549, 0.22745098039215686, 0.25882352941176473)),
  'comment': pw.TextStyle(
      color:
          PdfColor(0.6274509803921569, 0.6274509803921569, 0.6549019607843137),
      fontStyle: pw.FontStyle.italic),
  'quote': pw.TextStyle(
      color:
          PdfColor(0.6274509803921569, 0.6274509803921569, 0.6549019607843137),
      fontStyle: pw.FontStyle.italic),
  'doctag': pw.TextStyle(
      color: PdfColor(
          0.6509803921568628, 0.14901960784313725, 0.6431372549019608)),
  'keyword': pw.TextStyle(
      color: PdfColor(
          0.6509803921568628, 0.14901960784313725, 0.6431372549019608)),
  'formula': pw.TextStyle(
      color: PdfColor(
          0.6509803921568628, 0.14901960784313725, 0.6431372549019608)),
  'section': pw.TextStyle(
      color: PdfColor(
          0.8941176470588236, 0.33725490196078434, 0.28627450980392155)),
  'name': pw.TextStyle(
      color: PdfColor(
          0.8941176470588236, 0.33725490196078434, 0.28627450980392155)),
  'selector-tag': pw.TextStyle(
      color: PdfColor(
          0.8941176470588236, 0.33725490196078434, 0.28627450980392155)),
  'deletion': pw.TextStyle(
      color: PdfColor(
          0.8941176470588236, 0.33725490196078434, 0.28627450980392155)),
  'subst': pw.TextStyle(
      color: PdfColor(
          0.8941176470588236, 0.33725490196078434, 0.28627450980392155)),
  'literal': pw.TextStyle(
      color: PdfColor(
          0.00392156862745098, 0.5176470588235295, 0.7333333333333333)),
  'string': pw.TextStyle(
      color: PdfColor(
          0.3137254901960784, 0.6313725490196078, 0.30980392156862746)),
  'regexp': pw.TextStyle(
      color: PdfColor(
          0.3137254901960784, 0.6313725490196078, 0.30980392156862746)),
  'addition': pw.TextStyle(
      color: PdfColor(
          0.3137254901960784, 0.6313725490196078, 0.30980392156862746)),
  'attribute': pw.TextStyle(
      color: PdfColor(
          0.3137254901960784, 0.6313725490196078, 0.30980392156862746)),
  'meta-string': pw.TextStyle(
      color: PdfColor(
          0.3137254901960784, 0.6313725490196078, 0.30980392156862746)),
  'attr': pw.TextStyle(
      color: PdfColor(
          0.596078431372549, 0.40784313725490196, 0.00392156862745098)),
  'variable': pw.TextStyle(
      color: PdfColor(
          0.596078431372549, 0.40784313725490196, 0.00392156862745098)),
  'template-variable': pw.TextStyle(
      color: PdfColor(
          0.596078431372549, 0.40784313725490196, 0.00392156862745098)),
  'type': pw.TextStyle(
      color: PdfColor(
          0.596078431372549, 0.40784313725490196, 0.00392156862745098)),
  'selector-class': pw.TextStyle(
      color: PdfColor(
          0.596078431372549, 0.40784313725490196, 0.00392156862745098)),
  'selector-attr': pw.TextStyle(
      color: PdfColor(
          0.596078431372549, 0.40784313725490196, 0.00392156862745098)),
  'selector-pseudo': pw.TextStyle(
      color: PdfColor(
          0.596078431372549, 0.40784313725490196, 0.00392156862745098)),
  'number': pw.TextStyle(
      color: PdfColor(
          0.596078431372549, 0.40784313725490196, 0.00392156862745098)),
  'symbol': pw.TextStyle(
      color: PdfColor(
          0.25098039215686274, 0.47058823529411764, 0.9490196078431372)),
  'bullet': pw.TextStyle(
      color: PdfColor(
          0.25098039215686274, 0.47058823529411764, 0.9490196078431372)),
  'link': pw.TextStyle(
      color: PdfColor(
          0.25098039215686274, 0.47058823529411764, 0.9490196078431372)),
  'meta': pw.TextStyle(
      color: PdfColor(
          0.25098039215686274, 0.47058823529411764, 0.9490196078431372)),
  'selector-id': pw.TextStyle(
      color: PdfColor(
          0.25098039215686274, 0.47058823529411764, 0.9490196078431372)),
  'title': pw.TextStyle(
      color: PdfColor(
          0.25098039215686274, 0.47058823529411764, 0.9490196078431372)),
  'built_in': pw.TextStyle(
      color: PdfColor(
          0.7568627450980392, 0.5176470588235295, 0.00392156862745098)),
  'title.class_': pw.TextStyle(
      color: PdfColor(
          0.7568627450980392, 0.5176470588235295, 0.00392156862745098)),
  'class-title': pw.TextStyle(
      color: PdfColor(
          0.7568627450980392, 0.5176470588235295, 0.00392156862745098)),
  'emphasis': pw.TextStyle(fontStyle: pw.FontStyle.italic),
  'strong': pw.TextStyle(fontWeight: pw.FontWeight.bold),
};
