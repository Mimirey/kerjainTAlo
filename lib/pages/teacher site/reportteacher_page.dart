import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:projectquranmu_application/components/custom_filterbottomsheet.dart';
import 'package:projectquranmu_application/components/custom_iconbutton.dart';
import 'package:projectquranmu_application/components/custom_searchbar.dart';
import 'package:projectquranmu_application/components/custom_studentcard.dart';
import 'package:projectquranmu_application/components/emptystate.dart';
import 'package:projectquranmu_application/configs/routes.dart';
import 'package:projectquranmu_application/controllers/teacher%20site/teacherreport_controller.dart';
import 'package:projectquranmu_application/utils/bottomsheet_helper.dart';

class TeacherReportPage extends GetView<TeacherReportController> {
  const TeacherReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 40, 10, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Assalamualaikum, User ",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "TPQ Raudatul Jannah",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomSearchbar(
                          controller: TextEditingController(),
                          onChanged: controller.search,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 5),
                        child: CustomIconbutton(
                          icon: Icons.filter_list,
                          onTap: () {
                            BottomsheetHelper.show(
                              context: context,

                              child: CustomFilterBottomsheet(
                                onApply: ({statusLaporan, statusKelancaran}) {
                                  controller.applyFilter(
                                    statusLaporan: statusLaporan,
                                    statusKelancaran: statusKelancaran,
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                Obx(() {
                  if (controller.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (controller.filteredStudents.isEmpty) {
                    return const EmptyState(
                      title: "Belum ada data",
                      subtitle: "Data siswa anda akan muncul disini",
                    );
                  }
                  return Column(
                    children: controller.filteredStudents.map((student) {
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(
                            AppRoutes.bukuprestasiPage,
                            arguments: student.id,
                          );
                        },
                        child: CustomStudentcard(student: student),
                      );
                    }).toList(),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
