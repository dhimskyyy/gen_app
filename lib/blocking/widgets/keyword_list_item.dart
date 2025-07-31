import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/text_styles.dart';

class KeywordListItem extends StatelessWidget {
  final String keyword;
  final VoidCallback onDelete;

  const KeywordListItem({
    super.key,
    required this.keyword,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(Icons.lock_outline, color: AppColors.primary),
          const SizedBox(width: 12),
          Expanded(child: Text(keyword, style: AppTextStyles.textBlack)),
          IconButton(
            icon: Icon(Icons.delete, color: AppColors.deleteRed),
            onPressed: onDelete,
          ),
        ],
      ),
    );
  }
}
