import 'package:flutter/material.dart';
import '../../../config/theme/app_spacing.dart';

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.m),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }
}