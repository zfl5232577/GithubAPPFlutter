import 'package:flutter/material.dart';

class MarkColors {
  static const int ThemeColor = 0xFF3F51B5;
  static const int TextColor = 0xFF333333;
  static const int HintTextColor = 0xFFAAAAAA;
  static const String primaryValueString = "#24292E";
  static const String primaryLightValueString = "#42464b";
  static const String primaryDarkValueString = "#121917";
  static const String miWhiteString = "#ececec";
  static const String actionBlueString = "#267aff";
  static const String webDraculaBackgroundColorString = "#282a36";

  static const int primaryValue = 0xFF24292E;
  static const int primaryLightValue = 0xFF42464b;
  static const int primaryDarkValue = 0xFF121917;

  static const int cardWhite = 0xFFFFFFFF;
  static const int textWhite = 0xFFFFFFFF;
  static const int miWhite = 0xffececec;
  static const int white = 0xFFFFFFFF;
  static const int actionBlue = 0xff267aff;
  static const int subTextColor = 0xff959595;
  static const int subLightTextColor = 0xffc4c4c4;
  static const int subGreenTextColor = 0xff008000;

  static const int mainBackgroundColor = miWhite;

  static const int mainTextColor = primaryDarkValue;
  static const int textColorWhite = white;

  static const int transparent = 0x00000000;

  static const int color_language_java = 0xffB07219;
  static const int color_language_js = 0xffF1E05A;
  static const int color_language_html = 0xffE34C26;
  static const int color_language_css = 0xff563D7C;
  static const int color_language_shell = 0xff89E051;
  static const int color_language_python = 0xff3572A5;
  static const int color_language_cplus = 0xffF34B7D;
  static const int color_language_kotlin = 0xffF18E33;
  static const int color_language_c = 0xff555555;
  static const int color_language_ruby = 0x701516;
  static const int color_language_other = 0x455a64;

  static const MaterialColor primarySwatch = const MaterialColor(
    primaryValue,
    const <int, Color>{
      50: const Color(primaryLightValue),
      100: const Color(primaryLightValue),
      200: const Color(primaryLightValue),
      300: const Color(primaryLightValue),
      400: const Color(primaryLightValue),
      500: const Color(primaryValue),
      600: const Color(primaryDarkValue),
      700: const Color(primaryDarkValue),
      800: const Color(primaryDarkValue),
      900: const Color(primaryDarkValue),
    },
  );
}
