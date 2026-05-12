import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDatefield extends StatelessWidget {
  final String label;
  final DateTime? selectedDate;
  final Function(DateTime) onDateSelected;

  const CustomDatefield({
    super.key,
    required this.label,
    required this.selectedDate,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(
      text: selectedDate != null
          ? DateFormat('dd/MM/yyyy').format(selectedDate!)
          : '',
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: controller,
          readOnly: true,
          decoration: InputDecoration(
            hintText: 'Contoh: 12/03/2026',
            prefixIcon: const Icon(Icons.calendar_today),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onTap: () async {
            DateTime? picked = await showDatePicker(
              context: context,
              initialDate: selectedDate ?? DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
            );

            if (picked != null) {
              onDateSelected(picked);
            }
          },
        )
      ],
    );
  }
}