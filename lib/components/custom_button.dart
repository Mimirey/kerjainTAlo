import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.onTap,
    this.height = 48,
    this.width = double.infinity,
    this.radius = 12,
    this.backgroundColor = const Color(0xff3C7676),
    this.textStyle,
    this.isDisabled = false,
    this.padding,
  });

  final String text;
  final VoidCallback? onTap;

  final double height;
  final double width;
  final double radius;
  final Color backgroundColor;
  final TextStyle? textStyle;
  final bool isDisabled;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    final effectiveColor =
        isDisabled ? Colors.grey : backgroundColor;

    return InkWell(
      onTap: isDisabled ? null : onTap,
      borderRadius: BorderRadius.circular(radius),
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          color: effectiveColor,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Center(
          child: Text(
            text,
            style: textStyle ??
                const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
      ),
    );
  }
}