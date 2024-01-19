import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Toasts {
  Toasts();

  void showTaost(String text, {BuildContext? context}) {
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      //На Android 11+ цвет не применится, необходимо передавать context
      // чтобы показать красное сообщение с ошибкой (или использовать другую либу)
      // issue: https://github.com/ponnamkarthik/FlutterToast/issues/432
      backgroundColor: Colors.green,
      textColor: Colors.white,
      timeInSecForIosWeb: 1,
      fontSize: 14,
    );
  }

  void showError(String errorText, {BuildContext? context}) {
    Fluttertoast.showToast(
      msg: errorText,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      //На Android 11+ цвет не применится, необходимо передавать context
      // чтобы показать красное сообщение с ошибкой (или использовать другую либу)
      // issue: https://github.com/ponnamkarthik/FlutterToast/issues/432
      backgroundColor: Colors.red,
      textColor: Colors.white,
      timeInSecForIosWeb: 1,
      fontSize: 14,
    );
  }
}
