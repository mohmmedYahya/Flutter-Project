import 'package:flutter/material.dart';

/// Color palette for the CarMarket app
/// Based on the provided TypeScript palette configuration
class AppColors {
  // Primary Colors
  static const Color primaryLight = Color(0xFFA993FF);
  static const Color primaryMain = Color(0xFF977DFF);
  static const Color primaryGradientStart = Color(0xFFA48DFF);
  static const Color primaryDark = Color(0xFF7B58FF);

  // Secondary Colors
  static const Color secondaryLight = Color(0xFFB5F1FF);
  static const Color secondaryMain = Color(0xFF38D6FC);
  static const Color secondaryDark = Color(0xFF0C53B7);

  // Info Colors
  static const Color infoLight = Color(0xFF74CAFF);
  static const Color infoMain = Color(0xFF1890FF);
  static const Color infoDark = Color(0xFF0C53B7);

  // Success Colors
  static const Color successLight = Color(0xFFD1FADF);
  static const Color successMain = Color(0xFF0AC25F);
  static const Color successDark = Color(0xFF039855);

  // Warning Colors
  static const Color warningLight = Color(0xFFFFD79C);
  static const Color warningMain = Color(0xFFFF9800);
  static const Color warningDark = Color(0xFFB78103);

  // Error Colors
  static const Color errorLight = Color(0xFFFEE4E2);
  static const Color errorMain = Color(0xFFFF3E3E);
  static const Color errorDark = Color(0xFFC62828);

  // Text Colors
  static const Color textPrimary = Color(0xFF524B6B);
  static const Color textSecondary = Color(0xFF9C96AA);
  static const Color textLight = Color(0xFFB7BDCB);
  static const Color textLighter = Color(0xFFF3F4F5);

  // Grey Colors
  static const Color grey0 = Color(0xFFFFFFFF);
  static const Color grey100 = Color(0xFFF9FAFB);
  static const Color grey200 = Color(0xFFF4F6F8);
  static const Color grey250 = Color(0xFFF2F4F7);
  static const Color grey300 = Color(0xFFDFE3E8);
  static const Color grey400 = Color(0xFFC4CDD5);
  static const Color grey500 = Color(0xFF919EAB);
  static const Color grey600 = Color(0xFF637381);
  static const Color grey700 = Color(0xFF454F5B);
  static const Color grey800 = Color(0xFF212B36);
  static const Color grey900 = Color(0xFF161C24);

  // Background Colors
  static const Color backgroundPaper = Color(0xFFF9F9F9);
  static const Color backgroundDefault = Color(0xFFFFFFFF);
  static const Color backgroundNeutral = grey200;

  // Input Colors
  static const Color inputBackground = Color(0xFFFFFFFF);
  static const Color inputDisabledBackground = Color(0xFFE9EDF1);
  static const Color inputPlaceholder = grey600;
  static const Color inputText = grey900;
  static const Color inputBorder = Color(0xFFE2E2E4);
  static const Color inputSlider = Color(0xFFE0E8EC);

  // Button Colors
  static const Color buttonMain = Color(0xFFEEE9FF);
  static const Color buttonBackground = Color(0xFFEBE7FA);
  static const Color buttonDisabled = Color(0xFFBABABA);
  static const Color buttonLightBackground = Color(0xFF867BB9);
  static const Color buttonLightestBackground = Color(0xFFEDEBFF);
  static const Color buttonRadioButton = Color(0xFF987CFF);
  static const Color buttonSetting = Color(0xFFECEAFE);

  // Switch Colors
  static const Color switchDisabledThumb = Color(0xFFF4F3F4);
  static const Color switchDisabledTrack = Color(0xFF767577);

  // Icon Colors
  static const Color iconSave = Color(0xFFFF7890);

  // Border Colors
  static const Color borderCard = Color(0xFFC7C9D9);

  // Modal Colors
  static const Color modalBackground = Color(
    0xCC343434,
  ); // rgba(52, 52, 52, 0.8)

  // Shadow Colors
  static const Color shadowColor = Color(0xFF000000);

  // Divider Color
  static const Color divider = Color(0x3D919EAB); // rgba(145, 158, 171, 0.24)

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryGradientStart, primaryMain],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient cardGradient = LinearGradient(
    colors: [Color(0xFFF8F9FF), Color(0xFFFFFFFF)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // Utility methods for color with opacity
  static Color grey500WithOpacity(double opacity) =>
      grey500.withOpacity(opacity);
  static Color primaryWithOpacity(double opacity) =>
      primaryMain.withOpacity(opacity);
  static Color secondaryWithOpacity(double opacity) =>
      secondaryMain.withOpacity(opacity);
}
