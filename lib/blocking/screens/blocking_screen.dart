import 'package:flutter/material.dart';
import '../widgets/section_card.dart';
import '../../theme/app_colors.dart';
import '../../theme/text_styles.dart';
import '../screens/app_list_screen.dart';
import '../screens/site_list_screen.dart';
import '../screens/keyword_list_screen.dart';

class BlockingScreen extends StatelessWidget {
  const BlockingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.deadLine,
        toolbarHeight: 70,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Pemblokiran dan Pembatasan', style: AppTextStyles.textWhite),
            const SizedBox(height: 4),
            Text(
              'Lindungi anak dari konten berbahaya',
              style: AppTextStyles.extraSmallWhite,
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [
          SectionCard(
  title: "Blokir Aplikasi",
  iconPath: "assets/images/shield.png",
  children: [
    _appItem("TikTok", "assets/images/tiktok.png", "Diblokir", "Media Sosial", true),
    _appItem("Mobile Legends", "assets/images/mobilelegend.png", "Diblokir", "Game", true),
    _appItem("WhatsApp", "assets/images/whatsapp.png", "Diblokir", "Pesan/Call", true),
    _addButton(
      context,
      "Tambah Aplikasi untuk Diblokir",
      () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const AppListScreen()),
        );
      },
    ),
  ],
),
SectionCard(
  title: "Blokir Situs Web",
  iconPath: "assets/images/shield.png",
  children: [
    _allItem("Situs Dewasa", "Konten tidak pantas", true),
    _allItem("Judi Online", "Konten tidak pantas", true),
    _allItem("Media Sosial", "Facebook, X, dll", false),
    _addButton(
      context,
      "Tambah Situs untuk Diblokir",
      () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const SiteListScreen()),
        );
      },
    ),
  ],
),
SectionCard(
  title: "Blokir Kata Kunci",
  iconPath: "assets/images/shield.png",
  children: [
    _allItem("Kata Kasar", "12 Kata", true),
    _allItem("Konten Dewasa", "8 Kata", true),
    _allItem("Kekerasan", "19 Kata", false),
    _addButton(
      context,
      "Tambah Kata Kunci Baru",
      () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const KeywordListScreen()),
        );
      },
    ),
  ],
),

          SectionCard(
            title: "Filter Gambar",
            iconPath: "assets/images/shield.png",
            children: [
              const FilterImageToggleItem(initialValue: true), // awalnya ON
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

/// === HELPER WIDGETS ===
static Widget _addButton(BuildContext context, String label, VoidCallback onPressed) {
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.only(top: 12),
    child: ElevatedButton.icon(
      onPressed: onPressed,
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



  static Widget _appItem(
    String title,
    String iconPath,
    String badge,
    String category,
    bool isBlocked,
  ) {
    return _itemContainer(
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
              CustomSwitch(initialValue: isBlocked),
            ],
          ),
        ],
      ),
    );
  }

  static Widget _allItem(String title, String description, bool isBlocked) {
    return _itemContainer(
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
              CustomSwitch(initialValue: isBlocked),
            ],
          ),
        ],
      ),
    );
  }

  static Widget _badgeLabel(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        color: AppColors.redSoft,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(text, style: AppTextStyles.badgeText),
    );
  }

  /// === REUSABLE ITEM CONTAINER ===
  static Widget _itemContainer({required Widget child}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(16),
      ),
      child: child,
    );
  }
}

/// Statistik Box
Widget _statBox(String value, String label) {
  return Expanded(
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
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

/// === Custom Switch Reusable ===
class CustomSwitch extends StatefulWidget {
  final bool initialValue;

  const CustomSwitch({super.key, required this.initialValue});

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.9,
      child: Switch(
        value: _value,
        onChanged: (val) {
          setState(() {
            _value = val;
          });
        },
        activeColor: Colors.white,
        activeTrackColor: AppColors.primary,
        inactiveThumbColor: Colors.white,
        inactiveTrackColor: Colors.grey.shade400,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }
}

/// === Filter Gambar Toggle ===
class FilterImageToggleItem extends StatefulWidget {
  final bool initialValue;

  const FilterImageToggleItem({
    super.key,
    required this.initialValue,
  });

  @override
  State<FilterImageToggleItem> createState() => _FilterImageToggleItemState();
}

class _FilterImageToggleItemState extends State<FilterImageToggleItem> {
  late bool _isOn;

  @override
  void initState() {
    super.initState();
    _isOn = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.greySoft,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Title Row with Switch
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Sensor Gambar Tidak Pantas", style: AppTextStyles.itemTitle),
              CustomSwitch(initialValue: _isOn),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            "Otomatis blur gambar yang tidak sesuai",
            style: AppTextStyles.categoryLabel,
          ),
          const SizedBox(height: 4),
          Text(
            "AI akan mendeteksi dan memburamkan gambar secara otomatis",
            style: AppTextStyles.textReguler,
          ),
        ],
      ),
    );
  }
}
