import 'package:flutter/material.dart';
import '../core/utils/constants.dart';
import '../services/url_service.dart';

class ContactViewModel extends ChangeNotifier {
  String email = Constants.email;
  String linkedin = Constants.linkedin;
  String github = Constants.github;

  Future<void> openEmail() async {
    await UrlService.mailTo(email);
  }

  Future<void> openLink(String url) async {
    await UrlService.open(url);
  }
}
