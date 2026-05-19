import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectquranmu_application/models/student_model.dart';

class StudentSelectorModal extends StatelessWidget {
  final List<Student> students;
  final Function(Student) onSelected;

  const StudentSelectorModal({
    super.key,
    required this.students,
    required this.onSelected,
  });

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

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Pilih Ananda",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 24),

          ...students.map(
            (student) => Padding(
              padding: const EdgeInsets.only(
                bottom: 14,
              ),

              child: InkWell(
                borderRadius: BorderRadius.circular(
                  20,
                ),

                onTap: () {
                  onSelected(student);
                },

                child: Container(
                  padding: const EdgeInsets.all(18),

                  decoration: BoxDecoration(
                    color: const Color(
                      0xFFEAF3F2,
                    ),

                    borderRadius:
                        BorderRadius.circular(20),
                  ),

                  child: Row(
                    children: [
                      Container(
                        padding:
                            const EdgeInsets.all(10),

                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(
                                100,
                              ),
                        ),

                        child: const Icon(
                          Icons.person,
                          color: Color(0xFF5BA7A4),
                        ),
                      ),

                      const SizedBox(width: 16),

                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment
                                  .start,

                          children: [
                            Text(
                              student.nama,

                              style: const TextStyle(
                                fontWeight:
                                    FontWeight.bold,
                                fontSize: 20,
                                color: Color(
                                  0xFF5BA7A4,
                                ),
                              ),
                            ),

                            Text(
                              student
                                      .jilidSekarang ??
                                  "Belum Ada Jilid",
                            ),
                          ],
                        ),
                      ),

                      const Icon(
                        Icons.chevron_right,
                        color: Color(0xFF5BA7A4),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          Text(
            "Pilih salah satu untuk melihat laporan perkembangan",

            textAlign: TextAlign.center,

            style: TextStyle(
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}