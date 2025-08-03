import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/text_styles.dart';
import '../screens/site_list_screen.dart';
import '../screens/keyword_list_screen.dart';
import '../screens/app_list_screen.dart';
import '../widgets/section_card.dart';

class BockingScreen extends StatelessWidget {
  const BockingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Pemblokiran dan Pembatasan',
          style: AppTextStyles.textWhite,
        ),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SectionCard(
            title: 'Blokir Aplikasi',
            children: [
              _appItemWithImage('tiktok.png', 'TikTok', 'Diblokir', true),
              _appItemWithImage(
                'mobilelegend.png',
                'Mobile Legends',
                'Game',
                false,
              ),
              _appItemWithImage(
                'whatsapp.png',
                'WhatsApp',
                'Pesan/Call',
                false,
              ),
              _addButton('Tambah Aplikasi Untuk Diblokir', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AppListScreen(),
                  ),
                );
              }),
            ],
          ),
          SectionCard(
            title: 'Blokir Situs Web',
            children: [
              _switchItem('Situs Dewasa', 'Konten pornografi', true),
              _switchItem('Judi Online', 'Slot, Togel', true),
              _switchItem('Media Sosial', 'Facebook, X, IG', false),
              _addButton('Tambah Situs Untuk Diblokir', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SiteListScreen(),
                  ),
                );
              }),
            ],
          ),
          SectionCard(
            title: 'Blokir Kata Kunci',
            children: [
              _switchItem('Kata Kasar', '17 data', true),
              _switchItem('Konten Dewasa', '64 data', true),
              _switchItem('Kekerasan', '50 data', false),
              _addButton('Tambah Kata Kunci Baru', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const KeywordListScreen(),
                  ),
                );
              }),
            ],
          ),
          SectionCard(
            title: 'Filter Gambar',
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  'Sensor Gambar Tidak Pantas',
                  style: AppTextStyles.textReguler,
                ),
                subtitle: Text(
                  'Aktifkan filter gambar yang tidak pantas',
                  style: AppTextStyles.description,
                ),
                trailing: Switch(value: true, onChanged: (v) {}),
              ),
              const SizedBox(height: 12),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.greenSoft,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('247 Gambar Difilter', style: AppTextStyles.textReguler),
                    Text(
                      '95,8% Akurasi Filter',
                      style: AppTextStyles.textReguler.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _appItemWithImage(
    String imageName,
    String appName,
    String status,
    bool isBlocked,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Image.asset('assets/images/$imageName', width: 32, height: 32),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(appName, style: AppTextStyles.textReguler),
                Text(
                  status,
                  style: isBlocked
                      ? AppTextStyles.description.copyWith(
                          color: AppColors.deleteRed,
                        )
                      : AppTextStyles.description,
                ),
              ],
            ),
          ),
          Switch(value: isBlocked, onChanged: (v) {}),
        ],
      ),
    );
  }

  Widget _switchItem(String title, String subtitle, bool value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Image.asset('assets/images/lock.png', width: 24, height: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.textReguler),
                Text(subtitle, style: AppTextStyles.description),
              ],
            ),
          ),
          Switch(value: value, onChanged: (v) {}),
        ],
      ),
    );
  }

  Widget _addButton(String label, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
        onPressed: onPressed,
        child: Text(label, style: AppTextStyles.textWhite),
      ),
    );
  }
}
