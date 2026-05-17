import 'package:get/get.dart';
import 'package:projectquranmu_application/controllers/ortu%20site/homeortu_controller.dart';

class HomeortuBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(()=>HomeortuController());
  }
  
}