import 'package:flutter/material.dart';
import '../core/utils/constants.dart';
import '../services/url_service.dart';

class HomeViewModel extends ChangeNotifier {
  final String name = 'Pavan Kumar S';
  final String tagline =
      'Flutter & Kotlin Expert | Architecting Clean, Scalable, and High-Performance Mobile Apps.';
  String profileImage = 'assets/images/profile_pic.jpg';
  String getInTouchTxt = 'Get in Touch';
  String linkedInImg = 'assets/images/linkedin_img.png';
  String downloadbtnTxt = 'Download CV';
  String cvbtnImg = 'assets/images/cv_img.png';
  void openResume() => UrlService.open(Constants.resumeUrl);
}
