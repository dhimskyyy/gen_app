import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/text_styles.dart';

class AddSafeZoneScreen extends StatefulWidget {
  const AddSafeZoneScreen({super.key});

  @override
  State<AddSafeZoneScreen> createState() => _AddSafeZoneScreenState();
}

class _AddSafeZoneScreenState extends State<AddSafeZoneScreen> {
  double radius = 100;
  String selectedLocation = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Tambahkan Zona Aman', style: AppTextStyles.textWhite),
      ),
      body: Column(
        children: [
          // Dummy Map Section
          Stack(
            children: [
              Image.asset(
                'assets/images/maps.png',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 80,
                left: MediaQuery.of(context).size.width / 2 - 12,
                child: const Icon(
                  Icons.location_pin,
                  size: 32,
                  color: Colors.red,
                ),
              ),
              Positioned(
                top: 80,
                left: MediaQuery.of(context).size.width / 2 - 50,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: AppColors.greenSoft,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Location Selector (Static, no action)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Lokasi', style: AppTextStyles.textReguler),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        selectedLocation.isEmpty
                            ? 'Pilih lokasi'
                            : selectedLocation,
                        style: AppTextStyles.description,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Tidak ada action dulu
                      },
                      child: Text(
                        'Ganti',
                        style: AppTextStyles.button.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Radius Slider
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('100m', style: AppTextStyles.description),
                    Text('500m', style: AppTextStyles.description),
                  ],
                ),
                Slider(
                  value: radius,
                  min: 100,
                  max: 500,
                  activeColor: AppColors.primary,
                  onChanged: (value) {
                    setState(() {
                      radius = value;
                    });
                  },
                ),
              ],
            ),
          ),
          const Spacer(),
          // Save and Cancel Buttons
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Save Logic Placeholder
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: Text('Simpan', style: AppTextStyles.textWhite),
                  ),
                ),
                const SizedBox(height: 12),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Batal', style: AppTextStyles.button),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
