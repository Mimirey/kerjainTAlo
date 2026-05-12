import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:projectquranmu_application/components/custom_button.dart';
import 'package:projectquranmu_application/components/custom_cardcontainer.dart';
import 'package:projectquranmu_application/components/custom_iconbutton.dart';
import 'package:projectquranmu_application/components/custom_statusbadge.dart';
import 'package:projectquranmu_application/components/custom_textfield.dart';
import 'package:projectquranmu_application/configs/routes.dart';
import 'package:projectquranmu_application/controllers/teacher%20site/bukuprestasi_controller.dart';

class BukuprestasiPage extends GetView<BukuprestasiController> {
  const BukuprestasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffD1DCDC),
      body: SingleChildScrollView(
        child: Obx(() {
          final student = controller.student.value;

          if (student == null) {
            return Center(child: CircularProgressIndicator());
          }

          return Stack(
            children: [
              Container(
                width: double.infinity,
                height: 400,
                decoration: BoxDecoration(
                  color: Color(0xff58A0A0),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(80),
                    bottomRight: Radius.circular(80),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                child: Row(
                  children: [
                    InkWell(
                      onTap: Get.back,
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Text("Back", style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      fontWeight: FontWeight.w600
                      ),),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 80, 20, 20),
                child: Column(
                  children: [
                    CustomCardcontainer(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            student.name,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.shade800,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 16),
                            child: Text(
                              student.date,
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 16,
                                color: Colors.grey.shade800,
                              ),
                            ),
                          ),

                          Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Color(0xffF3FDFB),
                            ),
                            margin: EdgeInsets.only(bottom: 20),
                            child: Column(
                              children: [
                                Center(
                                  child: Text(
                                    "Terakhir",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff1E4A3C),
                                    ),
                                  ),
                                ),

                                SizedBox(height: 16),

                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomIconbutton(
                                      size: 50,
                                      icon: Icons.menu_book_rounded,
                                      width: 75,
                                      height: 85,
                                      iconSize: 40,
                                      iconColor: Color(0xff589F9F),
                                      backgroundColor: Colors.white,
                                    ),
                                    SizedBox(width: 8),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "Kitab: ",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xff1E4A3C),
                                                ),
                                              ),
                                              Text(
                                                student.kitab,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xff1E4A3C),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Status: ",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xff1E4A3C),
                                                ),
                                              ),
                                              Flexible(
                                                child: StatusBadge(
                                                  status: student.status,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          CustomButton(
                            text: "Input Perkembangan Siswa",
                            width: double.infinity,
                            radius: 20,
                            backgroundColor: Color(0xff5F9F9F),
                            textStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            onTap: controller.goToInputPerkembangan,
                          ),
                        ],
                      ),
                    ),

                    CustomCardcontainer(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            student.name,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.shade800,
                            ),
                          ),
                          Text(
                            student.date,
                            style: TextStyle(
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                              color: Colors.grey.shade800,
                            ),
                          ),

                          SizedBox(height: 16),

                          Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Color(0xffF3FDFB),
                            ),
                            margin: EdgeInsets.only(bottom: 20),
                            child: Column(
                              children: [
                                Center(
                                  child: Text(
                                    "Jilid",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff1E4A3C),
                                    ),
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          CustomCardcontainer(
                                            child: Text(
                                              student.shortKitab,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xff589F9F),
                                                fontSize: 18,
                                              ),
                                            ),
                                            backgroundColor: Colors.white,
                                            padding: EdgeInsets.all(15),
                                            radius: 15,
                                            boxShadow: [],
                                            borderColor: Color(0xff717171),
                                            borderWidth: 0.5,
                                          ),
                                          Text(
                                            "JILID SEKARANG",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff696969),
                                              fontSize: 14,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                      ),
                                      child: Icon(
                                        Icons.trending_up,
                                        color: Color(0xff58A0A0),
                                        size: 35,
                                        weight: 100,
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          CustomCardcontainer(
                                            child: Text(
                                              "Yanbu 2",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xff589F9F),
                                                fontSize: 18,
                                              ),
                                            ),
                                            backgroundColor: Colors.white,
                                            padding: EdgeInsets.all(15),
                                            radius: 15,
                                            boxShadow: [],
                                            borderColor: Color(0xff717171),
                                            borderWidth: 0.5,
                                          ),
                                          Text(
                                            "JILID LANJUTAN",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff696969),
                                              fontSize: 14,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          CustomButton(
                            text: "Input Kenaikan Jilid",
                            width: double.infinity,
                            radius: 20,
                            backgroundColor: Color(0xff5F9F9F),
                            textStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            onTap: controller.goToInputJilid,
                          ),
                        ],
                      ),
                    ),
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
