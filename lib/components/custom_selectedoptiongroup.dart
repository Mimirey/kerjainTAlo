import 'package:flutter/material.dart';
import 'package:projectquranmu_application/models/selectoption_model.dart';
import 'custom_selectoptioncard.dart';

class CustomSelectOptionGroup extends StatelessWidget {
  final String title;
  final int selectedValue;
  final Function(int value) onSelected;
  final List<SelectOption> options;

  const CustomSelectOptionGroup({
    super.key,
    required this.title,
    required this.selectedValue,
    required this.onSelected,
    required this.options,
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

        const SizedBox(height: 12),

        Row(
          children: options.map((option) {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: CustomSelectoptioncard(
                  icon: option.icon,
                  label: option.label,
                  isSelected: selectedValue == option.value,
                  onTap: () => onSelected(option.value),
                ),
              ),
            );
          }).toList(),
        ),

        const SizedBox(height: 20),
      ],
    );
  }
}