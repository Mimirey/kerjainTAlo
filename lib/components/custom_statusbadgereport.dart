import 'package:flutter/material.dart';

class StatusBadgeReport extends StatelessWidget {
  final String label;
  final String subLabel;
  final Color bgColor;
  final Color lbColor;

  const StatusBadgeReport({
    required this.label,
    required this.subLabel,
    required this.bgColor, 
    required this.lbColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: bgColor,
            border: Border.all(
              color: lbColor, 
              width: 2.0,     
            ),
            boxShadow: [
              BoxShadow(
                color: bgColor.withOpacity(0.4),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                subLabel,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: lbColor,
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: lbColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  height: 1.1,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
