import 'package:url_launcher/url_launcher.dart';

class UrlService {
  static Future<void> open(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not open $url');
    }
  }

  static Future<void> mailTo(String email) async {
    final uri = Uri(scheme: 'mailto', path: email);
    if (!await launchUrl(uri)) {
      throw Exception('Could not open mail client for $email');
    }
  }
}
