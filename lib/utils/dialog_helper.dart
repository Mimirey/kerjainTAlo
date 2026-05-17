import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectquranmu_application/components/custom_dialog.dart';

class DialogHelper {
  static Future<void> showSuccess({
    required String title,
    required String subtitle,
    String? route,
  }) async {
    Get.dialog(
      CustomDialog(
        title: title,
        subtitle: subtitle,
      ),
      barrierDismissible: false,
    );

    await Future.delayed(const Duration(seconds: 2));

    if (Get.isDialogOpen ?? false) {
      Get.back();
    }

    if (route != null) {
      Get.offAllNamed(route);
    }
  }
}