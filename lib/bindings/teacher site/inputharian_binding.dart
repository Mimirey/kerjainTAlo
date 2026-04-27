import 'package:get/get.dart';
import 'package:projectquranmu_application/controllers/teacher%20site/inputharian_controller.dart';

class InputharianBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(()=> InputHarianController());
  }

}