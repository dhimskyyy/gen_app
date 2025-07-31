import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/text_styles.dart';

class AddKeywordDialog extends StatefulWidget {
  const AddKeywordDialog({super.key});

  @override
  State<AddKeywordDialog> createState() => _AddKeywordDialogState();
}

class _AddKeywordDialogState extends State<AddKeywordDialog> {
  final TextEditingController _keywordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Tambah Kata Kunci', style: AppTextStyles.title),
            const SizedBox(height: 16),
            TextField(
              controller: _keywordController,
              decoration: InputDecoration(
                hintText: 'Masukkan kata kunci',
                filled: true,
                fillColor: AppColors.lightGrey,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Batal', style: AppTextStyles.button),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () =>
                      Navigator.pop(context, _keywordController.text),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                  ),
                  child: Text('Simpan', style: AppTextStyles.textWhite),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
