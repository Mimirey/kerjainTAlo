import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:projectquranmu_application/components/custom_achievmentcard.dart';
import 'package:projectquranmu_application/components/custom_monthselector.dart';
import 'package:projectquranmu_application/components/custom_studentinfocard.dart';
import 'package:projectquranmu_application/components/emptystate.dart';
import 'package:projectquranmu_application/configs/routes.dart';
import 'package:projectquranmu_application/controllers/ortu%20site/reportortu_controller.dart';

class ReportortuPage extends GetView<ReportortuController> {
  const ReportortuPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                        child: Text(
                          "Input Perkembangan Siswa",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
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
                    Text("Hari Ini / Tanggal", style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black
                    ),),
                    Text("Februari, 11 2026", style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.italic,
                      color: Colors.grey
                    ),),
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

               Obx((){
                if (controller.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (controller.filteredReports.isEmpty) {
                  return const EmptyState(
                    title: "Belum ada data", 
                    subtitle: "Data siswa anda akan muncul disini");
                }
                 return Column(
                  children: controller.filteredReports.map((student){
                    return GestureDetector(
                      onTap: (){
                        Get.toNamed(AppRoutes.bukuprestasiPage, arguments: student);
                      },
                      child: CustomAchievementCard(
                      title: "title", 
                      date: "date", 
                      categories: ["a","b","c"], 
                      teacherName: "teacherName", 
                      status: "status")
                     );
                  }).toList()
                );
               })

              // Obx(
              //   () => Column(
              //     children: controller.filteredReports.map((report) {
              //       return CustomAchievementCard(
              //         title: "title", 
              //         date: "date", 
              //         categories: ["a","b","c"], 
              //         teacherName: "teacherName", 
              //         status: "status");
              //     }).toList(),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
