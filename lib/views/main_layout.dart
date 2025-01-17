import 'package:flutter/material.dart';
import 'package:xerophyte/code_editor/xml_editor.dart';
import 'package:xerophyte/services/editor_state.dart';
import 'package:xerophyte/services/l10n.dart';
import 'package:xerophyte/services/printing/print_service.dart';
import 'package:xerophyte/views/about.dart';
import 'package:xerophyte/views/dialogs.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  late final Future<EditorState> _editorState;

  @override
  void initState() {
    super.initState();
    _editorState = EditorState.create();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<EditorState>(
        future: _editorState,
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Scaffold(
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              body: SizedBox.expand(),
            );
          }

          EditorState editorState = snapshot.data!;

          bool isModified = editorState.isModified;
          bool isValidXml = editorState.isValidXml;

          TextStyle? titleTheme = editorState.path == null
              ? Theme.of(context).textTheme.titleLarge
              : Theme.of(context).textTheme.titleMedium;

          return DefaultTabController(
            initialIndex: 0,
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                  backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                          maxLines: 1,
                          text: TextSpan(children: [
                            if (isModified)
                              TextSpan(text: "*", style: titleTheme),
                            TextSpan(
                                text: getTranslations(context).appName,
                                style: titleTheme),
                          ])),
                      if (editorState.path != null)
                        Text(
                          editorState.path!.split("/").last,
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface
                                        .withAlpha(153),
                                  ),
                        )
                    ],
                  ),
                  bottom: const TabBar(tabs: [
                    Tooltip(
                      message: "Raw XML",
                      child: Tab(
                        icon: Icon(
                          Icons.code,
                        ),
                      ),
                    ),
                    Tooltip(
                      message: "XML Tree",
                      child: Tab(
                        icon: Icon(Icons.account_tree),
                      ),
                    ),
                  ]),
                  actions: [
                    MenuAnchor(
                      menuChildren: <Widget>[
                        MenuItemButton(
                          onPressed: () async {
                            await editorState.reset(
                                progressLossConfirmationDialog: () =>
                                    showUnsavedChangesConfirmationDialog(
                                        context));
                            setState(() {});
                          },
                          child: Text(getTranslations(context).l10n_new),
                        ),
                        MenuItemButton(
                          onPressed: () async {
                            await editorState.open(
                              progressLossConfirmationDialog: () =>
                                  showUnsavedChangesConfirmationDialog(context),
                            );
                            setState(() {});
                          },
                          child: Text(getTranslations(context).open),
                        ),
                        MenuItemButton(
                          onPressed: isModified
                              ? () async {
                                  await editorState.save();
                                  setState(() {});
                                }
                              : null,
                          child: Text(getTranslations(context).save),
                        ),
                      ],
                      builder: (_, MenuController controller, Widget? child) {
                        return IconButton(
                          onPressed: () {
                            if (controller.isOpen) {
                              controller.close();
                            } else {
                              controller.open();
                            }
                          },
                          icon: const Icon(Icons.file_open),
                        );
                      },
                    ),
                    MenuAnchor(
                      menuChildren: <Widget>[
                        SubmenuButton(menuChildren: <Widget>[
                          MenuItemButton(
                            onPressed: isValidXml
                                ? () {
                                    setState(() {
                                      editorState.format();
                                    });
                                  }
                                : null,
                            child: Text(getTranslations(context).format),
                          ),
                          MenuItemButton(
                            onPressed: isValidXml
                                ? () {
                                    setState(() {
                                      editorState.minify();
                                    });
                                  }
                                : null,
                            child: Text(getTranslations(context).minify),
                          ),
                          MenuItemButton(
                            onPressed: isValidXml
                                ? () => showTransformScreen(context,
                                    editorState: editorState)
                                : null,
                            child: Text(getTranslations(context).transform),
                          ),
                        ], child: const Text("Toolbox")),
                        MenuItemButton(
                          onPressed: () {
                            editorState.openFindPanel();
                          },
                          child: Text(getTranslations(context).find),
                        ),
                        MenuItemButton(
                          onPressed: () {
                            editorState.selectAll();
                          },
                          child: Text(getTranslations(context).selectAll),
                        ),
                        MenuItemButton(
                          onPressed: () async {
                            await PrintService.printDocument(context,
                                sourceCode: editorState.sourceCode);
                          },
                          child: Text(getTranslations(context).print),
                        ),
                        MenuItemButton(
                          onPressed: () => showAbout(context),
                          child: Text(getTranslations(context).about),
                        ),
                      ],
                      builder: (_, MenuController controller, Widget? child) {
                        return IconButton(
                          onPressed: () {
                            if (controller.isOpen) {
                              controller.close();
                            } else {
                              controller.open();
                            }
                          },
                          icon: const Icon(Icons.more_vert),
                        );
                      },
                    ),
                  ]),
              bottomNavigationBar: BottomAppBar(
                color: Theme.of(context).colorScheme.inversePrimary,
                height: 40,
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                child: IconTheme(
                    data: IconThemeData(
                        color: Theme.of(context).colorScheme.onPrimary),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          tooltip: getTranslations(context).save,
                          icon: const Icon(Icons.save),
                          onPressed: editorState.isModified
                              ? () async {
                                  await editorState.save();
                                  setState(() {});
                                }
                              : null,
                        ),
                        const Spacer(),
                        IconButton(
                          tooltip: getTranslations(context).undo,
                          icon: const Icon(Icons.undo),
                          onPressed: editorState.canUndo
                              ? () {
                                  setState(() {
                                    editorState.undo();
                                  });
                                }
                              : null,
                        ),
                        IconButton(
                          tooltip: getTranslations(context).redo,
                          icon: const Icon(Icons.redo),
                          onPressed: editorState.canRedo
                              ? () {
                                  setState(() {
                                    editorState.redo();
                                  });
                                }
                              : null,
                        ),
                      ],
                    )),
              ),
              body: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    XmlEditor(
                      editorController: editorState.editorController,
                      findController: editorState.findController,
                      onChange: () {
                        setState(() {});
                      },
                      isValidXml: isValidXml,
                    ),
                    Center(
                      child: Text(
                        'XML Tree view',
                      ),
                    ),
                  ]),
            ),
          );
        });
  }
}
