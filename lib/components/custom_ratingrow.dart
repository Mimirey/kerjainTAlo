import 'package:flutter/material.dart';
import 'package:projectquranmu_application/components/custom_starratingwidget.dart';

class CustomRatingRow extends StatelessWidget {
  final String label;
  final int value; // 1–5

  const CustomRatingRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 70,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ),
        const SizedBox(width: 8),
        StarRatingWidget(value: value, total: 5),
      ],
    );
  }
}