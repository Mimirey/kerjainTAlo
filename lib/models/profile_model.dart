import 'package:projectquranmu_application/models/student_model.dart';
import 'package:projectquranmu_application/models/user_model.dart';

class ProfileModel {
  final int id;
  final String nama;
  final UserModel user;
  final List<Student> murid;

  final String? noHp;
  final String? alamat;

  final int? umur;
  final String? peran;

  ProfileModel({
    required this.id,
    required this.nama,
    required this.user,
    required this.murid,
    this.noHp,
    this.alamat,
    this.umur,
    this.peran,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'],
      nama: json['nama'],

      noHp: json['no_hp'],
      alamat: json['alamat'],

      umur: json['umur'],
      peran: json['peran'],

      user: UserModel.fromJson(json['user']),

      murid: (json['murid'] as List)
          .map((e) => Student.fromJson(e))
          .toList(),
    );
  }
}