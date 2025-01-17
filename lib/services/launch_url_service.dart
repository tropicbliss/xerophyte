import 'package:url_launcher/url_launcher.dart' as launch_url_inner
    show launchUrl;
import 'package:url_launcher/url_launcher.dart';

class LaunchUrlService {
  static void launchUrl(String url, {bool inner = false}) {
    LaunchMode mode =
        inner ? LaunchMode.inAppBrowserView : LaunchMode.externalApplication;
    launch_url_inner.launchUrl(Uri.parse(url), mode: mode);
  }
}
