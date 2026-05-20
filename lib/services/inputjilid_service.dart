import 'package:dio/dio.dart';
import 'package:projectquranmu_application/configs/api_client.dart';

class InputJilidService {
  final Dio dio = Dio();

  Future<void> submitKenaikanJilid({
    required int id,
    required String jilid,
    required String tajwid,
    required String makhraj,
    required String statusKelulusan,
    required String catatan,
    String? audioPath,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        "muridId": id,
        "jilid": jilid,
        "tajwid": tajwid,
        "makhraj": makhraj,
        "statusKelulusan": statusKelulusan,
        "catatan": catatan,

        if (audioPath != null)
          "audio": await MultipartFile.fromFile(
            audioPath,
            filename: audioPath.split('/').last,
          ),
      });

      final response = await ApiClient.dio.post(
        "kenaikan-jilid",
        data: formData,
      );

      print(response.data);
    } on DioException catch (e) {
      print("STATUS: ${e.response?.statusCode}");
      print("DATA: ${e.response?.data}");

      throw Exception(e.response?.data.toString());
    }
  }

  Future<void> naikJilid(int muridId) async {
    try {
      await ApiClient.dio.patch("murid/$muridId/naik-jilid");
    } on DioException catch (e) {
      print(e.response?.data);
      throw Exception(e.response?.data.toString());
    }
  }

  Future<Map<String, dynamic>> getJilidInfo(int studentId) async {
    try {
      final response = await ApiClient.dio.get("murid/$studentId/jilid");

      return response.data["data"];
    } on DioException catch (e) {
      throw Exception(e.response?.data.toString());
    }
  }
}
