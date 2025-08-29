import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/text_styles.dart';
import '../bottom_nav.dart';

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
          onPressed: () =>
                    Navigator.pushReplacementNamed(context, '/home'),
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
                if (val) {
                  _showBlockInternetDialog(context);
                } else {
                  setState(() {
                    isInternetBlocked = false;
                  });
                }
              },
            ),
            const SizedBox(height: 12),
            _buildActionItem(
              iconPath: "assets/icons/app_block.png",
              title: "Blokir Aplikasi",
              value: isAppBlocked,
              onChanged: (val) {
                if (val) {
                  _showBlockAppDialog(context);
                } else {
                  setState(() {
                    isAppBlocked = false;
                  });
                }
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 1,
        onTap: (index) {
          print("Navigasi ke index: $index");
        },
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

  // ---------- DIALOG BLOKIR INTERNET ----------
  void _showBlockInternetDialog(BuildContext context) {
    String? selectedOption = "manual"; // default

    showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        return StatefulBuilder(
          builder: (ctx, setState) {
            return _buildBlockDialog(
              title: "Blokir Internet",
              description:
                  "Saat dinyalakan, akses penggunaan internet di perangkat anak "
                  "akan diblokir secara instan sampai waktu yang ditentukan berakhir "
                  "atau fitur ini dimatikan secara manual.",
              selectedOption: selectedOption,
              onOptionChanged: (val) => setState(() => selectedOption = val),
              onConfirm: () => Navigator.pop(ctx, true),
              onCancel: () => Navigator.pop(ctx, false),
            );
          },
        );
      },
    ).then((result) {
      setState(() {
        isInternetBlocked = result == true;
      });
    });
  }

  // ---------- DIALOG BLOKIR APLIKASI ----------
  void _showBlockAppDialog(BuildContext context) {
    String? selectedOption = "manual"; // default

    showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        return StatefulBuilder(
          builder: (ctx, setState) {
            return _buildBlockDialog(
              title: "Blokir Aplikasi",
              description:
                  "Saat dinyalakan, akses ke aplikasi di perangkat anak "
                  "akan diblokir sesuai durasi yang dipilih atau sampai dimatikan manual.",
              selectedOption: selectedOption,
              onOptionChanged: (val) => setState(() => selectedOption = val),
              onConfirm: () => Navigator.pop(ctx, true),
              onCancel: () => Navigator.pop(ctx, false),
            );
          },
        );
      },
    ).then((result) {
      setState(() {
        isAppBlocked = result == true;
      });
    });
  }

  // ---------- WIDGET DIALOG GENERIK ----------
  Widget _buildBlockDialog({
    required String title,
    required String description,
    required String? selectedOption,
    required ValueChanged<String?> onOptionChanged,
    required VoidCallback onConfirm,
    required VoidCallback onCancel,
  }) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          Text(
            title,
            style: AppTextStyles.itemTitle.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: AppTextStyles.textReguler.copyWith(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 20),

          RadioListTile<String>(
            title: const Text("1 jam"),
            value: "1jam",
            groupValue: selectedOption,
            onChanged: onOptionChanged,
          ),
          RadioListTile<String>(
            title: const Text("2 jam"),
            value: "2jam",
            groupValue: selectedOption,
            onChanged: onOptionChanged,
          ),
          RadioListTile<String>(
            title: const Text("Sampai dimatikan secara manual"),
            value: "manual",
            groupValue: selectedOption,
            onChanged: onOptionChanged,
          ),

          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onConfirm,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: const Text("Oke"),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: onCancel,
              child: const Text("Batal"),
            ),
          ),
        ],
      ),
    );
  }
}
