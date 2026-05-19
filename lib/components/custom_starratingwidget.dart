import 'package:flutter/material.dart';

class StarRatingWidget extends StatelessWidget {
  final int value;
  final int total;
  final double size;
  final Color filledColor;
  final Color emptyColor;

  const StarRatingWidget({
    super.key,
    required this.value,
    this.total = 5,
    this.size = 22,
    this.filledColor = const Color(0xFFFFC107),
    this.emptyColor = const Color(0xFFE0E0E0),
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(total, (i) {
        return Icon(
          i < value ? Icons.star_rounded : Icons.star_outline_rounded,
          color: i < value ? filledColor : emptyColor,
          size: size,
        );
      }),
    );
  }
}