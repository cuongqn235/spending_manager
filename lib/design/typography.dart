import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const thin = FontWeight.w100;
const extraLight = FontWeight.w200;
const light = FontWeight.w300;
const regular = FontWeight.w400;
const medium = FontWeight.w500;
const semiBold = FontWeight.w600;
const bold = FontWeight.w700;
const extraBold = FontWeight.w800;
const ultraBold = FontWeight.w900;

final customizeTextTheme = TextTheme(
  displayLarge: TextStyles.displayLarge,
  displayMedium: TextStyles.displayMedium,
  displaySmall: TextStyles.displaySmall,
  headlineLarge: TextStyles.headlineLarge,
  headlineMedium: TextStyles.headlineMedium,
  headlineSmall: TextStyles.headlineSmall,
  titleLarge: TextStyles.titleLarge,
  titleMedium: TextStyles.titleMedium,
  titleSmall: TextStyles.titleSmall,
  bodyLarge: TextStyles.bodyLarge,
  bodyMedium: TextStyles.bodyMedium,
  bodySmall: TextStyles.bodySmall,
  labelLarge: TextStyles.labelLarge,
  labelMedium: TextStyles.labelMedium,
  labelSmall: TextStyles.labelSmall,
);

class TextStyles {
  const TextStyles();

  static TextStyle get labelSmall => TextStyle(
        fontSize: 10.sp,
      );

  static TextStyle get labelMedium => TextStyle(
        fontSize: 12.sp,
      );

  static TextStyle get labelLarge => TextStyle(
        fontSize: 14.sp,
      );

  static TextStyle get titleSmall => TextStyle(
        fontSize: 16.sp,
      );

  static TextStyle get titleMedium => TextStyle(
        fontSize: 18.sp,
      );

  static TextStyle get titleLarge => TextStyle(
        fontSize: 20.sp,
      );

  static TextStyle get bodySmall => TextStyle(
        fontSize: 12.sp,
      );

  static TextStyle get bodyMedium => TextStyle(
        fontSize: 14.sp,
      );

  static TextStyle get bodyLarge => TextStyle(
        fontSize: 16.sp,
      );

  static TextStyle get headlineSmall => TextStyle(
        fontSize: 24.sp,
      );

  static TextStyle get headlineMedium => TextStyle(
        fontSize: 28.sp,
      );

  static TextStyle get headlineLarge => TextStyle(
        fontSize: 32.sp,
      );

  static TextStyle get displaySmall => TextStyle(
        fontSize: 36.sp,
      );

  static TextStyle get displayMedium => TextStyle(
        fontSize: 45.sp,
      );

  static TextStyle get displayLarge => TextStyle(
        fontSize: 57.sp,
      );
}
