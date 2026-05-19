import 'package:flutter/material.dart';

class CustomMonthSelector extends StatelessWidget {
  final int selectedMonth;
  final Function(int) onChanged;

  const CustomMonthSelector({
    super.key,
    required this.selectedMonth,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final months = [
      {"label": "Jan", "value": 1},
      {"label": "Feb", "value": 2},
      {"label": "Mar", "value": 3},
      {"label": "Apr", "value": 4},
      {"label": "Mei", "value": 5},
      {"label": "Jun", "value": 6},
      {"label": "Jul", "value": 7},
      {"label": "Agu", "value": 8},
      {"label": "Sep", "value": 9},
      {"label": "Okt", "value": 10},
      {"label": "Nov", "value": 11},
      {"label": "Des", "value": 12},
    ];

    return SizedBox(
      height: 46,

      child: ListView.separated(
        scrollDirection: Axis.horizontal,

        itemCount: months.length,

        separatorBuilder: (_, __) =>
            const SizedBox(width: 10),

        itemBuilder: (context, index) {
          final month = months[index];

          final isSelected =
              month["value"] == selectedMonth;

          return GestureDetector(
            onTap: () =>
                onChanged(month["value"] as int),

            child: AnimatedContainer(
              duration:
                  const Duration(milliseconds: 250),

              padding:
                  const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 10,
                  ),

              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xFF5BA7A4)
                    : Colors.transparent,

                borderRadius:
                    BorderRadius.circular(14),
              ),

              child: Center(
                child: Text(
                  month["label"].toString(),

                  style: TextStyle(
                    fontWeight: FontWeight.bold,

                    color: isSelected
                        ? Colors.white
                        : Colors.grey,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}