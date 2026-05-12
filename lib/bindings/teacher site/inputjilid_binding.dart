import 'package:get/get.dart';
import 'package:projectquranmu_application/controllers/teacher%20site/inputjilid_controller.dart';

class InputjilidBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(()=>InputjilidController());
  }
}