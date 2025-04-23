import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  static Future<void> launch(String url) async {
    try {
      final Uri uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      }
    } catch (e) {
      // Handle invalid URL
    }
  }
} 