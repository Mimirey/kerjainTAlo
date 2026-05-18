// featured_report_slider.dart

import 'package:flutter/material.dart';
import 'package:projectquranmu_application/components/custom_reportcard.dart';

class CustomReportSlider extends StatefulWidget {
  const CustomReportSlider({super.key});

  @override
  State<CustomReportSlider> createState() =>
      _FeaturedReportSliderState();
}

class _FeaturedReportSliderState
    extends State<CustomReportSlider> {
  final PageController controller = PageController(
    viewportFraction: 0.92,
  );

  int currentIndex = 0;

  final List<Map<String, dynamic>> reports = [
    {
      "name": "Sylviana Jelita",
      "report": "Laporan Januari 2026",
    },
    {
      "name": "Arsya Muhammad",
      "report": "Laporan Februari 2026",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 180,
          child: PageView.builder(
            controller: controller,
            itemCount: reports.length,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              final item = reports[index];

              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: CustomReportcard(
                  studentName: item["name"],
                  reportTitle: item["report"],
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
            reports.length,
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