import 'package:flutter/cupertino.dart';
import 'package:xml/xml.dart';

class TreeView extends StatelessWidget {
  final XmlDocument document;

  const TreeView({super.key, required this.document});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'XML Tree view',
      ),
    );
  }
}
