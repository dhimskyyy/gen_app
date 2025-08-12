import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/text_styles.dart';

class RequestItem extends StatelessWidget {
  final String iconPath;
  final String title;
  final String message;
  final String time;
  final VoidCallback onAccept;
  final VoidCallback onReject;

  const RequestItem({
    Key? key,
    required this.iconPath,
    required this.title,
    required this.message,
    required this.time,
    required this.onAccept,
    required this.onReject,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowSoft,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(iconPath, width: 32, height: 32),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.itemTitle),
                const SizedBox(height: 2),
                Text(message, style: AppTextStyles.subtitle),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(time, style: AppTextStyles.categoryLabel),
              const SizedBox(height: 8),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: onReject,
                    child: const Icon(Icons.close, color: AppColors.deleteRed),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: onAccept,
                    child: const Icon(Icons.check, color: AppColors.greenSoft),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
