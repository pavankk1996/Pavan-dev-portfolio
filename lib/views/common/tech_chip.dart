import 'package:flutter/material.dart';

class TechChip extends StatelessWidget {
  final String label;
  const TechChip(this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.indigo.shade50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );
  }
}
