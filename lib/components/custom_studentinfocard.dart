import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomStudentinfocard extends StatelessWidget {
  final String studentName;
  final String jilid;
  final int totalAttendance;
  final String teacherName;

  const CustomStudentinfocard({
    super.key,
    required this.studentName,
    required this.jilid,
    required this.totalAttendance,
    required this.teacherName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            studentName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            jilid,
            style: TextStyle(
              color: Colors.teal.shade400,
            ),
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              const Icon(Icons.calendar_today, size: 16),
              const SizedBox(width: 8),
              Text("Total Kehadiran Bulan Ini : $totalAttendance"),
            ],
          ),

          const SizedBox(height: 8),

          Row(
            children: [
              const Icon(Icons.person, size: 16),
              const SizedBox(width: 8),
              Expanded(
                child: Text("Guru Pengajar : $teacherName"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}