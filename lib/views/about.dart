import 'package:flutter/material.dart';
import 'package:styled_text/styled_text.dart';
import 'package:xerophyte/config/app_config.dart';
import 'package:xerophyte/services/l10n.dart';
import 'package:xerophyte/services/launch_url_service.dart';

void showAbout(BuildContext context) {
  var textStyle = Theme.of(context).textTheme.bodyMedium;
  showAboutDialog(
      context: context,
      applicationName: getTranslations(context).appName,
      applicationIcon: const FlutterLogo(),
      applicationVersion: AppConfig.appVersion,
      applicationLegalese:
          "\u{a9} ${AppConfig.copyrightYear} ${AppConfig.author}",
      children: [
        const SizedBox(height: 24),
        StyledText(
          text: getTranslations(context).aboutDescription,
          style: textStyle,
          tags: {
            'a': StyledTextActionTag((text, attrs) {
              final action = attrs['action'];
              switch (action) {
                case "OPEN_REPO":
                  LaunchUrlService.launchUrl(AppConfig.repoUrl);
              }
            },
                style: textStyle?.copyWith(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ))
          },
        ),
      ]);
}
