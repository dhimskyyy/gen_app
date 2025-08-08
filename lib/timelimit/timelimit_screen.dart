import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/text_styles.dart';

class TimeLimitScreen extends StatelessWidget {
  const TimeLimitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Batasan Waktu', style: AppTextStyles.textWhite),
            Text(
              'Atur waktu penggunaan internet anak',
              style: AppTextStyles.extraSmallWhite,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _buildDailyLimitSection(),
              const SizedBox(height: 20),
              _buildWeeklyScheduleSection(),
              const SizedBox(height: 20),
              _buildAppLimitSection(),
              const SizedBox(height: 20),
              _buildBottomButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDailyLimitSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: AppColors.shadowSoft, blurRadius: 4)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset('assets/icons/redclock.png', width: 20),
              const SizedBox(width: 8),
              Text('Batas Waktu Harian', style: AppTextStyles.sectionTitle),
            ],
          ),
          const SizedBox(height: 12),
          Center(
            child: Column(
              children: [
                Text('3 Jam', style: AppTextStyles.zone),
                const SizedBox(height: 4),
                Text(
                  'Maksimal penggunaan internet per hari',
                  style: AppTextStyles.description.copyWith(
                    color: AppColors.greySoft,
                  ),
                  textAlign: TextAlign.center,
                ),
                Slider(
                  value: 3.0, // ✅ FIX: harus double
                  min: 0.5,
                  max: 8,
                  divisions: 15,
                  onChanged: (_) {},
                  activeColor: AppColors.primary,
                ),
                Text('3 Jam', style: AppTextStyles.textReguler),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildTimeBox('2j 15m', 'Sudah Digunakan', AppColors.deleteRed),
              _buildTimeBox('2:47', 'Sisa Waktu', AppColors.greenSoft),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWeeklyScheduleSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: AppColors.shadowSoft, blurRadius: 4)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset('assets/icons/calendar.png', width: 20),
              const SizedBox(width: 8),
              Text('Jadwal Mingguan', style: AppTextStyles.sectionTitle),
            ],
          ),
          const SizedBox(height: 12),
          _buildScheduleItem(
            'Jam Sekolah',
            '08:00 - 15:15\nSenin sampai Jumat',
            true,
          ),
          const SizedBox(height: 8),
          _buildScheduleItem('Waktu Tidur', '22:00 - 05:15\nSetiap hari', true),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              minimumSize: const Size.fromHeight(48),
            ),
            icon: const Icon(Icons.add),
            label: Text('Tambahkan Jadwal', style: AppTextStyles.addButton),
          ),
        ],
      ),
    );
  }

  Widget _buildAppLimitSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: AppColors.shadowSoft, blurRadius: 4)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset('assets/icons/smartphone.png', width: 20),
              const SizedBox(width: 8),
              Text('Batasan Per Aplikasi', style: AppTextStyles.sectionTitle),
            ],
          ),
          const SizedBox(height: 12),
          _buildAppLimitRow(
            'Youtube',
            '45 menit',
            '1 jam',
            AppColors.deleteRed,
            'youtube.png',
          ),
          _buildAppLimitRow(
            'WhatsApp',
            '45 menit',
            '2 jam',
            AppColors.greenSoft,
            'whatsapp.png',
          ),
          _buildAppLimitRow(
            'TikTok',
            '0 menit',
            'Diblokir',
            AppColors.greySoft,
            'tiktok.png',
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              minimumSize: const Size.fromHeight(48),
            ),
            icon: const Icon(Icons.settings),
            label: Text(
              'Atur Batasan Aplikasi Lain',
              style: AppTextStyles.addButton,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomButtons() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.deleteRed,
              minimumSize: const Size.fromHeight(48),
            ),
            child: Text('Blokir Sekarang', style: AppTextStyles.addButton),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.access_time),
            label: Text('Tambah 30 Menit', style: AppTextStyles.textReguler),
          ),
        ),
      ],
    );
  }

  Widget _buildTimeBox(String time, String label, Color color) {
    return Container(
      width: 130,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(time, style: AppTextStyles.zone.copyWith(color: color)),
          const SizedBox(height: 4),
          Text(label, style: AppTextStyles.subtitle),
        ],
      ),
    );
  }

  Widget _buildScheduleItem(String title, String timeRange, bool isActive) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.shadowSoft)),
      ),
      child: Row(
        children: [
          Expanded(
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(title, style: AppTextStyles.subtitle),
              subtitle: Text(
                timeRange,
                style: AppTextStyles.description.copyWith(
                  color: AppColors.greySoft,
                ),
              ),
            ),
          ),
          Switch(value: isActive, onChanged: (_) {}),
        ],
      ),
    );
  }

  Widget _buildAppLimitRow(
    String appName,
    String used,
    String limit,
    Color color,
    String iconFile,
  ) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Image.asset('assets/icons/$iconFile', width: 32),
      title: Text(appName, style: AppTextStyles.itemTitle),
      subtitle: Text('Digunakan: $used', style: AppTextStyles.categoryLabel),
      trailing: Text(
        limit,
        style: AppTextStyles.textBlue.copyWith(color: color),
      ),
    );
  }
}
