import 'package:flutter/material.dart';

class CustomDropdownJilid<T> extends StatelessWidget {
  final String title;
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final void Function(T?) onChanged;
  final String hint;
  final IconData? icon;

  const CustomDropdownJilid({
    super.key,
    required this.title,
    required this.value,
    required this.items,
    required this.onChanged,
    this.hint = "Pilih",
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.grey.shade600,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),

        const SizedBox(height: 8),

        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(18),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<T>(
              value: value,
              isExpanded: true,
              hint: Row(
                children: [
                  if (icon != null) ...[
                    Icon(icon, size: 18),
                    const SizedBox(width: 8),
                  ],
                  Text(hint),
                ],
              ),
              items: items,
              onChanged: onChanged,
            ),
          ),
        ),

        const SizedBox(height: 20),
      ],
    );
  }
}