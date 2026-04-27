import 'package:flutter/material.dart';

class CustomIconbutton extends StatelessWidget {
  const CustomIconbutton({
    super.key,
    required this.icon,

    this.onTap,

    this.width,
    this.height,
    this.size = 45,

    this.backgroundColor,
    this.selectedColor = const Color(0xff5F9F9F),
    this.iconColor,
    this.selectedIconColor = Colors.white,
    this.borderColor,
    this.selectedBorderColor,

    this.isSelected = false,
    this.radius = 10,
    this.borderWidth = 1,

    this.iconSize = 24,
  });

  final IconData icon;
  final VoidCallback? onTap;

  // size
  final double? width;
  final double? height;
  final double size;

  // state
  final bool isSelected;

  // colors
  final Color? backgroundColor;
  final Color selectedColor;
  final Color? iconColor;
  final Color selectedIconColor;
  final Color? borderColor;
  final Color? selectedBorderColor;

  // style
  final double radius;
  final double borderWidth;

  // icon
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    final w = width ?? size;
    final h = height ?? size;

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: w,
        height: h,
        child: Container(
          decoration: BoxDecoration(
            color: isSelected
                ? selectedColor
                : (backgroundColor ?? Colors.transparent),

            borderRadius: BorderRadius.circular(radius),

            border: Border.all(
              color: isSelected
                  ? (selectedBorderColor ?? selectedColor)
                  : (borderColor ?? Colors.grey.shade400),
              width: borderWidth,
            ),
          ),
          child: Center(
            child: Icon(
              icon,
              size: iconSize,
              color: isSelected
                  ? selectedIconColor
                  : (iconColor ?? Colors.grey.shade700),
            ),
          ),
        ),
      ),
    );
  }
}