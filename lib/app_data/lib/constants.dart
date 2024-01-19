import 'package:flutter/material.dart';

class Constants {
  const Constants();

  /// Ограничение длины пароля
  final int passLength = 8;

  /// Внутренние отступы, используемые по умолчанию для страниц приложения
  EdgeInsets get defaultPagePadding =>
      defaultPagePaddingHorizontal + defaultPagePaddingVertical;
  EdgeInsets get padding10 => paddingHor10 + paddingVert10;

  EdgeInsets get padding16 => paddingHor16 + paddingVert16;

  final EdgeInsets defaultPagePaddingHorizontal = const EdgeInsets.symmetric(
    horizontal: 20,
  );

  final EdgeInsets defaultPagePaddingVertical = const EdgeInsets.symmetric(
    vertical: 20,
  );

  final EdgeInsets paddingVert10 = const EdgeInsets.symmetric(
    vertical: 10,
  );

  final EdgeInsets paddingHor10 = const EdgeInsets.symmetric(
    horizontal: 10,
  );

  final EdgeInsets paddingVert16 = const EdgeInsets.symmetric(
    vertical: 16,
  );

  final EdgeInsets paddingHor16 = const EdgeInsets.symmetric(
    horizontal: 16,
  );

  final EdgeInsets paddingVert20 = const EdgeInsets.symmetric(
    vertical: 20,
  );

  final double amountLinkingCard = 1.0;
}
