import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:projectquranmu_application/components/profile/custom_logoutbutton.dart';
import 'package:projectquranmu_application/components/profile/custom_profilecard.dart';
import 'package:projectquranmu_application/components/profile/custom_profileheader.dart';
import 'package:projectquranmu_application/controllers/login_controller.dart';
import 'package:projectquranmu_application/controllers/profile_controller.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomProfileheader(name: "Ferry Hidayat", email: "hidayat@gmail.com"),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Informasi Akun",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 20),

                  CustomProfilecard(
                    icon: Icons.emoji_emotions_outlined,
                    title: "Anak Terdaftar",
                    items: ["Sylviana Jelita", "Arsya Muhammad Faisyar"],
                  ),

                  CustomProfilecard(
                    icon: Icons.family_restroom,
                    title: "Hubungan",
                    items: ["Ayah"],
                  ),

                  CustomProfilecard(
                    icon: Icons.access_time,
                    title: "Bergabung Sejak",
                    items: ["10-01-2026"],
                  ),

                  const SizedBox(height: 30),

                  CustomLogoutButton(onTap: controller.logout),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
