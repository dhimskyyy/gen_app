import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/text_styles.dart';

class RouteHistory extends StatelessWidget {
  const RouteHistory({super.key});

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
          // AppBar Kembali
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: backButton(context),
            ),
          ),
          // Bottom Sheet Riwayat
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text('Redmi 13', style: AppTextStyles.title),
                  const SizedBox(height: 12),
                  routeHistoryItem(
                    'Jalan Pendidikan No.4, Pekalongan Timur, Kota Pekalongan, Jawa Tengah, 51129, Indonesia',
                    '13:08:12',
                    isPrimary: true,
                  ),
                  const SizedBox(height: 10),
                  routeHistoryItem(
                    'Jalan Pendidikan No.4, Pekalongan Timur, Kota Pekalongan, Jawa Tengah, 51129, Indonesia',
                    '12:08:12',
                    isPrimary: false,
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

  Widget routeHistoryItem(
    String address,
    String time, {
    required bool isPrimary,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          isPrimary ? Icons.check_circle : Icons.star_border,
          color: isPrimary ? Colors.green : AppColors.black54,
          size: 16,
        ),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            address,
            style: isPrimary
                ? AppTextStyles.description.copyWith(color: Colors.green)
                : AppTextStyles.description,
          ),
        ),
        const SizedBox(width: 8),
        Text(time, style: AppTextStyles.description),
      ],
    );
  }
}
