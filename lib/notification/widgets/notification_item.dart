import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/text_styles.dart';

class NotificationItem extends StatelessWidget {
  final String iconPath;
  final String title;
  final String message;
  final String time;

  const NotificationItem({
    Key? key,
    required this.iconPath,
    required this.title,
    required this.message,
    required this.time,
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
              const Icon(Icons.more_horiz, size: 20, color: AppColors.grey),
            ],
          ),
        ],
      ),
    );
  }
}
