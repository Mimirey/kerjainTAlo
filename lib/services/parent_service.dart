import 'package:projectquranmu_application/configs/api_client.dart';
import 'package:projectquranmu_application/models/student_model.dart';

class ParentService {
  static Future<List<Student>> getStudentsByWali(
    int waliId,
  ) async {
    final response = await ApiClient.dio.get(
      '/murid/wali/$waliId',
    );

    final List data = response.data["data"];

    return data
        .map((e) => Student.fromJson(e))
        .toList();
  }
}