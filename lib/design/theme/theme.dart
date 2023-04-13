import 'package:flutter/material.dart';

import '../typography.dart';
import 'color_scheme.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: appLightColorScheme,
      textTheme: customizeTextTheme,
    );
  }
}
