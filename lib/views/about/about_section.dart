import 'package:flutter/material.dart';
import '../common/section_title.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 28),
      constraints: const BoxConstraints(maxWidth: 1100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle('About'),
          const SizedBox(height: 12),
          const Text(
            'I’m a Subject Matter Expert in mobile engineering with 6.6+ years focused on Flutter and Kotlin. I design modular, testable apps using clean architecture and robust CI/CD. I’ve led teams to ship production apps used by businesses — improving performance, automating releases, and building reusable components that speed delivery.',
            style: TextStyle(height: 1.5),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: const [
              _Bullet(
                title: 'Micro-frontend architecture',
                subtitle:
                    'Designed modular features & micro-frontend approach for faster dev cycles.',
              ),
              _Bullet(
                title: 'Performance',
                subtitle:
                    'Used Isolates & caching to reduce app load time by ~40%.',
              ),
              _Bullet(
                title: 'CI/CD',
                subtitle:
                    'Automated Bitbucket & Codemagic pipelines reducing deployment effort by ~40%.',
              ),
              _Bullet(
                title: 'Reusable Widgets',
                subtitle:
                    'Built component libraries reducing UI implementation time by ~25%.',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Bullet extends StatelessWidget {
  final String title;
  final String subtitle;
  const _Bullet({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width > 900 ? 500 : double.infinity,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListTile(
            leading: const Icon(
              Icons.check_circle_outline,
              color: Colors.indigo,
            ),
            title: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: Text(subtitle),
          ),
        ),
      ),
    );
  }
}
