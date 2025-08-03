import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/text_styles.dart';

class StepInstallChild extends StatelessWidget {
  const StepInstallChild({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 8),
            Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.lightGreen,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/images/connect_mobile.png',
                  height: 40,
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Langkah 1: Pasang Aplikasi Anak',
              style: AppTextStyles.title,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            const Text(
              'Untuk memulai, Anda perlu memasang aplikasi di HP anak Anda. Silakan scan QR Code atau download melalui link dibawah.',
              style: AppTextStyles.description,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withOpacity(0.1),
                    blurRadius: 100,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    'Hubungkan dengan perangkat anak',
                    style: AppTextStyles.textReguler.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 28),
                  Image.asset(
                    'assets/images/qr_code.png',
                    width: 250,
                    height: 250,
                  ),
                  const SizedBox(height: 28),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'https://publika.app/redirect=?',
                        style: AppTextStyles.textReguler.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Image.asset(
                        'assets/icons/share_icon.png',
                        height: 18,
                        color: AppColors.black,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 150,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/linked');
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: AppColors.grey,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          24,
                        ), // radius optional
                      ),
                    ),
                    child: Text(
                      'Kembali',
                      style: AppTextStyles.description.copyWith(
                        color: const Color(
                          0xFF1A67D4,
                        ), // warna teks sama dengan border
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/step_connect_device');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                    ),
                    child: Text(
                      'Setuju',
                      style: AppTextStyles.description.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
