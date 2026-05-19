import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:projectquranmu_application/components/custom_studentmodal.dart';
import 'package:projectquranmu_application/components/navbar/nav_controller.dart';
import 'package:projectquranmu_application/components/navbar/navbar.dart';
import 'package:projectquranmu_application/components/navbar/navmodel.dart';
import 'package:projectquranmu_application/controllers/ortu%20site/homeortu_controller.dart';
import 'package:projectquranmu_application/controllers/ortu%20site/reportortu_controller.dart';
import 'package:projectquranmu_application/controllers/profile_controller.dart';
import 'package:projectquranmu_application/pages/ortu%20site/homeortu_page.dart';
import 'package:projectquranmu_application/pages/ortu%20site/reportortu_page.dart';
import 'package:projectquranmu_application/pages/profile_page.dart';

class Ortuattachment extends StatelessWidget {
  Ortuattachment({super.key});
  final controller = Get.put(NavigationController());
  final homeOrtuController = Get.put(HomeortuController());
  final profileController = Get.put(ProfileController());
  final reportController = Get.put(ReportortuController());

  final pages = [HomeortuPage(), ReportortuPage(), ProfilePage()];

  final navItems = [
    NavItem(label: "Home", icon: Icons.home),
    NavItem(label: "Reports", icon: Icons.menu_book),
    NavItem(label: "Profile", icon: Icons.person),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => pages[controller.currentIndex.value]),

      bottomNavigationBar: Obx(
        () => CustomNavbar(
          items: navItems,
          currentIndex: controller.currentIndex.value,
          onTap: controller.changeIndex,
          onCenterTap: () {
            final homeController = Get.find<HomeortuController>();

            // kalau cuma 1 anak
            if (homeController.students.length == 1) {
              homeController.selectStudent(homeController.students.first);

              controller.changeIndex(1);

              return;
            }

            Get.bottomSheet(
              StudentSelectorModal(
                students: homeController.students,

                onSelected: (student) {
                  homeController.selectStudent(student);

                  Get.back();

                  controller.changeIndex(1);
                },
              ),

              isScrollControlled: true,
            );
          },
        ),
      ),
    );
  }
}
