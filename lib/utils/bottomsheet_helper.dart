import 'package:flutter/material.dart';

class BottomsheetHelper {

  static Future<void> show({
    required BuildContext context,
    required Widget child,
  }) async {

    await showModalBottomSheet(
      context: context,

      isScrollControlled: true,

      backgroundColor: Colors.transparent,

      builder: (_) => child,
    );
  }
}