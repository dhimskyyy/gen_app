import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/text_styles.dart';
import 'widgets/onboarding_content.dart';
import 'widgets/dialog/google_account_dialog.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "image": "assets/icons/heart_icon.png",
      "title": "Selamat Datang di Gen Parental Control",
      "subtitle": "Aplikasi kontrol orang tua yang mudah digunakan",
      "description":
          "Jaga keamanan anak Anda dengan fitur-fitur yang aman dan sederhana.",
    },
    {
      "image": "assets/icons/location_icon.png",
      "title": "Lacak Lokasi Anak",
      "subtitle": "Ketahui dimana anak Anda berada",
      "description":
          "Lihat lokasi anak Anda secara real-time di peta yang mudah dipahami.",
    },
    {
      "image": "assets/icons/timer_icon.png",
      "title": "Atur Waktu",
      "subtitle": "Batasi penggunaan aplikasi dan internet",
      "description":
          "Tentukan kapan anak boleh menggunakan ponsel dan aplikasi tertentu.",
    },
    {
      "image": "assets/icons/privacy_icon.png",
      "title": "Jaga Privasi Anak",
      "subtitle": "Data anak Anda aman dan terlindungi",
      "description":
          "Semua informasi disimpan dengan aman dan hanya Anda yang bisa melihatnya.",
    },
    {
      "image": "assets/icons/rocket_icon.png",
      "title": "Siap Memulai?",
      "subtitle": "Mari mulai melindungi anak Anda",
      "description":
          "Daftar sekarang dan rasakan kemudahan mengawasi anak dengan aman.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: TextButton(
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, '/permission'),
                  child: Text("Lewati", style: AppTextStyles.skip),
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                onPageChanged: (index) => setState(() => currentPage = index),
                itemCount: onboardingData.length,
                itemBuilder: (context, index) => OnboardingContent(
                  imageAsset: onboardingData[index]['image']!,
                  title: onboardingData[index]['title']!,
                  subtitle: onboardingData[index]['subtitle']!,
                  description: onboardingData[index]['description']!,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingData.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 8,
                  ),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: currentPage == index
                        ? AppColors.primary
                        : AppColors.lightGrey,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => const GoogleAccountDialog(),
                            );
                          },
                          icon: Image.asset(
                            'assets/icons/google_icon.png',
                            width: 20,
                            height: 20,
                          ),
                          label: Text("Google", style: AppTextStyles.button),
                          style: OutlinedButton.styleFrom(
                            shape: const StadiumBorder(),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            side: const BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/icons/gmail_icon.png',
                            width: 20,
                            height: 20,
                          ),
                          label: Text(
                            "Alamat E-mail",
                            style: AppTextStyles.button,
                          ),
                          style: OutlinedButton.styleFrom(
                            shape: const StadiumBorder(),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            side: const BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text.rich(
                    TextSpan(
                      text: "Dengan mendaftar, Anda menyetujui ",
                      children: [
                        TextSpan(
                          text: "Persyaratan Layanan dan Kebijakan Privasi",
                          style: AppTextStyles.terms,
                        ),
                      ],
                    ),
                    style: AppTextStyles.small,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Sudah punya akun? Masuk",
                      style: AppTextStyles.login,
                    ),
                  ),
                  const SizedBox(height: 14),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
