import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/text_styles.dart';

class SiteListItem extends StatelessWidget {
  final String siteUrl;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const SiteListItem({
    super.key,
    required this.siteUrl,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.lightGrey),
      ),
      child: Row(
        children: [
          Icon(Icons.language, color: AppColors.black),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              siteUrl,
              style: AppTextStyles.textReguler,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          IconButton(
            icon: Icon(Icons.edit, color: AppColors.primary),
            onPressed: onEdit,
          ),
          IconButton(
            icon: Icon(Icons.delete_outline, color: AppColors.deleteRed),
            onPressed: onDelete,
          ),
        ],
      ),
    );
  }
}
