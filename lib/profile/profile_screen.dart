import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/text_styles.dart';
import '../bottom_nav.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // Background biru
          Container(
            height: 180,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Konten utama
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 22),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: AppColors.white,
                        child: Icon(Icons.person, color: AppColors.grey),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Sarah Wahyuningsih",
                              style: AppTextStyles.textWhite.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "sarahw@gmail.com",
                              style: AppTextStyles.extraSmallWhite.copyWith(
                                color: const Color.fromRGBO(255, 255, 255, 0.8),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 16,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 38),

                // Card menu putih
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
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
                    child: Column(
                      children: [
                        _buildMenuItem(
                          iconPath: "assets/icons/star_box.png",
                          title: "Uji coba gratis",
                          subtitle: "Waktu tersisa: 6 hari",
                          trailingText: "Paket Berlangganan",
                        ),
                        _divider(),
                        _buildMenuItem(
                          iconPath: "assets/icons/phone_profile.png",
                          title: "Perangkat Anak",
                        ),
                        _divider(),
                        _buildMenuItem(
                          iconPath: "assets/icons/record.png",
                          title: "Rekaman Saya",
                        ),
                        _divider(),
                        _buildMenuItem(
                          iconPath: "assets/icons/lock_profile.png",
                          title: "Kode Admin",
                        ),
                      ],
                    ),
                  ),
                ),

                const Spacer(),
              ],
            ),
          ),

          // Foto profil kecil di pojok kanan bawah di atas bottom nav
          Positioned(
            bottom: 50, // pas di atas bottom nav
            right: 20,
            child: CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage("assets/images/cs.png"),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 3, // index aktif
        onTap: (index) {
          print("Navigasi ke index: $index");
        },
      ),
    );
  }

  Widget _buildMenuItem({
    required String iconPath,
    required String title,
    String? subtitle,
    String? trailingText,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        children: [
          Image.asset(iconPath, width: 22, height: 22),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.itemTitle.copyWith(
                    color: AppColors.textDark,
                  ),
                ),
                if (subtitle != null)
                  Text(
                    subtitle,
                    style: AppTextStyles.categoryLabel.copyWith(
                      color: AppColors.grey,
                    ),
                  ),
              ],
            ),
          ),
          if (trailingText != null)
            Text(
              trailingText,
              style: AppTextStyles.categoryLabel.copyWith(
                color: AppColors.grey,
              ),
            ),
          const SizedBox(width: 6),
          const Icon(Icons.arrow_forward_ios, size: 14, color: AppColors.grey),
        ],
      ),
    );
  }

  Widget _divider() {
    return Container(height: 1, color: AppColors.lightGrey);
  }
}
