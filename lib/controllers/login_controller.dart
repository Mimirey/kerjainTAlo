import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:projectquranmu_application/configs/routes.dart';
import 'package:projectquranmu_application/configs/storage_service.dart';
import 'package:projectquranmu_application/services/auth_service.dart';

class LoginController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final isLoading = false.obs;

  final AuthService authService = AuthService();

  Future<void> login() async {
    if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar("Error", "Username dan password wajib diisi");

      return;
    }
    try {
      isLoading.value = true;

      final result = await authService.login(
        username: usernameController.text,
        password: passwordController.text,
      );

      await StorageService.saveToken(result.token);
      await StorageService.saveUserId(result.data.id);
      await StorageService.saveRole(result.data.role);

      Get.snackbar("Success", "Login berhasil");
      if (result.data.role == 'WALI_MURID') {
        Get.snackbar("NOTICE", "Ini akun WALMUR");
        Get.offAllNamed(AppRoutes.ortuattachmentPage);
      } else if (result.data.role == "GURU") {
        Get.snackbar("NOTICE", "Ini akun GURU");
        Get.offAllNamed(AppRoutes.attachmentPage);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    await StorageService.removeToken();

    Get.offAllNamed(AppRoutes.loginPage);
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();

    super.onClose();
  }
}
