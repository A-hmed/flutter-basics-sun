import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract final class AppStyles{

  static const TextStyle black32SemiBold = TextStyle(
    color: AppColors.black,
    fontSize: 32,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle white36Bold = TextStyle(
    color: AppColors.white,
    fontSize: 36,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle white40ThickBold = TextStyle(
    color: AppColors.white,
    fontSize: 40,
    fontWeight: FontWeight.w900,
  );

  static const TextStyle white24Medium = TextStyle(
    color: AppColors.white,
    fontSize: 24,
    fontWeight: FontWeight.w500,
  );
}