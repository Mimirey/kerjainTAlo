import 'package:get/get.dart';
import 'package:projectquranmu_application/controllers/ortu site/homeortu_controller.dart';
import 'package:projectquranmu_application/models/kenaikanjilid_model.dart';
import 'package:projectquranmu_application/models/nilai_model.dart';
import 'package:projectquranmu_application/models/student_model.dart';
import 'package:projectquranmu_application/services/nilai_service.dart';

class ReportortuController extends GetxController {
  final homeController = Get.find<HomeortuController>();
  final selectedMonth = DateTime.now().month.obs;
  Rxn<Student> get selectedStudent => homeController.selectedStudent;
  final reports = <NilaiModel>[].obs;
  final isLoading = false.obs;
  final nilaiService = NilaiService();

  @override
  void onInit() {
    super.onInit();

    ever(selectedStudent, (_) {
      fetchReports();
    });
  }

  void changeMonth(int month) {
    selectedMonth.value = month;
  }

  Future<void> fetchReports() async {
    try {
      isLoading.value = true;
      reports.clear();
      final student = selectedStudent.value;

      if (student == null) {
        return;
      }

      final result = await nilaiService.getNilaiByMuridId(student.id);

      reports.assignAll(result);
    } catch (e) {
      print("ERROR FETCH: $e");
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  List<NilaiModel> get filteredReports {
    return reports.where((report) {
      return report.tanggal.month == selectedMonth.value;
    }).toList();
  }
}
