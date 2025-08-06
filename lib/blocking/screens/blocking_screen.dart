import 'package:flutter/material.dart';
import '../widgets/section_card.dart';
import '../widgets/filter_image.dart';
import '../../theme/app_colors.dart';
import '../../theme/text_styles.dart';

class BlockingScreen extends StatelessWidget {
  const BlockingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Pemblokiran & Pembatasan",
          style: AppTextStyles.titleAppBar,
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [
          SectionCard(
            title: "Blokir Aplikasi",
            iconPath: "assets/images/shield.png",
            children: [
              _appItem(
                "TikTok",
                "assets/images/tiktok.png",
                "Diblokir",
                "Media Sosial",
                true,
              ),
              _appItem(
                "Mobile Legends",
                "assets/images/mobilelegend.png",
                "Diblokir",
                "Game",
                true,
              ),
              _appItem(
                "WhatsApp",
                "assets/images/whatsapp.png",
                "Diblokir",
                "Pesan/Call",
                true,
              ),
              _addButton("Tambah Aplikasi untuk Diblokir"),
            ],
          ),
          SectionCard(
            title: "Blokir Situs Web",
            iconPath: "assets/images/shield.png",
            children: [
              _allItem("Situs Dewasa", "Konten tidak pantas", true),
              _allItem("Judi Online", "Konten tidak pantas", true),
              _allItem("Media Sosial", "Facebook, X, dll", false),
              _addButton("Tambah Situs untuk Diblokir"),
            ],
          ),
          SectionCard(
            title: "Blokir Kata Kunci",
            iconPath: "assets/images/shield.png",
            children: [
              _allItem("Kata Kasar", "12 Kata", true),
              _allItem("Konten Dewasa", "8 Kata", true),
              _allItem("Kekerasan", "19 Kata", false),
              _addButton("Tambah Kata Kunci Baru"),
            ],
          ),
          SectionCard(
  title: "Filter Gambar",
  iconPath: "assets/images/shield.png",
  children: [
    const FilterImageToggleItem(isOn: true),
    const SizedBox(height: 16),
    Row(
      children: [
        _statBox("247", "Gambar Diblur"),
        const SizedBox(width: 12),
        _statBox("95,8%", "Akurasi Filter"),
      ],
    ),
  ],
),

        ],
      ),
    );
  }

  Widget _addButton(String label) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 12),
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.add, color: Colors.white),
        label: Text(label, style: AppTextStyles.addButton),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          padding: const EdgeInsets.symmetric(vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          elevation: 0,
        ),
      ),
    );
  }

  Widget _appItem(
    String title,
    String iconPath,
    String badge,
    String category,
    bool isBlocked,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.greySoft,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              iconPath,
              width: 38,
              height: 38,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.itemTitle),
                const SizedBox(height: 4),
                Text(category, style: AppTextStyles.categoryLabel),
              ],
            ),
          ),
          Row(
            children: [
              _badgeLabel(badge),
              const SizedBox(width: 8),
              _customSwitch(isBlocked),
            ],
          ),
        ],
      ),
    );
  }

  Widget _customSwitch(bool value) {
    return Transform.scale(
      scale: 0.9,
      child: Switch(
        value: value,
        onChanged: (_) {},
        activeColor: Colors.white,
        activeTrackColor: AppColors.primary,
        inactiveThumbColor: Colors.white,
        inactiveTrackColor: Colors.grey.shade400,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }

  Widget _allItem(String title, String description, bool isBlocked) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.greySoft, // abu-abu terang
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.itemTitle),
                const SizedBox(height: 4),
                Text(description, style: AppTextStyles.categoryLabel),
              ],
            ),
          ),
          Row(
            children: [
              _badgeLabel("Diblokir"),
              const SizedBox(width: 8),
              _customSwitch(isBlocked),
            ],
          ),
        ],
      ),
    );
  }

  Widget _badgeLabel(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        color: AppColors.redSoft,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(text, style: AppTextStyles.badgeText),
    );
  }
}

Widget _statBox(String value, String label) {
  return Expanded(
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.greySoft,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(value, style: AppTextStyles.itemTitle.copyWith(fontSize: 20)),
          const SizedBox(height: 4),
          Text(label, style: AppTextStyles.categoryLabel),
        ],
      ),
    ),
  );
}
