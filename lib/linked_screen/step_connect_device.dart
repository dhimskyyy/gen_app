// lib/linked_screen/step_connect_device.dart
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/text_styles.dart';

class StepConnectDevice extends StatelessWidget {
  const StepConnectDevice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Langkah 2')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('assets/images/connect_mobile.png', height: 120),
            const SizedBox(height: 16),
            const Text(
              'Langkah 2: Hubungkan dengan Aplikasi Anak',
              style: AppTextStyles.title,
            ),
            const SizedBox(height: 16),
            const Text(
              'Buka aplikasi anak di HP anak. Lalu sambungkan dengan scan QR diatas atau masukkan kode secara manual.',
              style: AppTextStyles.subtitle,
            ),
            const SizedBox(height: 32),
            Center(
              child: Image.asset(
                'assets/images/qr_code.png',
                width: 220,
                height: 220,
              ),
            ),
            const SizedBox(height: 16),
            const Center(
              child: Text(
                '304 307 969',
                style: TextStyle(
                  fontSize: 24,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Kembali'),
                ),
                ElevatedButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, '/step_success'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
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
