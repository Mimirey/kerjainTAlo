import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomFilterBottomsheet extends StatefulWidget {
  final Function({
    String? statusLaporan,
    String? statusKelancaran,
  }) onApply;

  const CustomFilterBottomsheet({
    super.key,
    required this.onApply,
  });

  @override
  State<CustomFilterBottomsheet> createState() =>
      _CustomFilterBottomsheetState();
}

class _CustomFilterBottomsheetState
    extends State<CustomFilterBottomsheet> {

  String? selectedStatusLaporan;
  String? selectedKelancaran;

  Widget buildChip({
    required String title,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 12,
        ),

        decoration: BoxDecoration(
          color: selected
              ? const Color(0xff5FA8A7)
              : Colors.grey.shade100,

          borderRadius: BorderRadius.circular(14),

          border: Border.all(
            color: selected
                ? const Color(0xff5FA8A7)
                : Colors.grey.shade300,
          ),
        ),

        child: Text(
          title,
          style: TextStyle(
            color:
                selected ? Colors.white : Colors.black87,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),

      decoration: const BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),

      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            // HANDLE
            Center(
              child: Container(
                width: 60,
                height: 6,

                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),

            const SizedBox(height: 24),

            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,

              children: [
                const Text(
                  "Filter Siswa",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                GestureDetector(
                  onTap: () => Get.back(),

                  child: const Icon(Icons.close),
                ),
              ],
            ),

            const SizedBox(height: 28),

            const Text(
              "STATUS LAPORAN",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 14),

            Wrap(
              spacing: 10,
              runSpacing: 10,

              children: [
                buildChip(
                  title: "Semua",
                  selected:
                      selectedStatusLaporan == "SEMUA",

                  onTap: () {
                    setState(() {
                      selectedStatusLaporan = "SEMUA";
                    });
                  },
                ),

                buildChip(
                  title: "Belum Diisi",
                  selected:
                      selectedStatusLaporan ==
                          "BELUM",

                  onTap: () {
                    setState(() {
                      selectedStatusLaporan = "BELUM";
                    });
                  },
                ),

                buildChip(
                  title: "Sudah Diisi",
                  selected:
                      selectedStatusLaporan ==
                          "SUDAH",

                  onTap: () {
                    setState(() {
                      selectedStatusLaporan = "SUDAH";
                    });
                  },
                ),
              ],
            ),

            const SizedBox(height: 28),

            const Text(
              "STATUS KELANCARAN",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 14),

            Wrap(
              spacing: 10,
              runSpacing: 10,

              children: [

                buildChip(
                  title: "Lancar",

                  selected:
                      selectedKelancaran ==
                          "LANCAR",

                  onTap: () {
                    setState(() {
                      selectedKelancaran =
                          "LANCAR";
                    });
                  },
                ),

                buildChip(
                  title: "Cukup Lancar",

                  selected:
                      selectedKelancaran ==
                          "CUKUP_LANCAR",

                  onTap: () {
                    setState(() {
                      selectedKelancaran =
                          "CUKUP_LANCAR";
                    });
                  },
                ),

                buildChip(
                  title: "Kurang Lancar",

                  selected:
                      selectedKelancaran ==
                          "KURANG_LANCAR",

                  onTap: () {
                    setState(() {
                      selectedKelancaran =
                          "KURANG_LANCAR";
                    });
                  },
                ),
              ],
            ),

            const SizedBox(height: 34),

            Row(
              children: [

                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      setState(() {
                        selectedKelancaran = null;
                        selectedStatusLaporan = null;
                      });
                    },

                    child: const Text("Reset"),
                  ),
                ),

                const SizedBox(width: 14),

                Expanded(
                  flex: 2,

                  child: ElevatedButton(
                    onPressed: () {

                      widget.onApply(
                        statusLaporan:
                            selectedStatusLaporan,

                        statusKelancaran:
                            selectedKelancaran,
                      );

                      Get.back();
                    },

                    child: const Text(
                      "Terapkan Filter",
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}