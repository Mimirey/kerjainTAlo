import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectquranmu_application/components/custom_button.dart';
import 'package:projectquranmu_application/components/custom_cardcontainer.dart';
import 'package:projectquranmu_application/components/custom_iconbutton.dart';
import 'package:projectquranmu_application/components/custom_statusbadge.dart';
import 'package:projectquranmu_application/controllers/teacher%20site/bukuprestasi_controller.dart';

class BukuprestasiPage extends GetView<BukuprestasiController> {
  const BukuprestasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffD1DCDC),
      body: SingleChildScrollView(
        child: Obx(() {
          final student = controller.bukuPrestasi.value;

          if (student == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Stack(
            children: [
              Container(
                width: double.infinity,
                height: 400,
                decoration: const BoxDecoration(
                  color: Color(0xff58A0A0),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(80),
                    bottomRight: Radius.circular(80),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(
                  10,
                  30,
                  10,
                  10,
                ),
                child: Row(
                  children: [
                    InkWell(
                      onTap: Get.back,
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),

                    const Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: Text(
                        "Back",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(
                  20,
                  80,
                  20,
                  20,
                ),
                child: Column(
                  children: [
                    /// CARD PERKEMBANGAN
                    CustomCardcontainer(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            student.murid,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.shade800,
                            ),
                          ),

                          Container(
                            margin: const EdgeInsets.only(
                              bottom: 16,
                            ),
                            child: Text(
                              student.tanggalKenaikanTerakhir.toString(),
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 16,
                                color: Colors.grey.shade800,
                              ),
                            ),
                          ),

                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(25),
                              color: const Color(0xffF3FDFB),
                            ),
                            margin: const EdgeInsets.only(
                              bottom: 20,
                            ),
                            child: Column(
                              children: [
                                const Center(
                                  child: Text(
                                    "Terakhir",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight:
                                          FontWeight.bold,
                                      color:
                                          Color(0xff1E4A3C),
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 16),

                                Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment
                                          .start,
                                  children: [
                                    CustomIconbutton(
                                      size: 50,
                                      icon: Icons
                                          .menu_book_rounded,
                                      width: 75,
                                      height: 85,
                                      iconSize: 40,
                                      iconColor:
                                          const Color(
                                            0xff589F9F,
                                          ),
                                      backgroundColor:
                                          Colors.white,
                                    ),

                                    const SizedBox(width: 8),

                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment
                                                .start,
                                        children: [
                                          Row(
                                            children: [
                                              const Text(
                                                "Kitab: ",
                                                style:
                                                    TextStyle(
                                                      fontSize:
                                                          16,
                                                      fontWeight:
                                                          FontWeight
                                                              .w500,
                                                      color: Color(
                                                        0xff1E4A3C,
                                                      ),
                                                    ),
                                              ),

                                              Text(
                                                student.jilidSekarang ??
                                                    "-",
                                                style:
                                                    const TextStyle(
                                                      fontSize:
                                                          16,
                                                      color: Color(
                                                        0xff1E4A3C,
                                                      ),
                                                    ),
                                              ),
                                            ],
                                          ),

                                          const SizedBox(
                                            height: 8,
                                          ),

                                          Row(
                                            children: [
                                              const Text(
                                                "Status: ",
                                                style:
                                                    TextStyle(
                                                      fontSize:
                                                          16,
                                                      fontWeight:
                                                          FontWeight
                                                              .w500,
                                                      color: Color(
                                                        0xff1E4A3C,
                                                      ),
                                                    ),
                                              ),

                                              Flexible(
                                                child:
                                                    StatusBadge(
                                                      status:
                                                          student.statusTerakhir
                                                    ),
                                              ),
                                            ],
                                          ),

                                          const SizedBox(
                                            height: 8,
                                          ),

                                          Text(
                                              student.halaman != null
                                              ? "Halaman ${student.halaman}"
                                              : "Belum ada halaman"
                                          ),

                                          const SizedBox(
                                            height: 4,
                                          ),

                                          Text(
                                            student.laporan
                                          ),

                                          const SizedBox(
                                            height: 4,
                                          ),

                                          Text(
                                            student.tanggalKenaikanTerakhir ??
                                                "-",
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
                            text:
                                "Input Perkembangan Siswa",
                            width: double.infinity,
                            radius: 20,
                            backgroundColor:
                                const Color(0xff5F9F9F),
                            textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            onTap: controller
                                .goToInputPerkembangan,
                          ),
                        ],
                      ),
                    ),

                    /// CARD KENAIKAN JILID
                    CustomCardcontainer(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            student.murid,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.shade800,
                            ),
                          ),

                          const SizedBox(height: 16),

                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(25),
                              color: const Color(0xffF3FDFB),
                            ),
                            margin: const EdgeInsets.only(
                              bottom: 20,
                            ),
                            child: Column(
                              children: [
                                const Center(
                                  child: Text(
                                    "Jilid",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight:
                                          FontWeight.bold,
                                      color:
                                          Color(0xff1E4A3C),
                                    ),
                                  ),
                                ),

                                Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment
                                          .center,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          CustomCardcontainer(
                                            child: Text(
                                              student.jilidSekarang ??
                                                  "-",
                                              style:
                                                  const TextStyle(
                                                    fontWeight:
                                                        FontWeight
                                                            .bold,
                                                    color: Color(
                                                      0xff589F9F,
                                                    ),
                                                    fontSize:
                                                        18,
                                                  ),
                                            ),
                                            backgroundColor:
                                                Colors.white,
                                            padding:
                                                const EdgeInsets.all(
                                                  15,
                                                ),
                                            radius: 15,
                                            boxShadow: const [],
                                            borderColor:
                                                const Color(
                                                  0xff717171,
                                                ),
                                            borderWidth: 0.5,
                                          ),

                                          const Text(
                                            "JILID SEKARANG",
                                            textAlign:
                                                TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),

                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(
                                            horizontal: 8,
                                          ),
                                      child: Icon(
                                        Icons.trending_up,
                                        color: Color(
                                          0xff58A0A0,
                                        ),
                                        size: 35,
                                      ),
                                    ),

                                    Expanded(
                                      child: Column(
                                        children: [
                                          CustomCardcontainer(
                                            child: Text(
                                              student.jilidBerikutnya,
                                              style:
                                                  const TextStyle(
                                                    fontWeight:
                                                        FontWeight
                                                            .bold,
                                                    color: Color(
                                                      0xff589F9F,
                                                    ),
                                                    fontSize:
                                                        18,
                                                  ),
                                            ),
                                            backgroundColor:
                                                Colors.white,
                                            padding:
                                                const EdgeInsets.all(
                                                  15,
                                                ),
                                            radius: 15,
                                            boxShadow: const [],
                                            borderColor:
                                                const Color(
                                                  0xff717171,
                                                ),
                                            borderWidth: 0.5,
                                          ),

                                          const Text(
                                            "JILID LANJUTAN",
                                            textAlign:
                                                TextAlign.center,
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
                            backgroundColor:
                                const Color(0xff5F9F9F),
                            textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            onTap:
                                controller.goToInputJilid,
                                
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