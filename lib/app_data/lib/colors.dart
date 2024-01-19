import 'package:flutter/material.dart';

sealed class AppColors {
  /// Корпоративный цвет
  static Color primaryColor = Colors.black;

  /// Второстепенный цвет
  static Color secondaryColor = Colors.grey;

  /// Цвет фона страниц
  static const Color backgroundColor = Colors.white;

  static Gradient backgroundGradient = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      gray4F6,
      grayEEE,
    ],
  );

  // black
  static const Color black000 = Color(0xFF000000);

  // blue
  static const Color blueBA2 = Color(0xFF764BA2);
  static const Color blue5C7 = Color(0xFF4965C7);
  static const Color blue1D7 = Color(0xFF0091D7);
  static const Color blueEEA = Color(0xFF667EEA);
  static const Color blue5C8 = Color(0xFF4A65C8);

  // gold
  static const Color gold900 = Color(0xFFFCB900);

  // gray
  static const Color grayTextE1E = Color(0xFF1E1E1E);
  static const Color gray333 = Color(0xFF333333);
  static const Color gray666 = Color(0xFF666666);
  static const Color gray979 = Color(0xFF797979);
  static const Color gray8A8 = Color(0xFFA8A8A8);
  static const Color grayCCC = Color(0xFFCCCCCC);
  static const Color gray1D1 = Color(0xFFD1D1D1);
  static const Color grayDBD = Color(0xFF9FADBD);
  static const Color grayDCD = Color(0xFFCDCDCD);
  static const Color grayDDD = Color(0xFFDDDDDD);
  static const Color grayE93 = Color(0xFF8E8E93);
  static const Color gray5E5 = Color(0xFFE5E5E5);
  static const Color gray9E9 = Color(0xFFE9E9E9);
  static const Color gray9B9 = Color(0xFFB9B9B9);

  static const Color grayEBE = Color(0xFFBEBEBE);
  static const Color grayE7E = Color(0xFF7E7E7E);
  static const Color grayEEE = Color(0xFFEEEEEE);
  static const Color gray1F1 = Color(0xFFF1F1F1);
  static const Color gray4F6 = Color(0xFFF2F4F6);
  static const Color gray4F4 = Color(0xFFF4F4F4);
  static const Color gray5F5 = Color(0xFFF5F5F5);
  static const Color gray6F6 = Color(0xFFF6F6F6);
  static const Color gray0D0 = Color(0xFFD0D0D0);
  static const Color gray999 = Color(0xFF999999);
  static const Color gray9D9 = Color(0xFFD9D9D9);

  // green
  static const Color greenB88 = Color(0xFF00CB88);
  static const Color green360 = Color(0xFF0BA360);
  static const Color green870 = Color(0xFF00A870);
  static const Color green971 = Color(0xFF01A971);
  static const Color greenA92 = Color(0xFF3CBA92);
  static const Color greenEE2 = Color(0xFFCCEEE2);
  static const Color greenFF5 = Color(0xFFE0FFF5);

  // orange
  static const Color orange0D2 = Color(0xFFFFF0D2);
  static const Color orangeF00 = Color(0xFFEF7F00);
  static const Color orange1D2 = Color(0xFFFFF1D2);

  // pink
  static const Color pink09C = Color(0xFFEE609C);
  static const Color pink6D5 = Color(0xFFBA66D5);

  // red
  static const Color red251 = Color(0xFFF04251);
  static const Color redA2A = Color(0xFFFF2A2A);
  static const Color redCDC = Color(0xFFFFDCDC);
  static const Color redB2B = Color(0xFFFF2B2B);

  // white
  static const Color whiteFFF = Color(0xFFFFFFFF);
  static const Color white8F8 = Color(0xF8F8F8F8);
  static const Color whiteFF0 = Color(0xFFEDEFF0);
}
