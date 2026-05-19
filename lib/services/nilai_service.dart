import 'package:projectquranmu_application/configs/api_client.dart';
import 'package:projectquranmu_application/models/nilai_model.dart';

class NilaiService {
  Future<List<NilaiModel>> getNilaiByMuridId(int muridId) async {
    final response = await ApiClient.dio.get('nilai/murid/$muridId');

    final List data = response.data['data'];

    return data.map((e) => NilaiModel.fromJson(e)).toList();
  }
}
