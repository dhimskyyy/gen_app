import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/text_styles.dart';

class TimeLimitScreen extends StatefulWidget {
  const TimeLimitScreen({super.key});

  @override
  State<TimeLimitScreen> createState() => _TimeLimitScreenState();
}

class _TimeLimitScreenState extends State<TimeLimitScreen> {
  double _dailyLimitHours = 3.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.deadline,
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

String _formatHours(double hours) {
  if (hours >= 8.0) return '8 Jam';
  if (hours <= 0.5) return '30 Menit';

  int totalMinutes = (hours * 60).round();
  int h = totalMinutes ~/ 60;
  int m = totalMinutes % 60;

  if (h > 0 && m > 0) {
    return '$h Jam $m Menit';
  } else if (h > 0) {
    return '$h Jam';
  } else {
    return '$m Menit';
  }
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
            Image.asset('assets/icons/redclock.png', width: 18),
            const SizedBox(width: 8),
            Text(
              'Batas Waktu Harian',
              style: AppTextStyles.textReguler.copyWith(fontWeight: FontWeight.w400),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Center(
          child: Column(
            children: [
              Text(
                _formatHours(_dailyLimitHours),
                style: AppTextStyles.textReguler.copyWith(
                  color: AppColors.deadline,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Maksimal penggunaan internet per hari',
                style: AppTextStyles.textReguler,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('30 menit', style: AppTextStyles.textReguler.copyWith(fontSize: 12)),
                    Text('8 Jam', style: AppTextStyles.textReguler.copyWith(fontSize: 12)),
                  ],
                ),
              ),
              Slider(
                value: _dailyLimitHours,
                min: 0.5,
                max: 8,
                divisions: 15,
                onChanged: (double newValue) {
                  setState(() {
                    _dailyLimitHours = newValue;
                  });
                },
                activeColor: AppColors.primary,
                inactiveColor: AppColors.greySoft,
              ),
              Text(
                _formatHours(_dailyLimitHours),
                style: AppTextStyles.textReguler
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildTimeBox('2j 15m', 'Sudah Digunakan', AppColors.deleteRed),
            _buildTimeBox('247', 'Sisa Waktu', AppColors.greenSoft),
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
    width: 150,
    padding: const EdgeInsets.symmetric(vertical: 12),
    decoration: BoxDecoration(
      color: color.withOpacity(0.1),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Column(
      children: [
        Text(
          time,
          style: AppTextStyles.titleAppBar.copyWith(
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Text(label, style: AppTextStyles.categoryLabel),
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
      leading: Image.asset('assets/images/$iconFile', width: 32),
      title: Text(appName, style: AppTextStyles.itemTitle),
      subtitle: Text('Digunakan: $used', style: AppTextStyles.categoryLabel),
      trailing: Text(
        limit,
        style: AppTextStyles.textBlue.copyWith(color: color),
      ),
    );
  }
}
