import 'package:flutter/material.dart';

class Style {
  static String appName = "Picture Learning";

  //Colors for theme
  static Color primary = const Color(0xFF11C0F9);

  static Color secondary = const Color(0xFFD0DC68);

  static Color white = const Color(0xffffffff);
  static Color grey200 = const Color(0xfff1f0f2);
  static Color grey400 = const Color(0xffd5d5d5);
  static Color grey600 = const Color(0xff7f7f7f);
  static Color grey800 = const Color(0xff484848);
  static Color black = const Color(0xff000000);

  static Color success = const Color(0xFF00FD3F);
  static Color alert = const Color(0xFFCFFD00);
  static Color danger = const Color(0xFFE53F29);

  static Color shadow = const Color(0xFFCCCCCC).withOpacity(0.5);

  // Text styles
  static double h1 = 48;
  static double h2 = 30;
  static double h3 = 24;
  static double h4 = 16;

  static double textmd = 14;
  static double textsm = 12;
  static double textxs = 8;

  // Theme
  static ThemeData lightTheme = ThemeData.light().copyWith(
    colorScheme: ColorScheme.light(
      primary: primary,
      secondary: primary,
      background: white,
    ),
    scaffoldBackgroundColor: white,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: const EdgeInsets.all(18),
        primary: Style.primary,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        elevation: 0,
        primary: Style.primary,
        padding: const EdgeInsets.all(18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        side: BorderSide(
          color: Style.primary,
        ),
      ),
    ),
    cardTheme: CardTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 10,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    textTheme: TextTheme(
      bodyText2: TextStyle(color: grey800),
      subtitle1: TextStyle(color: grey800),
    ),
  );
}
