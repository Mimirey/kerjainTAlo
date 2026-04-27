import 'package:flutter/material.dart';

class CustomStatusselector extends StatelessWidget {
  final String value;
  final Function(String) onChanged;

  const CustomStatusselector({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final options = [
      {"label": "Lancar", "color": Colors.green},
      {"label": "Cukup Lancar", "color": Colors.orange},
      {"label": "Kurang Lancar", "color": Colors.red},
    ];
    return Column(
      children: options.map((item) {
        return Row(
          children: [
            Radio<String>(
              value: item["label"] as String,
              groupValue: value,
              onChanged: (val)=> onChanged(val!),
            ),
            Container(
              width: 10,
              height: 10,
              margin: EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                color: item["color"] as Color,
                shape: BoxShape.circle
              ),
            ),
            Text(item["label"] as String, style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),),
          ],
        );
      }).toList(),
    );
  }
}