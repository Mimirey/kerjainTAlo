import 'package:projectquranmu_application/configs/api_client.dart';
import 'package:projectquranmu_application/models/login_response_model.dart';

class AuthService {
  Future<LoginResponseModel> login({
    required String username,
    required String password
  })async{
    final response = await ApiClient.dio.post(
      'auth/login',
      data: {
        "username": username,
        "password": password
      }
    );
    return LoginResponseModel.fromJson(response.data);
  }
}