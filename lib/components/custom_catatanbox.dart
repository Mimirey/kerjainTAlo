import 'package:flutter/material.dart';

class CustomCatatanBox extends StatelessWidget {
  final String catatan;

  const CustomCatatanBox({required this.catatan});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Text(
        catatan.isEmpty ? 'Catatan Ustadz Ustadzah' : catatan,
        style: TextStyle(
          fontSize: 13,
          color: catatan.isEmpty ? Colors.grey : Colors.black87,
          fontStyle: catatan.isEmpty ? FontStyle.italic : FontStyle.normal,
        ),
      ),
    );
  }
}