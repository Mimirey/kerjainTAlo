import 'package:get/get.dart';
import 'package:projectquranmu_application/configs/storage_service.dart';
import 'package:projectquranmu_application/models/student_model.dart';
import 'package:projectquranmu_application/services/student_service.dart';

class TeacherReportController extends GetxController {
  final StudentService service = StudentService();
  var allStudents = <Student>[].obs;
  var filteredStudents = <Student>[].obs;
  final isLoading = false.obs;
  var query = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getStudents();
  }

  Future<void> getStudents() async {
    try {
      isLoading.value = true;

      final guruId = await StorageService.getUserId();
      if (guruId == null) {
        Get.snackbar("Error", "Guru ID tidak ditemukan");
        return;
      }

      final result = await service.getStudentsByGuru(guruId);

      allStudents.value = result;
      filteredStudents.value = result;
    } catch (e) {
      Get.snackbar("Error", e.toString());
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  void search(String value) {
    query.value = value;

    final q = value.toLowerCase();

    if (q.isEmpty) {
      filteredStudents.value = allStudents;
    } else {
      filteredStudents.value = allStudents.where((student) {
        return student.nama.toLowerCase().contains(q);
            // student.jilidSekarang.toLowerCase.contains(q);
      }).toList();
    }
  }
}
