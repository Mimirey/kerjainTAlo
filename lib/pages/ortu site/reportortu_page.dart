import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:intl/intl.dart';
import 'package:projectquranmu_application/components/custom_achievmentcard.dart';
import 'package:projectquranmu_application/components/custom_monthselector.dart';
import 'package:projectquranmu_application/components/emptystate.dart';
import 'package:projectquranmu_application/controllers/ortu%20site/reportortu_controller.dart';
import 'package:projectquranmu_application/pages/ortu%20site/reportdetail_page.dart';

class ReportortuPage extends GetView<ReportortuController> {
  const ReportortuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedStudent = controller.selectedStudent.value;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: SizedBox(
                  height: 40,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // TITLE TENGAH
                      Center(
                        child: Obx(() {
                          final student = controller.selectedStudent.value;

                          return Text(
                            student?.nama ?? "Input Perkembangan Siswa",

                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          );
                        }),
                      ),

                      // ICON KIRI
                      Align(
                        alignment: Alignment.centerLeft,
                        child: InkWell(
                          onTap: Get.back,
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            size: 20,
                            color: Colors.grey,
                          ),
                        ),
                      ),

                      // ICON KANAN
                      Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.filter_list_rounded,
                          size: 30,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hari Ini / Tanggal",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Februari, 11 2026",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.only(bottom: 12),
                child: Obx(
                  () => CustomMonthSelector(
                    selectedMonth: controller.selectedMonth.value,
                    onChanged: controller.changeMonth,
                  ),
                ),
              ),

              Obx(() {
                final student = controller.selectedStudent.value;

                if (student == null) {
                  return const EmptyState(
                    title: "Belum memilih siswa",
                    subtitle: "Silakan pilih siswa terlebih dahulu",
                  );
                }

                if (controller.filteredReports.isEmpty) {
                  return const EmptyState(
                    title: "Belum ada laporan",
                    subtitle: "Laporan perkembangan akan muncul disini",
                  );
                }

                return Column(
                  children: controller.filteredReports.map((report) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 14),
                      child: InkWell(
                        onTap: () {
                          Get.to(()=> DetailPrestasiPage(report: report));
                        },
                        child: CustomAchievementCard(
                          title: "${report.jilid} • Hal ${report.halaman}",
                          
                          date: DateFormat(
                            'dd MMM yyyy',
                            'id_ID',
                          ).format(report.tanggal),
                        
                          categories: [
                            "Tajwid ${report.tajwid}",
                            "Makhraj ${report.makhraj}",
                          ],
                          teacherName: report.nilaiBacaan,
                          status: report.nilaiBacaan,
                        ),
                      ),
                    );
                  }).toList(),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
