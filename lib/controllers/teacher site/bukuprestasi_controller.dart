import 'package:get/get.dart';
import 'package:projectquranmu_application/configs/routes.dart';
import 'package:projectquranmu_application/models/bukuprestasi_model.dart';
import 'package:projectquranmu_application/models/student_model.dart';
import 'package:projectquranmu_application/services/student_service.dart';


class BukuprestasiController extends GetxController{
  final StudentService studentService = StudentService();

  final bukuPrestasi = Rxn<BukuPrestasi>();

  late int studentId;

  @override
  void onInit() {
    super.onInit();

    studentId = Get.arguments as int;

    fetchBukuPrestasi();
  }

  Future<void> fetchBukuPrestasi() async {
    try {
      final result =
          await studentService.getBukuPrestasi(studentId);

      bukuPrestasi.value = result;
    } catch (e) {
      print(e);
    }
  }

  void goToInputPerkembangan() {
    Get.toNamed(AppRoutes.inputharianPage, arguments: bukuPrestasi.value);
  }
    void goToInputJilid() {
    Get.toNamed(AppRoutes.inputjilidPage, arguments: bukuPrestasi.value);
  }
  

}