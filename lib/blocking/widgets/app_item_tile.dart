import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/text_styles.dart';
import '../models/app_model.dart';

class AppItemTile extends StatelessWidget {
  final AppModel app;
  final ValueChanged<bool> onToggle;

  const AppItemTile({super.key, required this.app, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Row(
        children: [
          Image.asset(app.iconPath, width: 32, height: 32),
          const SizedBox(width: 12),
          Expanded(child: Text(app.name, style: AppTextStyles.textReguler)),
          Switch(
            value: app.isBlocked,
            onChanged: onToggle,
            activeColor: AppColors.primary,
          ),
        ],
      ),
    );
  }
}
