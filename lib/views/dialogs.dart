import 'package:flutter/material.dart';
import 'package:xerophyte/services/editor_state.dart';
import 'package:xerophyte/services/l10n.dart';
import 'package:xerophyte/services/launch_url_service.dart';
import 'package:xerophyte/views/transform.dart';

Future<DialogResult> showUnsavedChangesConfirmationDialog(
  BuildContext context,
) async {
  DialogResult? result = await showDialog<DialogResult>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(
          "Unsaved Changes",
        ),
        content: Text(getTranslations(context).unsaved_changes_prompt),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            onPressed: () {
              Navigator.of(context).pop(DialogResult.cancel);
            },
            child: Text(getTranslations(context).cancel),
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            onPressed: () {
              Navigator.of(context).pop(DialogResult.confirm);
            },
            child: Text(getTranslations(context).confirm),
          ),
        ],
      );
    },
  );
  return result ?? DialogResult.cancel;
}

void showTransformScreen(BuildContext context,
    {required EditorState editorState}) {
  showDialog(
    context: context,
    useSafeArea: false,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog.fullscreen(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            leading: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => Navigator.pop(context),
            ),
            title: Text(getTranslations(context).transform),
            actions: [
              IconButton(
                  onPressed: () => LaunchUrlService.launchUrl(
                      "https://en.wikipedia.org/wiki/XPath",
                      inner: true),
                  icon: const Icon(Icons.question_mark))
            ],
          ),
          body: QueryView(
            editorState: editorState,
          ),
        ),
      );
    },
  );
}
