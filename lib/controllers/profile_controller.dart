import 'package:get/get.dart';
import 'package:projectquranmu_application/configs/routes.dart';
import 'package:projectquranmu_application/configs/storage_service.dart';
import 'package:projectquranmu_application/models/profile_model.dart';
import 'package:projectquranmu_application/services/profile_service.dart';

class ProfileController extends GetxController {
  final ProfileService profileService = ProfileService();
  final profile = Rxn<ProfileModel>();
  final isLoading = false.obs;

  Future<void> fetchProfile() async {
    try {
      isLoading.value = true;

      final result = await profileService.getProfile();
      print(result.user.role);
      print(result.murid.length);
      profile.value = result;
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();

    fetchProfile();
  }

  Future<void> logout() async {
    await StorageService.removeToken();

    Get.offAllNamed(AppRoutes.loginPage);
  }
}
