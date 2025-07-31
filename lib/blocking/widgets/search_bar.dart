import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/text_styles.dart';

class SearchBarWidget extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onChanged;

  const SearchBarWidget({
    super.key,
    required this.hintText,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.lightGrey,
        prefixIcon: Icon(Icons.search, color: AppColors.black54),
        hintText: hintText,
        hintStyle: AppTextStyles.description,
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
