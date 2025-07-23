import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/text_styles.dart';

class StepIntro extends StatelessWidget {
  final VoidCallback onNext;
  const StepIntro({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Image.asset('assets/images/connect_mobile.png', height: 280),
            const SizedBox(height: 40),
            Text(
              'Hubungkan perangkat anak Anda',
              style: AppTextStyles.title,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              'Dengan menghubungkan perangkat anak Anda, Anda dapat mengawasi dan mengontrol aktivitas digital mereka.',
              style: AppTextStyles.description,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onNext,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text('Lanjut', style: AppTextStyles.button),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
