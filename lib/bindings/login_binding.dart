import 'package:get/get.dart';
import 'package:projectquranmu_application/controllers/login_controller.dart';

class LoginBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(()=> LoginController());
  }

}