import 'package:get/get.dart';
import 'package:projectquranmu_application/configs/routes.dart';
import 'package:projectquranmu_application/configs/storage_service.dart';

class ProfileController extends GetxController {
  Future<void> logout() async {
    await StorageService.removeToken();

    Get.offAllNamed(AppRoutes.loginPage);
  }
}