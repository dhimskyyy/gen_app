import 'package:flutter/material.dart';
import '../../theme/text_styles.dart';

class PermissionContent extends StatelessWidget {
  final String imageAsset;
  final String title;
  final String subtitle;
  final String description;

  const PermissionContent({
    super.key,
    required this.imageAsset,
    required this.title,
    required this.subtitle,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imageAsset, height: 120),
          const SizedBox(height: 32),
          Text(title, style: AppTextStyles.title, textAlign: TextAlign.center),
          const SizedBox(height: 12),
          Text(subtitle, style: AppTextStyles.subtitle, textAlign: TextAlign.center),
          const SizedBox(height: 12),
          Text(description, style: AppTextStyles.description, textAlign: TextAlign.center),
          const SizedBox(height: 155),
        ],
      ),
    );
  }
}
