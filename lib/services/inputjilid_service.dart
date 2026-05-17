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
    try{
    FormData formData = FormData.fromMap({
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

    await ApiClient.dio.patch(
      "kenaikan-jilid/$id",
      data: formData,
    );}
    on DioException catch (e) {
      final response = e.response;

      print("STATUS: ${e.response?.statusCode}");
      print("DATA: ${e.response?.data}");
      print("HEADERS: ${e.requestOptions.headers}");
      print("PATH: ${e.requestOptions.path}");

      // ambil pesan backend
      if (response?.data != null) {
        throw Exception(response?.data.toString());
      }

      throw Exception(e.message ?? "Terjadi kesalahan");
    }
  }
  }
