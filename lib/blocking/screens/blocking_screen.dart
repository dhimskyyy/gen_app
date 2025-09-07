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
              AppItem(
                title: "TikTok",
                iconPath: "assets/images/tiktok.png",
                category: "Media Sosial",
                initialValue: true,
              ),
              AppItem(
                title: "Mobile Legends",
                iconPath: "assets/images/mobilelegend.png",
                category: "Game",
                initialValue: true,
              ),
              AppItem(
                title: "WhatsApp",
                iconPath: "assets/images/whatsapp.png",
                category: "Pesan/Call",
                initialValue: false,
              ),
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
              GeneralItem(
                title: "Situs Dewasa",
                description: "Konten tidak pantas",
                initialValue: true,
              ),
              GeneralItem(
                title: "Judi Online",
                description: "Konten tidak pantas",
                initialValue: true,
              ),
              GeneralItem(
                title: "Media Sosial",
                description: "Facebook, X, dll",
                initialValue: false,
              ),
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
              GeneralItem(
                title: "Kata Kasar",
                description: "12 Kata",
                initialValue: true,
              ),
              GeneralItem(
                title: "Konten Dewasa",
                description: "8 Kata",
                initialValue: true,
              ),
              GeneralItem(
                title: "Kekerasan",
                description: "19 Kata",
                initialValue: false,
              ),
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
              const FilterImageToggleItem(initialValue: true),
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
        color: AppColors.blueLight,
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

/// === App Item Widget with Dynamic Badge ===
class AppItem extends StatefulWidget {
  final String title;
  final String iconPath;
  final String category;
  final bool initialValue;

  const AppItem({
    super.key,
    required this.title,
    required this.iconPath,
    required this.category,
    required this.initialValue,
  });

  @override
  State<AppItem> createState() => _AppItemState();
}

class _AppItemState extends State<AppItem> {
  late bool _isBlocked;

  @override
  void initState() {
    super.initState();
    _isBlocked = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
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
              widget.iconPath,
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
                Text(widget.title, style: AppTextStyles.itemTitle),
                const SizedBox(height: 4),
                Text(widget.category, style: AppTextStyles.categoryLabel),
              ],
            ),
          ),
          Row(
            children: [
              // Badge hanya muncul jika _isBlocked = true
              if (_isBlocked) ...[
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  decoration: BoxDecoration(
                    color: AppColors.redSoft,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text("Diblokir", style: AppTextStyles.badgeText),
                ),
                const SizedBox(width: 8),
              ],
              Transform.scale(
                scale: 0.9,
                child: Switch(
                  value: _isBlocked,
                  onChanged: (val) {
                    setState(() {
                      _isBlocked = val;
                    });
                  },
                  activeColor: Colors.white,
                  activeTrackColor: AppColors.primary,
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: Colors.grey.shade400,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// === General Item Widget with Dynamic Badge ===
class GeneralItem extends StatefulWidget {
  final String title;
  final String description;
  final bool initialValue;

  const GeneralItem({
    super.key,
    required this.title,
    required this.description,
    required this.initialValue,
  });

  @override
  State<GeneralItem> createState() => _GeneralItemState();
}

class _GeneralItemState extends State<GeneralItem> {
  late bool _isBlocked;

  @override
  void initState() {
    super.initState();
    _isBlocked = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.title, style: AppTextStyles.itemTitle),
                const SizedBox(height: 4),
                Text(widget.description, style: AppTextStyles.categoryLabel),
              ],
            ),
          ),
          Row(
            children: [
              // Badge hanya muncul jika _isBlocked = true
              if (_isBlocked) ...[
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  decoration: BoxDecoration(
                    color: AppColors.redSoft,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text("Diblokir", style: AppTextStyles.badgeText),
                ),
                const SizedBox(width: 8),
              ],
              Transform.scale(
                scale: 0.9,
                child: Switch(
                  value: _isBlocked,
                  onChanged: (val) {
                    setState(() {
                      _isBlocked = val;
                    });
                  },
                  activeColor: Colors.white,
                  activeTrackColor: AppColors.primary,
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: Colors.grey.shade400,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
            ],
          ),
        ],
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
        color: AppColors.blueeLight,
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
              Transform.scale(
                scale: 0.9,
                child: Switch(
                  value: _isOn,
                  onChanged: (val) {
                    setState(() {
                      _isOn = val;
                    });
                  },
                  activeColor: Colors.white,
                  activeTrackColor: AppColors.primary,
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: Colors.grey.shade400,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
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