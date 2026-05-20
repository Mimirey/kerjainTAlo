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
  var selectedStatusLaporan = RxnString();
  var selectedKelancaran = RxnString();

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

    applyFilter(
      statusLaporan: selectedStatusLaporan.value,

      statusKelancaran: selectedKelancaran.value,
    );
  }

  void applyFilter({String? statusLaporan, String? statusKelancaran}) {
    selectedStatusLaporan.value = statusLaporan;

    selectedKelancaran.value = statusKelancaran;

    List<Student> result = List.from(allStudents);

    if (statusLaporan != null && statusLaporan != "SEMUA") {
      result = result.where((student) {
        final hasReport = student.kenaikanJilid.isNotEmpty;

        if (statusLaporan == "SUDAH") {
          return hasReport;
        }

        if (statusLaporan == "BELUM") {
          return !hasReport;
        }

        return true;
      }).toList();
    }

    if (statusKelancaran != null) {
      result = result.where((student) {
        if (student.kenaikanJilid.isEmpty) {
          return false;
        }

        final latest = student.kenaikanJilid.last;

        return latest.tajwid == statusKelancaran ||
            latest.makhraj == statusKelancaran;
      }).toList();
    }
    if (query.value.isNotEmpty) {
      result = result.where((student) {
        return student.nama.toLowerCase().contains(query.value.toLowerCase());
      }).toList();
    }

    filteredStudents.value = result;
  }
}
