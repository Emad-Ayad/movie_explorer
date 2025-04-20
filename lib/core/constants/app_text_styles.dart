import 'package:flutter/material.dart';

import 'app_colors.dart';


abstract class AppTextStyles {
  // Heading styles
  static const TextStyle heading1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
  );

  static const TextStyle heading2 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
  );

  static const TextStyle heading3 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
  );

  // Subtitle styles
  static const TextStyle subtitle1 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static const TextStyle subtitle2 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.grey,
  );

  // Body text styles
  static const TextStyle bodyText1 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: Colors.black87,
  );

  static const TextStyle bodyText2 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Colors.white70,
  );

  static TextStyle bodyTextShade = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.primaryColor,
  );

  // Caption styles
  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: Colors.grey,
  );

  // Button text styles
  static const TextStyle buttonText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  // Custom styles for specific use cases
  static const TextStyle highlightedText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const TextStyle highlightedText1 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.white70,
  );

  static const TextStyle errorText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Colors.red,
  );
}