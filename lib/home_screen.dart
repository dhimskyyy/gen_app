import 'package:flutter/material.dart';
import 'package:gen_app/theme/app_colors.dart';
import 'package:gen_app/bottom_nav.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
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
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header Atas
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Foto profil
                        Container(
                          width: 34,
                          height: 34,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/icons/profile_icon.png',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
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
                        IconButton(
                          icon: Image.asset(
                            'assets/icons/message_icon.png',
                            width: 24,
                            height: 24,
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Image.asset(
                            'assets/icons/add_icon.png',
                            width: 24,
                            height: 24,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 42),

                    // CARD PUTIH
                    Container(
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

                          // Lokasi
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.shade400,
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
                                        borderRadius: BorderRadius.circular(20),
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

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

                    const SizedBox(height: 24),

                    const Text(
                      "Menu Utama",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 12),

                    GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 1.8,
                      children: [
                        _MainMenuCard(
                          title: "Lacak Lokasi",
                          iconPath: 'assets/icons/location_icon.png',
                          backgroundColor: Color(0xFF21C162),
                          textColor: Colors.white,
                          onTap: () =>
                              Navigator.pushNamed(context, '/location'),
                        ),
                        _MainMenuCard(
                          title: "Pantau Anak",
                          iconPath: 'assets/icons/shield_icon.png',
                          backgroundColor: AppColors.primary,
                          textColor: Colors.white,
                        ),
                        _MainMenuCard(
                          title: "Pemblokiran",
                          iconPath: 'assets/icons/block_icon.png',
                          backgroundColor: Color(0xFFE94135),
                          textColor: Colors.white,
                          onTap: () =>
                              Navigator.pushNamed(context, '/blocking'),
                        ),
                        _MainMenuCard(
                          title: "Pembatasan Waktu",
                          iconPath: 'assets/icons/time_limit_icon.png',
                          backgroundColor: const Color(0xFFF57C2B),
                          textColor: Colors.white,
                          onTap: () =>
                              Navigator.pushNamed(context, '/timelimit'),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // Tombol Lihat Laporan Aktivitas
                    Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 95,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.grey.shade300),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.pie_chart_outline, size: 20),
                            const SizedBox(width: 8),
                            const Text(
                              'Lihat Laporan Aktivitas',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Tombol Upgrade Premium
                    Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 111,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: const Color(0xFFEAF1FF),
                          border: Border.all(color: const Color(0xFF4D9FFF)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.star,
                              size: 20,
                              color: Color(0xFF2C74F2),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'Upgrade Premium',
                              style: TextStyle(
                                color: Color(0xFF2C74F2),
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 0, // index aktif
        onTap: (index) {
          print("Navigasi ke index: $index");
        },
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

class _MainMenuCard extends StatelessWidget {
  final String title;
  final String iconPath;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback? onTap;

  const _MainMenuCard({
    required this.title,
    required this.iconPath,
    required this.backgroundColor,
    required this.textColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(iconPath, width: 24, height: 24, color: textColor),
            const SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: textColor,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
