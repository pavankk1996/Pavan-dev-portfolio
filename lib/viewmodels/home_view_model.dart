import 'package:flutter/material.dart';
import '../core/utils/constants.dart';
import '../services/url_service.dart';

class HomeViewModel extends ChangeNotifier {
  final String name = 'Pavan Kumar S';
  final String tagline =
      'Senior Flutter & Kotlin SME | 6.6+ years building high-performance mobile apps';
  String heroImage = 'assets/images/hero_placeholder.png';

  void openResume() => UrlService.open(Constants.resumeUrl);
}
