import 'package:flutter/material.dart';
import '../../theme/text_styles.dart';

class SectionCard extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final String? iconPath;

  const SectionCard({
    super.key,
    required this.title,
    required this.children,
    this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 2),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (iconPath != null) ...[
                Image.asset(iconPath!, width: 16, height: 16),
                const SizedBox(width: 6),
              ],
              Expanded(
                child: Text(
                  title,
                  style: AppTextStyles.textReguler.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }
}
