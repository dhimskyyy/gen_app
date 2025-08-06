import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/text_styles.dart';

class FilterImageToggleItem extends StatelessWidget {
  final bool isOn;
  final Function(bool)? onChanged;

  const FilterImageToggleItem({
    super.key,
    required this.isOn,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.greySoft,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Title Row with Switch
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Sensor Gambar Tidak Pantas", style: AppTextStyles.itemTitle),
              Switch(
                value: isOn,
                onChanged: onChanged,
                activeColor: AppColors.primary,
              ),
            ],
          ),

          const SizedBox(height: 4),
          Text(
            "Otomatis blur gambar yang tidak sesuai",
            style: AppTextStyles.categoryLabel,
          ),
          const SizedBox(height: 4),
          Text(
            "AI akan mendeteksi dan memburamkan gambar secara otomatis",
            style: AppTextStyles.textReguler,
          ),
        ],
      ),
    );
  }
}
