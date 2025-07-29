import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Header
          Container(
            height: 180,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                // Header Atas
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Foto profil
                      Container(
                        width: 48,
                        height: 48,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/icons/profile_icon.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),

                      // Nama dan ucapan
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Halo, Ibu Sarah",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Selamat Pagi",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),

                      // Icon pesan
                      IconButton(
                        icon: Image.asset('assets/icons/message_icon.png'),
                        onPressed: () {},
                      ),

                      // Icon tambah
                      IconButton(
                        icon: Image.asset('assets/icons/add_icon.png'),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                // Kartu Putih
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        // CARD PUTIH
                        Container(
                          margin: const EdgeInsets.only(top: 0),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Bagian Atas: profil icon + Redmi 13 + panah bawah
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/icons/profile_icon.png',
                                    width: 24,
                                    height: 24,
                                  ),
                                  const SizedBox(width: 8),
                                  const Text(
                                    "Redmi 13",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Image.asset(
                                    'assets/icons/arrow_down.png',
                                    width: 16,
                                    height: 16,
                                  ),
                                ],
                              ),

                              const SizedBox(height: 16),

                              // Lokasi & Zona Aman
                              Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color:
                                        Colors.grey.shade400,
                                    width: 0.5,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/icons/loc_icon.png',
                                          width: 15,
                                          height: 15,
                                        ),
                                        const SizedBox(width: 6),
                                        const Text(
                                          "Lokasi Saat ini",
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        const SizedBox(width: 8),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 4,
                                          ),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFDFF5E6),
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                          ),
                                          child: const Text(
                                            "Zona Aman",
                                            style: TextStyle(
                                              color: Color(0xFF1A8E4A),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 12),
                                    Container(
                                      width: double.infinity,
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFEAF3FF),
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          color: const Color(0xFF4D9FFF),
                                          width: 1,
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: const [
                                          Icon(
                                            Icons.location_on_outlined,
                                            color: Colors.blue,
                                          ),
                                          SizedBox(height: 4),
                                          Text(
                                            "SMP Negeri 5 Pekalongan",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(height: 2),
                                          Text(
                                            "Jl. Pendidikan No.4",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black54,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(height: 16),

                              // 3 Info Box
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Expanded(
                                    child: _InfoBox(
                                      bgColor: Color(0xFFDFF5E6),
                                      iconPath: 'assets/icons/battery_icon.png',
                                      title: "Baterai",
                                      value: "80%",
                                      valueColor: Color(0xFF1A8E4A),
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Expanded(
                                    child: _InfoBox(
                                      bgColor: Color(0xFFEAF1FF),
                                      iconPath: 'assets/icons/phone_icon.png',
                                      title: "Sedang dibuka",
                                      value: "WhatsApp",
                                      valueColor: Color(0xFF2C74F2),
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Expanded(
                                    child: _InfoBox(
                                      bgColor: Color(0xFFFFF4D8),
                                      iconPath: 'assets/icons/time_icon.png',
                                      title: "Waktu Penggunaan",
                                      value: "1j 15m",
                                      valueColor: Color(0xFF915400),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoBox extends StatelessWidget {
  final Color bgColor;
  final String iconPath;
  final String title;
  final String value;
  final Color valueColor;

  const _InfoBox({
    required this.bgColor,
    required this.iconPath,
    required this.title,
    required this.value,
    required this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(iconPath, width: 20, height: 20),
          const SizedBox(height: 6),
          Text(
            title,
            style: const TextStyle(fontSize: 10),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: valueColor,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
