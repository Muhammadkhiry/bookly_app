import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class Styles {
  // Title Medium (e.g. "The Jungle Book" in details)
  static const textStyle30 = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.normal,
    color: AppColors.kWhiteColor,
    // fontFamily: 'GT Sectra Fine', // لو ضايف خط مخصص
  );

  // Section titles (e.g. "Best Seller")
  static const textStyle18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.kWhiteColor,
  );

  // Book title in list item
  static const textStyle20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.normal,
    color: AppColors.kWhiteColor,
  );

  // Subtitles / Author name
  static const textStyle14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.white70,
  );

  // Price or Bold info
  static const textStyle16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.kWhiteColor,
  );
}
