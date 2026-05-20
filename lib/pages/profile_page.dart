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
        child: Obx(() {
          if (controller.isLoading.value) {
            return CircularProgressIndicator();
          }

          final data = controller.profile.value;

          if (data == null) {
            return Text("Tidak ada data");
          }

          return Column(
            children: [
              CustomProfileheader(name: data.nama, email: data.user.email),

              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Informasi Akun",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    if (data.user.role == "WALI_MURID") ...[
                      CustomProfilecard(
                        icon: Icons.child_care,
                        title: "Anak Terdaftar",
                        items: data.murid.map((e) => e.nama).toList(),
                      ),

                      CustomProfilecard(
                        icon: Icons.family_restroom,
                        title: "Hubungan",
                        items: [data.peran ?? "-"],
                      ),
                    ],

                    if (data.user.role == "GURU") ...[
                      CustomProfilecard(
                        icon: Icons.school,
                        title: "Murid Diajar",
                        items: data.murid.map((e) => e.nama).toList(),
                      ),

                      CustomProfilecard(
                        icon: Icons.groups,
                        title: "Jumlah Murid",
                        items: ["${data.murid.length} Murid"],
                      ),

                      CustomProfilecard(
                        icon: Icons.phone,
                        title: "No HP",
                        items: [data.noHp ?? "-"],
                      ),
                    ],
                    const SizedBox(height: 30),
                    CustomLogoutButton(onTap: controller.logout),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
