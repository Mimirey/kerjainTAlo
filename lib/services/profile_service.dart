import 'package:dio/dio.dart';
import 'package:projectquranmu_application/configs/api_client.dart';
import 'package:projectquranmu_application/models/profile_model.dart';

class ProfileService {
  Future<ProfileModel> getProfile() async {
    try {
      final response = await ApiClient.dio.get("profile");

      return ProfileModel.fromJson(response.data['data']);
    } on DioException catch (e) {
      throw Exception(e.response?.data.toString());
    }
  }
}
