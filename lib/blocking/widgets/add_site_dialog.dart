import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/text_styles.dart';

class AddSiteDialog extends StatefulWidget {
  final String? initialUrl;
  final String? initialNote;

  const AddSiteDialog({super.key, this.initialUrl, this.initialNote});

  @override
  State<AddSiteDialog> createState() => _AddSiteDialogState();
}

class _AddSiteDialogState extends State<AddSiteDialog> {
  late TextEditingController _urlController;
  late TextEditingController _noteController;

  @override
  void initState() {
    super.initState();
    _urlController = TextEditingController(text: widget.initialUrl ?? '');
    _noteController = TextEditingController(text: widget.initialNote ?? '');
  }

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
              widget.initialUrl != null ? 'Edit Situs Web' : 'Tambah Situs Web',
              style: AppTextStyles.title,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Input URL
            TextField(
              controller: _urlController,
              decoration: InputDecoration(
                hintText: 'Masukkan URL',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Input Catatan
            TextField(
              controller: _noteController,
              decoration: InputDecoration(
                hintText: 'Catatan',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Tombol Simpan
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, {
                    "url": _urlController.text.trim(),
                    "note": _noteController.text.trim(),
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: Text('Simpan', style: AppTextStyles.textWhite),
              ),
            ),

            const SizedBox(height: 12),

            // Tombol Batal
            TextButton(
              onPressed: () => Navigator.pop(context),
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
