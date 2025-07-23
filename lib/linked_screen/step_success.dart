import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/text_styles.dart';

class StepSuccess extends StatelessWidget {
  const StepSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                children: [
                  Image.asset('assets/images/success.png', height: 120),
                  const SizedBox(height: 32),
                  const Text(
                    'Perangkat Redmi 13 berhasil terhubung!',
                    style: AppTextStyles.title,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Anda sekarang bisa mulai memantau dan mengatur perangkat anak Anda dari dashboard utama.',
                    style: AppTextStyles.description,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Hubungkan perangkat lainnya atau klik “Selesai” untuk masuk ke dashboard.',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      // Aksi untuk hubungkan perangkat lain
                    },
                    child: const Text(
                      'Hubungkan Perangkat Lain',
                      style: TextStyle(color: Colors.black87, fontSize: 13),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/home',
                        (route) => false,
                      );
                    },
                    child: const Text('Selesai', style: AppTextStyles.button),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
