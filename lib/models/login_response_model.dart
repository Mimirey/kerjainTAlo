class LoginResponseModel {
  final String message;
  final String token;
  final UserData data;
  LoginResponseModel({required this.message, required this.token, required this.data});

  factory LoginResponseModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return LoginResponseModel(
      message: json['message'],
      token: json['token'],
      data: UserData.fromJson(
        json['data'],
      ),
    );
  }
}

class UserData {
  final int id;
  final String nama;
  final String role;

  UserData({required this.id, required this.nama, required this.role});
  factory UserData.fromJson(
    Map<String, dynamic> json,
  ) {
    return UserData(
      id: json['id'],
      nama: json['nama'],
      role: json['role'],
    );
  }
}