import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/text_styles.dart';

class DeviceLocation extends StatelessWidget {
  const DeviceLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          // Maps Dummy Image
          Positioned.fill(
            child: Image.asset('assets/images/maps.png', fit: BoxFit.cover),
          ),
          // AppBar Kembali & Riwayat Rute
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  backButton(context),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Aksi Riwayat Rute
                    },
                    icon: const Icon(Icons.route, size: 18),
                    label: const Text('Riwayat Rute'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: AppColors.black,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 0,
                      shadowColor: Colors.transparent,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Info Panel Bawah
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Redmi 13', style: AppTextStyles.title),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          'Terakhir diperbarui 13:08',
                          style: AppTextStyles.small.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Icon(Icons.refresh, size: 18, color: AppColors.black54),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Jalan Pendidikan No.4, Pekalongan Timur, Kota Pekalongan, Jawa Tengah, 51129, Indonesia',
                    style: AppTextStyles.description,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget backButton(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.arrow_back, size: 18),
      label: const Text('Kembali'),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: AppColors.black,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        elevation: 0,
        shadowColor: Colors.transparent,
      ),
    );
  }
}
