import 'package:projectquranmu_application/configs/api_client.dart';
import 'package:dio/dio.dart';

class InputharianService {
  Future<void> createNilai({
    required int muridId,
    required String jilid,
    required int halaman,
    required String nilaiBacaan,
    required int tajwid,
    required int makhraj,
    String? catatan,
    String? audioPath,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        'muridId': muridId,
        'jilid': jilid,
        'halaman': halaman,
        'nilaiBacaan': nilaiBacaan,
        'tajwid': tajwid,
        'makhraj': makhraj,
        'catatan': catatan,

        if (audioPath != null)
          'audio': await MultipartFile.fromFile(
            audioPath,
            filename: 'audio.m4a',
          ),
      });

      await ApiClient.dio.post('/nilai', data: formData);
    } on DioException catch (e) {
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
