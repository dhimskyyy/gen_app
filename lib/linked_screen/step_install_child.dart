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
        title: const Text(''),
        elevation: 0,
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
                  color: const Color(0xFFEFFBF4),
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
              style: AppTextStyles.subtitle,
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
                    color: Colors.grey.withOpacity(0.15),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Text(
                    'Hubungkan dengan perangkat anak',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                  ),
                  const SizedBox(height: 12),
                  Image.asset(
                    'assets/images/qr_code.png',
                    width: 180,
                    height: 180,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'https://publika.app/redirect=?',
                        style: TextStyle(color: Colors.blue, fontSize: 14),
                      ),
                      SizedBox(width: 4),
                      Icon(Icons.share, size: 18, color: Colors.grey),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.grey),
                  ),
                  child: const Text('Kembali'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/step_connect_device');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                  ),
                  child: const Text('Lanjutkan'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
