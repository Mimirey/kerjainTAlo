import 'package:flutter/material.dart';

class CustomStarrating extends StatelessWidget {
  final int value;
  final Function(int) onChanged;
  final int max;

  const CustomStarrating({
    super.key,
    required this.value,
    required this.onChanged,
    this.max = 5,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(max, (index){
        return Center(
          child: IconButton(
            onPressed: ()=> onChanged(index + 1), 
            icon: Icon(
              Icons.star_rounded,
              color: index < value ? Colors.yellow : Colors.grey.shade300,
              size: 35,
            )),
        );
      }),
    );
  }
}