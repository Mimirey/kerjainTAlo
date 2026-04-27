import 'package:get/get.dart';
import 'package:projectquranmu_application/dummy%20data/dummyStudents.dart';
import 'package:projectquranmu_application/models/student_model.dart';

class TeacherReportController extends GetxController {
  var allStudents=<Student>[].obs;
  var filteredStudents= <Student>[].obs;

  var query= ''.obs;

  @override
  void onInit() {
    super.onInit();
    allStudents.value = dummyStudents;
    filteredStudents.value = dummyStudents;
  }

  void search(String value) {
    query.value = value;
    final q = value.toLowerCase();

    if (q.isEmpty) {
      filteredStudents.value = allStudents;
    } else {
      filteredStudents.value = allStudents.where((student) {
        return student.name.toLowerCase().contains(q) ||
              student.kitab.toLowerCase().contains(q);
      }).toList();
    }
  }
}