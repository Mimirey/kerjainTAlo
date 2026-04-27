import 'package:flutter/material.dart';

class CustomSearchbar extends StatelessWidget {
  const CustomSearchbar({
    super.key, 
    this.controller, 
    this.onChanged, 
   this.hint= "Search"});

  final TextEditingController? controller;
  final Function(String)? onChanged;
  final String hint;


  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(Icons.search),

        suffixIcon: controller!= null && controller!.text.isNotEmpty
                  ? IconButton(
                    icon: Icon(Icons.close),
                onPressed: () {
                  controller!.clear();
                },
              )
            : null,

        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: Colors.grey
          ),
        )
      ),
    );
  }
}