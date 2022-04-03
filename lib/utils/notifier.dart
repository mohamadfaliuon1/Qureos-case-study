import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Notifier {
  static void showSnackBar(String message,
      {String? title, bool error = false}) {
    Get.snackbar(title ?? message, title == null ? '' : message,
        colorText: error ? const Color(0xffEB5F5F) : const Color(0xff00ADB5),
        backgroundColor: Colors.white);
  }
}
