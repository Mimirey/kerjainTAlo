import 'package:get/get.dart';
import 'package:projectquranmu_application/controllers/teacher%20site/teacherreport_controller.dart';

class TeacherReportBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(()=>TeacherReportController());
  }

}