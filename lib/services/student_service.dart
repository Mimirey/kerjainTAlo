import 'package:projectquranmu_application/configs/api_client.dart';
import 'package:projectquranmu_application/models/bukuprestasi_model.dart';
import 'package:projectquranmu_application/models/student_model.dart';

class StudentService {

   Future<List<Student>> getStudentsByGuru(int guruId) async {
    final response = await ApiClient.dio.get('murid/guru/$guruId');

    final List data = response.data['data'];

    return data.map((e) => Student.fromJson(e)).toList();
  }

  Future<BukuPrestasi> getBukuPrestasi(int studentId) async {
  final response = await ApiClient.dio.get(
    'murid/$studentId/jilid',
  );

  final data = response.data['data'];

  return BukuPrestasi.fromJson(data);
}
}
