import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/text_styles.dart';

class StepIntro extends StatelessWidget {
  const StepIntro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(height: 50),
                Image.asset('assets/images/mobile.png', height: 220),
                const SizedBox(height: 40),
                const Text(
                  'Awasi perangkat anak',
                  style: AppTextStyles.title,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Dengan Gen Parental Control, orang tua dapat mengawasi bagaimana anak-anak menggunakan perangkat mereka. Anda harus menautkan perangkat anak terlebih dahulu.',
                  style: AppTextStyles.description,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Tidak Sekarang',
                    style: AppTextStyles.button,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/step_install_child');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                  ),
                  child: const Text('Setuju'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
