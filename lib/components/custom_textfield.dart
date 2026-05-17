import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    this.icon,
    this.isPassword = false,
    this.radius = const BorderRadius.all(Radius.circular(12)),
    this.controller,
    this.keyboardType,
    this.onChanged,
    this.textStyle,
    this.hintStyle,
    this.fillColor,
    this.borderColor,
    this.focusedBorderColor,
    this.enabledBorderColor,
    this.contentPadding,
    this.maxLines,
    this.minLines,
    this.enabled = true,
  });
  final bool enabled;
  final int? maxLines;
  final int? minLines;

  final String hint;
  final IconData? icon;
  final bool isPassword;
  final BorderRadius radius;
  final EdgeInsets? contentPadding;

  final Color? borderColor;
  final Color? focusedBorderColor;
  final Color? enabledBorderColor;

  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;

  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final Color? fillColor;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: widget.enabled,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      onChanged: widget.onChanged,
      obscureText: widget.isPassword ? isObscure : false,
      style: widget.textStyle,
      maxLines: widget.isPassword ? 1 : widget.maxLines,
      minLines: widget.minLines,

      decoration: InputDecoration(
        contentPadding: widget.contentPadding,
        hintText: widget.hint,
        hintStyle: widget.hintStyle,

        filled: widget.fillColor != null,
        fillColor: widget.fillColor,

        prefixIcon: widget.icon != null ? Icon(widget.icon) : null,

        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  isObscure ? Icons.visibility_off_outlined : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
              )
            : null,

        border: OutlineInputBorder(
          borderRadius: widget.radius,
          borderSide: BorderSide(color: widget.borderColor ?? Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: widget.radius,
          borderSide: BorderSide(
            color: widget.enabledBorderColor ?? Colors.grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: widget.radius,
          borderSide: BorderSide(
            color: widget.focusedBorderColor ?? Colors.teal,
            width: 2,
          ),
        ),
      ),
    );
  }
}
