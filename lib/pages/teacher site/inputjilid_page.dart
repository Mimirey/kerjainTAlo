import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectquranmu_application/components/custom_audioinput.dart';
import 'package:projectquranmu_application/components/custom_button.dart';
import 'package:projectquranmu_application/components/custom_datefield.dart';
import 'package:projectquranmu_application/components/custom_dropdownjilid.dart';
import 'package:projectquranmu_application/components/custom_selectedoptiongroup.dart';
import 'package:projectquranmu_application/components/custom_textfield.dart';
import 'package:projectquranmu_application/controllers/teacher%20site/inputjilid_controller.dart';
import 'package:projectquranmu_application/models/selectoption_model.dart';

class InputjilidPage extends GetView<InputjilidController> {
  const InputjilidPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
              child: Row(
                children: [
                  InkWell(
                    onTap: Get.back,
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Text(
                      "Input Kenaikan Jilid",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tgl/Bulan/Tahun",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Obx(
                      () => CustomDatefield(
                        label: "Tgl/Bulan/Tahun",
                        selectedDate: controller.selectedDate.value,
                        onDateSelected: controller.setDate,
                      ),
                    ),

                    Text(
                      "Jilid Berikutnya",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),

                    Obx(() {
                      final data = controller.jilidInfo.value;

                      if (data == null) {
                        return CircularProgressIndicator();
                      }

                      return CustomTextField(
                        hint: controller.student.jilidBerikutnya,
                        borderColor: Colors.grey.shade400,
                        enabled: false,
                      );
                    }),

                    Obx(
                      () => CustomSelectOptionGroup(
                        title: "Tajwid",
                        selectedValue: controller.tajwid.value,
                        onSelected: controller.setTajwid,
                        options: [
                          SelectOption(
                            icon: Icons.check_circle,
                            label: "Lancar",
                            value: 1,
                          ),
                          SelectOption(
                            icon: Icons.star,
                            label: "Cukup Lancar",
                            value: 2,
                          ),
                          SelectOption(
                            icon: Icons.cancel,
                            label: "Kurang Lancar",
                            value: 3,
                          ),
                        ],
                      ),
                    ),

                    Obx(
                      () => CustomSelectOptionGroup(
                        title: "Makhraj",
                        selectedValue: controller.makhraj.value,
                        onSelected: controller.setMakhraj,
                        options: [
                          SelectOption(
                            icon: Icons.check_circle,
                            label: "Lancar",
                            value: 1,
                          ),
                          SelectOption(
                            icon: Icons.star,
                            label: "Cukup Lancar",
                            value: 2,
                          ),
                          SelectOption(
                            icon: Icons.cancel,
                            label: "Kurang Lancar",
                            value: 3,
                          ),
                        ],
                      ),
                    ),

                    Obx(
                      () => CustomSelectOptionGroup(
                        title: "Status Kelulusan",
                        selectedValue: controller.status.value,
                        onSelected: controller.setStatus,
                        options: [
                          SelectOption(
                            icon: Icons.emoji_events,
                            label: "Lulus",
                            value: 1,
                          ),
                          SelectOption(
                            icon: Icons.refresh,
                            label: "Mengulang",
                            value: 2,
                          ),
                        ],
                      ),
                    ),

                    Text(
                      "Catatan",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: CustomTextField(
                        hint: "Catatan dari guru...",
                        controller: controller.catatanController,
                        borderColor: Colors.grey.shade400,
                        minLines: 5,
                        maxLines: null,
                      ),
                    ),

                    Text(
                      "Catatan Audio",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: CustomAudioInput(
                        controller: controller,
                        onRecorded: (path) {
                          controller.setAudio(path); // masuk ke report
                        },
                      ),
                    ),

                    CustomButton(
                      text: "Tambahkan",
                      onTap: () {
                        controller.submit();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
