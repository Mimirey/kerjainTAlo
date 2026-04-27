import 'package:get/get.dart';
import 'package:projectquranmu_application/configs/routes.dart';
import 'package:projectquranmu_application/models/student_model.dart';

class BukuprestasiController extends GetxController{
  var student= Rxn<Student>();
  var isLoading= false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    student.value= Get.arguments;
  }

  // void fetchDetail() async {
  //   isLoading.value = true;

  //   // TODO: hit API
  //   await Future.delayed(Duration(seconds: 1));

  //   isLoading.value = false;
  // }
  void goToInputPerkembangan() {
    Get.toNamed(AppRoutes.inputharianPage, arguments: student.value);
  }

  // void goToInputJilid() {
  //   Get.toNamed('/input-jilid', arguments: student.value);
  // }

}