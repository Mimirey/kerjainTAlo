import 'package:flutter/material.dart';
import 'package:projectquranmu_application/models/student_model.dart';

class CustomStudentcard extends StatelessWidget {
  const CustomStudentcard({
    super.key,
    required this.student,
  });

  final Student student;

  Color getStatusColor(String status) {
    switch (status) {
      case "LULUS":
        return Colors.green;

      case "KURANG_LANCAR":
        return Colors.orange;

      case "CUKUP_LANCAR":
        return Colors.yellow.shade700;

      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {

    final latest =
        student.kenaikanJilid.isNotEmpty
            ? student.kenaikanJilid.first
            : null;

    final status =
        latest?.statusKelulusan ??
        "BELUM ADA";

    return Container(
      margin: const EdgeInsets.only(
        bottom: 12,
      ),
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),

        border: Border.all(
          color: Colors.grey.shade300,
        ),
      ),

      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [

                /// NAMA
                Text(
                  student.nama,

                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 6),

                /// JILID
                Row(
                  children: [
                    Icon(
                      Icons.menu_book_rounded,
                      color: Colors.grey.shade500,
                      size: 20,
                    ),

                    const SizedBox(width: 4),

                    Text(
                      student.jilidSekarang ??
                          "-",
                    ),
                  ],
                ),

                const SizedBox(height: 4),

                /// CATATAN
                Row(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [
                    Icon(
                      Icons.notes,
                      color: Colors.grey.shade500,
                      size: 20,
                    ),

                    const SizedBox(width: 4),

                    Expanded(
                      child: Text(
                        latest?.catatan ??
                            "Belum ada laporan",
                        maxLines: 2,
                        overflow:
                            TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                /// STATUS
                Container(
                  padding:
                      const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),

                  decoration: BoxDecoration(
                    color: getStatusColor(
                      status,
                    ).withOpacity(0.2),

                    borderRadius:
                        BorderRadius.circular(20),
                  ),

                  child: Text(
                    status,

                    style: TextStyle(
                      color: getStatusColor(
                        status,
                      ),

                      fontSize: 12,
                      fontWeight:
                          FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Container(
            width: 45,
            height: 45,

            decoration: const BoxDecoration(
              color: Color(0xff5F9F9F),
              shape: BoxShape.circle,
            ),

            child: const Icon(
              Icons.edit,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}