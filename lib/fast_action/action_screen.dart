import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/text_styles.dart';

class ActionScreen extends StatefulWidget {
  const ActionScreen({super.key});

  @override
  State<ActionScreen> createState() => _ActionScreenState();
}

class _ActionScreenState extends State<ActionScreen> {
  bool isInternetBlocked = false;
  bool isAppBlocked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 18,
            color: AppColors.textDark,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Aksi Cepat",
          style: AppTextStyles.itemTitle.copyWith(
            color: AppColors.textDark,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          children: [
            _buildActionItem(
              iconPath: "assets/icons/flash_line.png",
              title: "Blokir Internet",
              value: isInternetBlocked,
              onChanged: (val) {
                setState(() {
                  isInternetBlocked = val;
                });
              },
            ),
            const SizedBox(height: 12),
            _buildActionItem(
              iconPath: "assets/icons/app_block.png",
              title: "Blokir Aplikasi",
              value: isAppBlocked,
              onChanged: (val) {
                setState(() {
                  isAppBlocked = val;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionItem({
    required String iconPath,
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowSoft,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Center(child: Image.asset(iconPath, width: 20, height: 20)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: AppTextStyles.itemTitle.copyWith(
                color: AppColors.textDark,
                fontSize: 14,
              ),
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: AppColors.primary,
          ),
        ],
      ),
    );
  }
}
