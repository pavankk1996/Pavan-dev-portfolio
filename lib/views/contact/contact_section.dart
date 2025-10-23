import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/contact_view_model.dart';
import '../common/section_title.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<ContactViewModel>(context, listen: false);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 42, horizontal: 28),
      constraints: const BoxConstraints(maxWidth: 1000),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle('Contact'),
          const SizedBox(height: 12),
          const Text(
            'I’m available for senior engineering roles, advisory, and technical interviews.',
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 12,
            children: [
              ElevatedButton.icon(
                onPressed: () => vm.openEmail(),
                icon: const Icon(Icons.email),
                label: Text(vm.email),
              ),
              OutlinedButton.icon(
                onPressed: () => vm.openLink(vm.linkedin),
                icon: const Icon(Icons.link),
                label: const Text('LinkedIn'),
              ),
              OutlinedButton.icon(
                onPressed: () => vm.openLink(vm.github),
                icon: const Icon(Icons.code),
                label: const Text('GitHub'),
              ),
            ],
          ),
          const SizedBox(height: 18),
          const Text(
            'Or use the email above — I typically respond within 24–48 hours.',
          ),
        ],
      ),
    );
  }
}
