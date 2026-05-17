import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:projectquranmu_application/components/navbar/nav_controller.dart';
import 'package:projectquranmu_application/components/navbar/navbar.dart';
import 'package:projectquranmu_application/components/navbar/navmodel.dart';
import 'package:projectquranmu_application/pages/ortu%20site/homeortu_page.dart';

class Ortuattachment extends StatelessWidget {
  Ortuattachment({super.key});
  final controller = Get.put(NavigationController());

  final pages = [
    HomeortuPage(),
    // TeacherReportPage(),
    // ProfilePage(),
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