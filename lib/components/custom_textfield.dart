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
  });

  final String hint;
  final IconData? icon;
  final bool isPassword;
  final BorderRadius radius;

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
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      onChanged: widget.onChanged,
      obscureText: widget.isPassword ? isObscure : false,
      style: widget.textStyle,
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: widget.hintStyle,

        filled: widget.fillColor != null,
        fillColor: widget.fillColor,

        prefixIcon: widget.icon != null ? Icon(widget.icon) : null,

        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  isObscure
                      ? Icons.visibility_off_outlined
                      : Icons.visibility,
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
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: widget.radius,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: widget.radius,
          borderSide: BorderSide(color: Colors.teal),
        ),
      ),
    );
  }
}