import 'package:projectquranmu_application/models/kenaikanjilid_model.dart';

class Student {
  final int id;
  final String nama;
  final int guruId;
  final String? jilidSekarang;
  final String jenisKelamin;
  final String guruName;

  final List<KenaikanJilidModel> kenaikanJilid;

  Student({
    required this.id,
    required this.nama,
    required this.guruId,
    required this.jilidSekarang,
    required this.jenisKelamin,
    required this.guruName,
    required this.kenaikanJilid,
  });

  factory Student.fromJson(
    Map<String, dynamic> json,
  ) {
    return Student(
      id: json['id'],
      nama: json['nama'],
      guruId: json['guruId'],
      jilidSekarang: json['jilidSekarang'],
      jenisKelamin: json['jenisKelamin'],

      guruName: json['guru']?['nama'] ?? '-',
      kenaikanJilid: (json['kenaikanJilid'] as List<dynamic>?)
        ?.map((e) => KenaikanJilidModel.fromJson(e))
        .toList() ??
    [],
    );
  }
}