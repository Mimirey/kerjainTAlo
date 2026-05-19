import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:projectquranmu_application/components/buttomcurveclipper.dart';
import 'package:projectquranmu_application/components/custom_statusbadgereport.dart';
import 'package:projectquranmu_application/models/nilai_model.dart';

class CustomHeaderSection extends StatelessWidget {
  final NilaiModel report;

  final ({String label, Color bg, Color light, Color sec}) config;

  const CustomHeaderSection({required this.report, required this.config});

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('dd MMMM yyyy', 'id_ID').format(report.tanggal);
    final jilidLabel = report.jilid.replaceAll('_', ' ');

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        // 1. Background Curved Container
        ClipPath(
          clipper: CustomBottomCurveClipper(),
          child: Container(
            height: 240, 
            width: double.infinity,
            color: const Color(0xFF58A0A0), 
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () => Get.back(),
                          child: const Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.white, 
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 24),
                        Expanded(
                          child: Text(
                            formattedDate,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        Positioned(
          bottom: -70, 
          child: StatusBadgeReport(
            label: config.label,
            bgColor: config.bg,   
            lbColor: config.sec,  
            subLabel: '$jilidLabel Halaman ${report.halaman}',
          ),
        ),
      ],
    );
  }
}