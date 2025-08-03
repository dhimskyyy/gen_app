import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  static const TextStyle textReguler = TextStyle(fontSize: 14, color: AppColors.black, fontWeight: FontWeight.w400);
  static final TextStyle textEmail = TextStyle(fontSize: 12, color: AppColors.black);
  static const TextStyle textPlaceholder = TextStyle(fontSize: 14, color: AppColors.placeholder);

  static const TextStyle button = TextStyle(
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );


  static const TextStyle terms = TextStyle(fontSize: 12, color: AppColors.black, fontWeight: FontWeight.w400);

  static const TextStyle textBlue = TextStyle(
    fontSize: 14,
    color: AppColors.primary,
  );

  static const TextStyle title = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );

  static const TextStyle titleLogres = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
  );

  static const TextStyle description = TextStyle(
    fontSize: 14,
    color: AppColors.black,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle textWhite = TextStyle(
    fontSize: 14,
    color: Color.fromARGB(255, 255, 255, 255),
    fontWeight: FontWeight.w400,
  );

  static const TextStyle extraSmallWhite = TextStyle(
    fontSize: 12,
    color: Color.fromARGB(255, 255, 255, 255),
    fontWeight: FontWeight.w400,
  );

  static const TextStyle zone = TextStyle(
    fontSize: 14,
    color: Color.fromARGB(255, 36, 221, 125),
    fontWeight: FontWeight.w600,
  );
}
