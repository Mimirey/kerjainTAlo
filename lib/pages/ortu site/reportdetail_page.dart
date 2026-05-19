import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:projectquranmu_application/components/custom_audioplayerwidget.dart';
import 'package:projectquranmu_application/components/custom_catatanbox.dart';
import 'package:projectquranmu_application/components/custom_headersection.dart';
import 'package:projectquranmu_application/components/custom_ratingrow.dart';
import 'package:projectquranmu_application/models/nilai_model.dart';

class DetailPrestasiPage extends StatelessWidget {
  final NilaiModel report;

  const DetailPrestasiPage({super.key, required this.report});

  static const _statusConfig = {
    'LANCAR': (
      label: 'Lancar',
      bg: Color(0xFFE6FFED),
      light: Color(0xFFE8F5E9),
      sec: Color(0xFF1BC915)
    ),
    'CUKUP_LANCAR': (
      label: 'Cukup\nLancar',
      bg: Color(0xFFFFF8E6),
      light: Color(0xFFFFFDE7),
      sec: Color(0xFF987F4D)
    ),
    'KURANG_LANCAR': (
      label: 'Kurang\nLancar',
      bg: Color(0xFFFFE6E6),
      light: Color(0xFFFFEBEE),
      sec: Color(0xFF984D4D)
    ),
  };

  ({String label, Color bg, Color light, Color sec}) get _config =>
      _statusConfig[report.nilaiBacaan] ??
      (
        label: report.nilaiBacaan,
        bg: Colors.grey.shade100,
        light: Colors.grey.shade100,
        sec: Colors.grey
      );

  @override
  Widget build(BuildContext context) {
    final cfg = _config;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomHeaderSection(report: report, config: cfg),
            const SizedBox(height: 85), 
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      'Status Pembelajaran',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.04),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        CustomRatingRow(label: 'Tajwid', value: report.tajwid),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Divider(color: Color(0xFFEEEEEE)),
                        ),
                        CustomRatingRow(label: 'Makhraj', value: report.makhraj),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  CustomCatatanBox(catatan: report.catatan),
                  const SizedBox(height: 16),
                  if (report.voiceNote != null)
                    CustomAudioPlayerWidget(voiceNotePath: report.voiceNote!),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}