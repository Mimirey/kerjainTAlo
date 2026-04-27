import 'package:flutter/material.dart';
import 'package:projectquranmu_application/models/student_model.dart';

class CustomStudentcard extends StatelessWidget {
  const CustomStudentcard({super.key, required this.student});

  final Student student;

  Color getStatusColor() {
    switch (student.status) {
      case "LANCAR":
        return Colors.green;
      case "KURANG LANCAR":
        return Colors.orange;
      case "CUKUP LANCAR":
        return Colors.yellow.shade700;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
        ),
      child: Row(
        children: [
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                student.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16
                ),
              ),

              Row(
                children: [
                  Icon(Icons.menu_book_rounded, color: Colors.grey.shade500, size: 20,),
                  Text(student.fullKitab)
                ],
              ),
              Row(
                children: [
                  Icon(Icons.circle, color: Colors.grey.shade500, size: 20,),
                  Text(student.laporan)
                ],
              ),

              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4
                ),
                decoration: BoxDecoration(
                  color: getStatusColor().withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Text(
                  student.status,
                  style: TextStyle(
                    color: getStatusColor(),
                    fontSize: 12,
                    fontWeight: FontWeight.w600
                  ),
                ),
              )
            ],
          )),

          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: Color(0xff5F9F9F),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.edit, color: Colors.white),
          ),
        ],
      ),
    );
  }
}