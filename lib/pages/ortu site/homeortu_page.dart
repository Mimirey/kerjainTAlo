import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:projectquranmu_application/components/custom_barchart.dart';
import 'package:projectquranmu_application/components/custom_reportslider.dart';
import 'package:projectquranmu_application/components/custom_schedulecard.dart';
import 'package:projectquranmu_application/components/custom_studentinfocard.dart';
import 'package:projectquranmu_application/controllers/login_controller.dart';
import 'package:projectquranmu_application/controllers/ortu%20site/homeortu_controller.dart';
import 'package:projectquranmu_application/dummy%20data/dummyChartHomeTeacher.dart';
import 'package:projectquranmu_application/dummy%20data/dummySchedule.dart';

class HomeortuPage extends GetView<HomeortuController> {
  HomeortuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 40, 10, 10),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 30),
                child: Row(
                  children: [
                    // IMAGE
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.person, color: Colors.grey),
                      ),
                    ),

                    // TEXT
                    Expanded(
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
                  ],
                ),
              ),

              Obx(() {
                if (controller.isLoading.value) {
                  return const CircularProgressIndicator();
                }

                if (controller.students.isEmpty) {
                  return const Text("Belum ada murid");
                }

                return CustomReportSlider(
                  students: controller.students,
                  currentIndex: controller.currentSliderIndex.value,
                  onPageChanged: controller.changeSlider,
                  pageController: controller.pageController,
                );
              }),

              Obx(
                () => Column(
                  children: controller.students.map((student) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: CustomStudentinfocard(
                        studentName: student.nama,

                        jilid: student.jilidSekarang ?? "Belum Ada Jilid",

                        totalAttendance: student.kenaikanJilid.length,

                        teacherName: student.guruName,
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
