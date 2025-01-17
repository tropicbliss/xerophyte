import 'package:flutter/material.dart';
import 'package:xerophyte/services/l10n.dart';
import 'package:xerophyte/views/main_layout.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => getTranslations(context).appName,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.lime, brightness: Brightness.light),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.lime, brightness: Brightness.dark),
        useMaterial3: true,
      ),
      home: const MainLayout(),
    );
  }
}
