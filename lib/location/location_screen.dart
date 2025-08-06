import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/text_styles.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.greenSoft,
        elevation: 0,
        toolbarHeight: 90,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Lacak Lokasi', style: AppTextStyles.textWhite),
            const SizedBox(height: 4),
            Text(
              'Pantau lokasi anak secara real-time',
              style: AppTextStyles.extraSmallWhite,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _currentLocationCard(),
              const SizedBox(height: 20),
              _locationHistorySection(),
              const SizedBox(height: 20),
              _safeZoneCard(),
              const SizedBox(height: 20),
              _notificationSettings(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _currentLocationCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowSoft,
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset('assets/icons/map_pin.png', width: 18),
              const SizedBox(width: 6),
              Text('Lokasi Saat ini', style: AppTextStyles.textReguler),
            ],
          ),
          const SizedBox(height: 12),
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/images/Basemap.png',
                  height: 130,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 25, 
                left: 195, 
                child: Image.asset(
                  'assets/icons/Vector.png',
                  width: 32, // Sesuaikan ukuran icon
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              icon: Image.asset('assets/icons/point_icon.png', width: 20),
              label: Text('Buka Peta Lengkap', style: AppTextStyles.textWhite),
            ),
          ),
        ],
      ),
    );
  }

  Widget _locationHistorySection() {
    final ScrollController _scrollController = ScrollController();

    return StatefulBuilder(
      builder: (context, setState) {
        double scrollProgress = 0;

        _scrollController.addListener(() {
          final maxScroll = _scrollController.position.maxScrollExtent;
          final currentScroll = _scrollController.position.pixels;
          setState(() {
            scrollProgress = (maxScroll == 0) ? 0 : currentScroll / maxScroll;
          });
        });

        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowSoft,
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset('assets/icons/clock.png', width: 18, height: 18),
                  const SizedBox(width: 8),
                  Text(
                    'Riwayat Lokasi Hari Ini',
                    style: AppTextStyles.textReguler.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 100,
                child: ListView(
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  children: [
                    _historyItem('06:30', 'Rumah', AppColors.greenSoft),
                    _historyItem('07:15', 'Jalan Raya', AppColors.orangeSoft),
                    _historyItem('07:30', 'SMP Negeri 5', AppColors.greenSoft),
                    _historyItem('14:15', 'Jalan Raya', AppColors.orangeSoft),
                    _historyItem('16:00', 'Rumah Nenek', AppColors.greenSoft),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              // Scroll progress bar
              LayoutBuilder(
                builder: (context, constraints) {
                  return Stack(
                    children: [
                      Container(
                        height: 4,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.lightGrey,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 100),
                        height: 4,
                        width: constraints.maxWidth * scrollProgress,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _historyItem(String time, String label, Color dotColor) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.lightGrey),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(color: dotColor, shape: BoxShape.circle),
          ),
          const SizedBox(height: 8),
          Text(
            time,
            style: AppTextStyles.textReguler.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.textEmail.copyWith(
              fontSize: 12,
              color: AppColors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _safeZoneCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowSoft,
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset('assets/icons/shield.png', width: 18),
              const SizedBox(width: 6),
              Text('Zona Aman', style: AppTextStyles.textReguler),
            ],
          ),
          const SizedBox(height: 16),
          _safeZoneItem(
            title: 'Rumah',
            address: 'Jl. Mawar No.123',
            active: true,
            iconFile: 'home.png',
          ),
          const SizedBox(height: 12),
          _safeZoneItem(
            title: 'Sekolah (SMP Negeri 5)',
            address: 'Jl. Kartini No.123',
            active: true,
            iconFile: 'school.png',
          ),
          const SizedBox(height: 12),
          _safeZoneItem(
            title: 'Rumah Nenek',
            address: 'Jl. Melati No.123',
            active: false,
            iconFile: 'home.png',
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add, color: Colors.white),
              label: Text(
                'Tambahkan Zona Aman Baru',
                style: AppTextStyles.textWhite.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _safeZoneItem({
    required String title,
    required String address,
    required bool active,
    required String iconFile,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F6FA), // Abu-abu soft sesuai desain Figma
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset('assets/icons/$iconFile', width: 24),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.textReguler.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    address,
                    style: AppTextStyles.description.copyWith(
                      fontSize: 12,
                      color: AppColors.black, // Ubah jadi hitam
                    ),
                  ),
                ],
              ),
            ],
          ),
          Switch(
            value: active,
            onChanged: (_) {},
            activeColor: AppColors.primary,
          ),
        ],
      ),
    );
  }

  Widget _notificationSettings() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowSoft,
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset('assets/icons/shield.png', width: 18),
              const SizedBox(width: 6),
              Text('Pengaturan Notifikasi', style: AppTextStyles.textReguler),
            ],
          ),
          const SizedBox(height: 16),
          _notificationItem(
            title: 'Baterai Lemah',
            subtitle: 'Notifikasi saat baterai <20%',
            isActive: true,
            bgColor: AppColors.yellowSoft,
          ),
          const SizedBox(height: 12),
          _notificationItem(
            title: 'Keluar Zona Aman',
            subtitle: 'Peringatan ketika keluar zona aman',
            isActive: true,
            bgColor: AppColors.redSoft,
          ),
        ],
      ),
    );
  }

  Widget _notificationItem({
    required String title,
    required String subtitle,
    required bool isActive,
    required Color bgColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.textReguler),
                const SizedBox(height: 4),
                Text(subtitle, style: AppTextStyles.description),
              ],
            ),
          ),
          Switch(
            value: isActive,
            onChanged: (_) {},
            activeColor: AppColors.primary,
          ),
        ],
      ),
    );
  }
}
