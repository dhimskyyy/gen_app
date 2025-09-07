import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/text_styles.dart';

class DeleteSiteDialog extends StatelessWidget {
  final String url;

  const DeleteSiteDialog({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 32),
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Judul
            Text(
              'Hapus Situs Web',
              style: AppTextStyles.title,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Pesan
            Text(
              'Situs Web akan hilang setelah dihapus, Anda yakin ingin menghapusnya?\n\n$url',
              style: AppTextStyles.textReguler,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 22),

            // Tombol Oke
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context, true),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.deleteRed,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: Text('Oke', style: AppTextStyles.textWhite),
              ),
            ),
            const SizedBox(height: 10),
            // Tombol Batal
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text(
                'Batal',
                style: AppTextStyles.textReguler.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
