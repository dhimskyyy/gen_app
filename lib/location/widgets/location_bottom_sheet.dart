import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/text_styles.dart';

class LocationBottomSheet extends StatelessWidget {
  const LocationBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> locations = [
      'Pekalongan',
      'Pekalongan Timur',
      'Pekalongan Barat',
    ];

    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Drag Handle
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Lokasi', style: AppTextStyles.textReguler),
              TextButton(
                onPressed: () {
                  // Tidak ada action navigasi dulu
                },
                child: Text(
                  'Cari Lokasi',
                  style: AppTextStyles.button.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ...locations.map(
            (location) => ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.location_on, color: AppColors.primary),
              title: Text(location, style: AppTextStyles.textReguler),
              onTap: () {
                // Tidak ada navigasi, hanya close bottom sheet
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
