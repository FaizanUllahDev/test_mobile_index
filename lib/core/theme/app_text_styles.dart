import 'package:flutter/material.dart';

import '../constants/colors.dart';

class AppTextStyles {
  static const TextStyle headingLarge = TextStyle(
    fontSize: 72,
    height: 1.1,
    fontWeight: FontWeight.w600,
    color: AppColors.darkGrey,
  );

  static const TextStyle headingMedium = TextStyle(
    fontSize: 32,
    height: 1.3,
    fontWeight: FontWeight.w500,
    color: AppColors.darkGrey,
  );

  static const TextStyle stepNumber = TextStyle(
    fontSize: 64,
    height: 1,
    fontWeight: FontWeight.w600,
    color: Color(0xFFE5E5E5), // Light grey for step numbers
  );

  static const TextStyle stepTitle = TextStyle(
    fontSize: 20,
    height: 1.2,
    fontWeight: FontWeight.w500,
    color: AppColors.darkGrey,
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
}
