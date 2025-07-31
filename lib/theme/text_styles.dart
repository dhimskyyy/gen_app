import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  static const TextStyle skip = TextStyle(color: AppColors.black87);

  static const TextStyle button = TextStyle(
    fontWeight: FontWeight.w600,
    color: AppColors.black87,
  );

  static const TextStyle small = TextStyle(fontSize: 12);

  static const TextStyle terms = TextStyle(fontWeight: FontWeight.w500);

  static const TextStyle login = TextStyle(
    fontSize: 14,
    color: AppColors.black87,
  );

  static const TextStyle title = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.black,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.black87,
  );

  static const TextStyle description = TextStyle(
    fontSize: 14,
    color: AppColors.black54,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle textWhite = TextStyle(
    fontSize: 14,
    color: Color.fromARGB(137, 255, 255, 255),
    fontWeight: FontWeight.w400,
  );

  static const TextStyle extraSmallWhite = TextStyle(
    fontSize: 12,
    color: Color.fromARGB(137, 255, 255, 255),
    fontWeight: FontWeight.w400,
  );

  static const TextStyle textBlack = TextStyle(
    fontSize: 14,
    color: Color.fromARGB(136, 0, 0, 0),
    fontWeight: FontWeight.w400,
  );

  static const TextStyle zone = TextStyle(
    fontSize: 14,
    color: Color(0x24DD7D),
    fontWeight: FontWeight.w400,
  );
}
