import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectquranmu_application/components/navbar/nav_controller.dart';
import 'package:projectquranmu_application/components/navbar/navbar.dart';
import 'package:projectquranmu_application/components/navbar/navmodel.dart';
import 'package:projectquranmu_application/pages/profile_page.dart';
import 'package:projectquranmu_application/pages/teacher%20site/reportteacher_page.dart';
import 'package:projectquranmu_application/pages/teacher%20site/hometeacher_page.dart';

class Attachment extends StatelessWidget {
  Attachment({super.key});
  final controller = Get.put(NavigationController());

  final pages = [
    HometeacherPage(),
    TeacherReportPage(),
    ProfilePage(),
  ];

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
            controller.changeIndex(1);
          },
        ),
      ),
    );
  }
}