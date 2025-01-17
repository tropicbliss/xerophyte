import 'package:flutter/material.dart';
import 'package:xerophyte/services/editor_state.dart';

class QueryView extends StatefulWidget {
  const QueryView({super.key, required this.editorState});

  final EditorState editorState;

  @override
  State<QueryView> createState() => _QueryViewState();
}

class _QueryViewState extends State<QueryView> {
  String _queryString = "";

  @override
  Widget build(BuildContext context) {
    XPathResult toXmlTransform() {
      return widget.editorState.transform(_queryString);
    }

    return Scrollbar(
      thumbVisibility: true,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "XPath expression"),
                onChanged: (text) {
                  setState(() {
                    _queryString = text;
                  });
                },
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(4),
                ),
                padding: EdgeInsets.all(8.0),
                child: Builder(builder: (context) {
                  XPathResult result = toXmlTransform();
                  return SelectableText(
                    result.message,
                    style: TextStyle(
                        fontFamily: 'monospace',
                        fontSize: 14,
                        color: result.isError ? Colors.red : null),
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
