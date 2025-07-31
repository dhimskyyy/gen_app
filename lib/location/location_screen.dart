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
        backgroundColor: AppColors.primary,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Lacak Lokasi', style: AppTextStyles.textWhite),
            Text(
              'Pantau lokasi anak secara real-time',
              style: AppTextStyles.extraSmallWhite,
            ),
          ],
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _currentLocationCard(),
              const SizedBox(height: 20),
              Text('Riwayat Lokasi Hari Ini', style: AppTextStyles.textBlack),
              const SizedBox(height: 12),
              _locationHistory(),
              const SizedBox(height: 20),
              _safeZoneCard(),
              const SizedBox(height: 20),
              _notificationSettings(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _currentLocationCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowSoft,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Lokasi Saat ini', style: AppTextStyles.textBlack),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text('Zona Aman', style: AppTextStyles.zone),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/images/maps.png',
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text('Buka Peta Lengkap', style: AppTextStyles.textWhite),
            ),
          ),
        ],
      ),
    );
  }

  Widget _locationHistory() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        locationHistoryItem('06:30', 'Rumah'),
        locationHistoryItem('07:15', 'Jalan Raya'),
        locationHistoryItem('07:30', 'SMP Negeri 5'),
        locationHistoryItem('14:15', 'Jalan Raya'),
      ],
    );
  }

  Widget locationHistoryItem(String time, String location) {
    return Column(
      children: [
        CircleAvatar(radius: 5, backgroundColor: AppColors.primary),
        const SizedBox(height: 4),
        Text(time, style: AppTextStyles.small),
        const SizedBox(height: 2),
        Text(location, style: AppTextStyles.small),
      ],
    );
  }

  Widget _safeZoneCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowSoft,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Zona Aman', style: AppTextStyles.textBlack),
          const SizedBox(height: 12),
          safeZoneItem('Rumah', 'Jl. Mawar No.123', true),
          const SizedBox(height: 12),
          safeZoneItem('Sekolah (SMP Negeri 5)', 'Jl. Kartini No.128', true),
          const SizedBox(height: 12),
          safeZoneItem('Rumah Nenek', 'Jl. Melati No.123', false),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: AppColors.primary),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Tambahkan Zona Aman Baru',
                style: AppTextStyles.button,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget safeZoneItem(String title, String address, bool isActive) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              Icons.location_on,
              color: isActive ? AppColors.primary : AppColors.black,
              size: 20,
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.textBlack),
                Text(address, style: AppTextStyles.description),
              ],
            ),
          ],
        ),
        Switch(
          value: isActive,
          onChanged: (_) {},
          activeColor: AppColors.primary,
        ),
      ],
    );
  }

  Widget _notificationSettings() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowSoft,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Pengaturan Notifikasi', style: AppTextStyles.textBlack),
          const SizedBox(height: 12),
          notificationItem(
            title: 'Baterai Lemah',
            subtitle: 'Notifikasi saat baterai <20%',
            isActive: true,
            bgColor: AppColors.yellowSoft,
          ),
          const SizedBox(height: 12),
          notificationItem(
            title: 'Keluar Zona Aman',
            subtitle: 'Peringatan ketika keluar zona aman',
            isActive: true,
            bgColor: AppColors.redSoft,
          ),
        ],
      ),
    );
  }

  Widget notificationItem({
    required String title,
    required String subtitle,
    required bool isActive,
    required Color bgColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTextStyles.textBlack),
              Text(subtitle, style: AppTextStyles.description),
            ],
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
