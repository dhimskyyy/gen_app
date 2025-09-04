import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../theme/app_colors.dart';
import '../theme/text_styles.dart';

class LinkedScreen extends StatefulWidget {
  const LinkedScreen({super.key});

  @override
  State<LinkedScreen> createState() => _LinkedScreenState();
}

class _LinkedScreenState extends State<LinkedScreen> {
  String userName = 'Pengguna';
  String? userPhoto;

  @override
  void initState() {
    super.initState();
    _loadSelectedUser();
  }

  // Fungsi untuk membaca data user dari SharedPreferences
  Future<void> _loadSelectedUser() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('selectedUserName') ?? 'Pengguna';
      userPhoto = prefs.getString('selectedUserPhoto');
    });
  }

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
                Text(
                  'Selamat datang, $userName!', // Tampilkan nama user
                  style: AppTextStyles.title,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Awasi perangkat anak',
                  style: AppTextStyles.title,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Dengan Gen Parental Control, orang tua dapat mengawasi bagaimana anak-anak menggunakan perangkat mereka. Anda harus menautkan perangkat anak terlebih dahulu.',
                  style: AppTextStyles.description,
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 10),
                RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    style: AppTextStyles.description.copyWith(height: 1.5),
                    children: [
                      const TextSpan(
                        text:
                            'Sebelum melanjutkan menggunakan layanan kami, Anda telah membaca dan memahami sepenuhnya ',
                      ),
                      TextSpan(
                        text: 'Persyaratan Layanan',
                        style: AppTextStyles.description.copyWith(
                          height: 1.5,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const TextSpan(text: ' dan '),
                      TextSpan(
                        text: 'Kebijakan Privasi',
                        style: AppTextStyles.description.copyWith(
                          height: 1.5,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const TextSpan(
                        text:
                            ' kami. Anda secara tegas berjanji untuk mematuhi hukum dan peraturan yang berlaku di wilayah Anda selama penggunaan aplikasi. Kami peduli dengan keselamatan dan kesejahteraan anak-anak dan menghargai privasi. Anda setuju dan mengizinkan produk kami untuk mendapatkan data dan informasi dari perangkat anak Anda.',
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    // Langsung ke home karena data sudah tersimpan di SharedPreferences
                    Navigator.pushNamed(context, '/home');
                  },
                  child: Text(
                    'Tidak Sekarang',
                    style: AppTextStyles.description.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/step_install_child');
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