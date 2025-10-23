import 'package:flutter/material.dart';
import '../../core/utils/constants.dart';
import '../../services/url_service.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18),
      color: Colors.indigo[50],
      child: Column(
        children: [
          Text(
            '© ${DateTime.now().year} Pavan Kumar S',
            style: const TextStyle(color: Colors.indigo),
          ),
          const SizedBox(height: 6),
          GestureDetector(
            onTap: () => UrlService.mailTo(Constants.email),
            child: Text(
              Constants.email,
              style: const TextStyle(decoration: TextDecoration.underline),
            ),
          ),
        ],
      ),
    );
  }
}
