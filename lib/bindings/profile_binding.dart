import 'package:get/get.dart';
import 'package:projectquranmu_application/controllers/profile_controller.dart';

class ProfileBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(()=>ProfileController());
  }

}