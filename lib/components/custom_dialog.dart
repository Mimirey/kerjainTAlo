import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String subtitle;

  const CustomDialog({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 32,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xff2F4F4F),
              ),
            ),

            const SizedBox(height: 32),

            Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                color: Color(0xff69B3B0),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check,
                color: Colors.white,
                size: 60,
              ),
            ),

            const SizedBox(height: 32),

            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Color(0xff2F4F4F),
              ),
            ),
          ],
        ),
      ),
    );
  }
}