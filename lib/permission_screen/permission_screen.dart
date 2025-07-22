import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/text_styles.dart';
import 'permission_content.dart';

class PermissionScreen extends StatefulWidget {
  const PermissionScreen({super.key});

  @override
  State<PermissionScreen> createState() => _PermissionScreenState();
}

class _PermissionScreenState extends State<PermissionScreen> {
  final PageController _controller = PageController();
  int currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "image": "assets/icons/location_icon.png",
      "title": "Izin Lokasi",
      "subtitle": "Untuk melihat lokasi anak secara real-time",
      "description":
          "Kami membutuhkan akses lokasi Agar anda dapat melihat dimana anak Anda berada kapan saja.",
    },
    {
      "image": "assets/icons/notification_icon.png",
      "title": "Izin Notifikasi",
      "subtitle": "Agar Anda mendapat peringatan penting",
      "description":
          "Dapatkan pemberitahuan saat ada aktivitas di perangkat anak. ",
    },
    {
      "image": "assets/icons/folder_icon.png",
      "title": "Izin Penyimpanan",
      "subtitle": "Untuk menyimpan laporan dan data penting",
      "description":
          "Simpan riwayat lokasi dan laporan aktivitas anak untuk referensi Anda.",
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
                      Navigator.pushReplacementNamed(context, '/home'),
                  child: Text("Lewati", style: AppTextStyles.skip),
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                onPageChanged: (index) => setState(() => currentPage = index),
                itemCount: onboardingData.length,
                itemBuilder: (context, index) => PermissionContent(
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
                          onPressed: () =>
                              Navigator.pushReplacementNamed(context, '/home'),
                          label: Text(
                            "Lanjutkan",
                            style: TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            backgroundColor: const Color(0xFF4886DE),
                            shape: const StadiumBorder(),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            side: const BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text.rich(
                    TextSpan(text: "Lewati untuk sekarang"),
                    style: AppTextStyles.small,
                    textAlign: TextAlign.center,
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
