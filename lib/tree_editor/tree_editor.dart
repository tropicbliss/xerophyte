import 'package:flutter/material.dart';
import 'package:xerophyte/services/editor_state.dart';
import 'package:xerophyte/tree_editor/tree_view.dart';

class TreeEditor extends StatelessWidget {
  final XmlResult xmlResult;

  const TreeEditor({super.key, required this.xmlResult});

  @override
  Widget build(BuildContext context) {
    if (xmlResult case XmlSuccess xml) {
      return TreeView(document: xml.document);
    }
    if (xmlResult case XmlFailure failure) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error,
              size: 80,
              color: Colors.red,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              failure.message,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(color: Colors.red),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }
    return const SizedBox();
  }
}
