import 'package:flutter/material.dart';

class CustomCardcontainer extends StatelessWidget {
  const CustomCardcontainer({
    super.key,
    required this.child,

    
    this.padding = const EdgeInsets.all(20),
    this.margin = const EdgeInsets.only(bottom: 20),
    this.backgroundColor = Colors.white,
    this.radius = 25,

    
    this.borderColor,
    this.borderWidth = 1,

    
    this.boxShadow,

    
    this.width,
    this.height,
  });

  final Widget child;

  // style
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final Color backgroundColor;
  final double radius;

  // border
  final Color? borderColor;
  final double borderWidth;

  // shadow
  final List<BoxShadow>? boxShadow;

  // size
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),

        border: borderColor != null
            ? Border.all(
                color: borderColor!,
                width: borderWidth,
              )
            : null,

        boxShadow: boxShadow ??
            [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
      ),
      child: child,
    );
  }
}