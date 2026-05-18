import 'package:get/get.dart';
import 'package:projectquranmu_application/controllers/login_controller.dart';
import 'package:projectquranmu_application/controllers/ortu%20site/reportortu_controller.dart';
import 'package:projectquranmu_application/controllers/teacher%20site/teacherreport_controller.dart';

class AppBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(()=>TeacherReportController());
    Get.lazyPut(()=>ReportortuController());
  }
}