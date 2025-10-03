import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData get light => ThemeData(
        primaryColor: AppColors.blue2,
        scaffoldBackgroundColor: AppColors.white,
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontFamily: 'Lato',
            fontSize: 42,
            fontWeight: FontWeight.w500,
            color: AppColors.darkGrey,
          ),
          bodyLarge: TextStyle(
            fontFamily: 'Lato',
            fontSize: 21,
            fontWeight: FontWeight.w500,
            color: AppColors.grey1,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'Lato',
            fontSize: 15.75,
            fontWeight: FontWeight.w400,
            color: AppColors.grey3,
          ),
          labelLarge: TextStyle(
            fontFamily: 'Lato',
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.grey5,
          ),
        ),
      );
}
