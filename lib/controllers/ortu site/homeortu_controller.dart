import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:projectquranmu_application/configs/storage_service.dart';
import 'package:projectquranmu_application/models/student_model.dart';
import 'package:projectquranmu_application/services/parent_service.dart';

class HomeortuController extends GetxController {
  final isLoading = false.obs;
  final students = <Student>[].obs;
  final currentSliderIndex = 0.obs;
  final selectedStudent = Rxn<Student>();
  final PageController pageController = PageController(viewportFraction: 0.92);

  @override
  void onInit() {
    // TODO: implement onInit
    fetchStudents();
    super.onInit();
  }

  void selectStudent(Student student) {
    selectedStudent.value = student;
  }

  void changeSlider(int index) {
    currentSliderIndex.value = index;
  }

  Future<void> fetchStudents() async {
    try {
      isLoading.value = true;

      final waliId = await StorageService.getUserId();

      if (waliId == null) return;

      final result = await ParentService.getStudentsByWali(waliId);

      students.value = result;
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
