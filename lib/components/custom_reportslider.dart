// custom_report_slider.dart

import 'package:flutter/material.dart';
import 'package:projectquranmu_application/components/custom_reportcard.dart';
import 'package:projectquranmu_application/models/student_model.dart';

class CustomReportSlider extends StatelessWidget {
  final List<Student> students;
  final int currentIndex;
  final Function(int) onPageChanged;
  final PageController pageController;

  const CustomReportSlider({
    super.key,
    required this.students,
    required this.currentIndex,
    required this.onPageChanged,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        SizedBox(
          height: 180,
          child: PageView.builder(
            controller: pageController,
            itemCount: students.length,
            onPageChanged: onPageChanged,

            itemBuilder: (context, index) {
              final student = students[index];

              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: CustomReportcard(
                  studentName: student.nama,
                  reportTitle:
                      student.jilidSekarang ??
                      "Belum Ada Jilid",
                  onTap: () {},
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 12),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            students.length,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: currentIndex == index ? 18 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: currentIndex == index
                    ? Colors.teal
                    : Colors.grey.shade400,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
        ),
      ],
    );
  }
}