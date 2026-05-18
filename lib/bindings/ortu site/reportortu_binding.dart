import 'package:get/instance_manager.dart';
import 'package:projectquranmu_application/controllers/ortu%20site/reportortu_controller.dart';

class ReportortuBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(()=>ReportortuController());
  }

}