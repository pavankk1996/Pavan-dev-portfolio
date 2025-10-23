import 'package:flutter/material.dart';
import '../../core/utils/constants.dart';
import '../../services/url_service.dart';
import '../common/section_title.dart';

class ResumeSection extends StatelessWidget {
  const ResumeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle('Resume'),
          const SizedBox(height: 12),
          const Text(
            'Download a PDF copy of my resume or open it in a new tab.',
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              ElevatedButton.icon(
                onPressed: () => UrlService.open(Constants.resumeUrl),
                icon: const Icon(Icons.open_in_new),
                label: const Text('Open Resume'),
              ),
              const SizedBox(width: 12),
              OutlinedButton.icon(
                onPressed: () => _printPlaceholder(context),
                icon: const Icon(Icons.print),
                label: const Text('Print'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  static void _printPlaceholder(BuildContext context) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Open resume link to print.')));
  }
}
