import 'package:flutter/material.dart';
import '../models/project.dart';

class ProjectsViewModel extends ChangeNotifier {
  final List<Project> _projects = [
    const Project(
      name: 'Melento',
      tagline:
          'Market insights & content delivery app for creators and brands.',
      storeUrl:
          'https://play.google.com/store/apps/details?id=com.example.melento',
      imageAsset: 'assets/images/melento.png',
    ),
    const Project(
      name: 'SignDesk',
      tagline:
          'E-sign automation app simplifying digital documentation workflows.',
      storeUrl:
          'https://play.google.com/store/apps/details?id=com.example.signdesk',
      imageAsset: 'assets/images/signdesk.png',
    ),
    const Project(
      name: 'BlockParty',
      tagline:
          'Event-based social engagement platform with background analytics.',
      storeUrl:
          'https://play.google.com/store/apps/details?id=com.example.blockparty',
      imageAsset: 'assets/images/blockparty.png',
    ),
  ];

  List<Project> get projects => _projects;
}
