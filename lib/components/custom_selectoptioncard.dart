import 'package:flutter/material.dart';

class CustomSelectoptioncard extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  const CustomSelectoptioncard({super.key, required this.icon, required this.label, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        margin: EdgeInsets.only(left: 8),
        duration: const Duration(milliseconds: 200),
        // width: 95,
        height: 120,
        decoration: BoxDecoration(
          color: isSelected
          ?Colors.teal.withOpacity(0.15)
          : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected
          ?Colors.teal
          :Colors.grey.shade400,
          width: 1.5
        )
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: isSelected
                    ? Colors.teal
                    : Colors.grey.shade300,
                child: Icon(
                  icon,
                  color: isSelected
                      ? Colors.white
                      : Colors.grey.shade600,
                ),
              ),
              const SizedBox(height: 8),
          
              Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: isSelected
                      ? Colors.teal
                      : Colors.grey.shade700,
                ),
              ),
            ],
          ),
        ),),
    );
  }
}