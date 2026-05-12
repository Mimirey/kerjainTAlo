import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectquranmu_application/components/custom_audioinput.dart';
import 'package:projectquranmu_application/components/custom_button.dart';
import 'package:projectquranmu_application/components/custom_datefield.dart';
import 'package:projectquranmu_application/components/custom_starrating.dart';
import 'package:projectquranmu_application/components/custom_statusselector.dart';
import 'package:projectquranmu_application/components/custom_textfield.dart';
import 'package:projectquranmu_application/controllers/teacher%20site/inputharian_controller.dart';

class InputharianPage extends GetView<InputHarianController> {
  const InputharianPage({super.key});

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
                      "Input Perkembangan Siswa",
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
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Jilid",
                                  style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                CustomTextField(
                                  hint: "Jilid...",
                                  borderColor: Colors.grey.shade400,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Halaman",
                                  style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                CustomTextField(
                                  hint: "Halaman...",
                                  borderColor: Colors.grey.shade400,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "Nilai Bacaan",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Obx(
                        () => CustomStatusselector(
                          value: controller.status.value,
                          onChanged: controller.setStatus,
                        ),
                      ),
                    ),

                    Text(
                      "Tajwid",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Obx(
                          () => Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomStarrating(
                                value: controller.tajwid.value,
                                onChanged: controller.setTajwid,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    Text(
                      "Makhraj",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Obx(
                        () => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomStarrating(
                              value: controller.makhraj.value,
                              onChanged: controller.setMakhraj,
                            ),
                          ],
                        ),
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
