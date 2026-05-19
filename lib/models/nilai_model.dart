class NilaiModel {
  final int id;
  final int muridId;
  final DateTime tanggal;
  final String jilid;
  final int halaman;
  final String nilaiBacaan;
  final int tajwid;
  final int makhraj;
  final String catatan;
  final String? voiceNote;

  NilaiModel({
    required this.id,
    required this.muridId,
    required this.tanggal,
    required this.jilid,
    required this.halaman,
    required this.nilaiBacaan,
    required this.tajwid,
    required this.makhraj,
    required this.catatan,
    required this.voiceNote,
  });

  factory NilaiModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return NilaiModel(
      id: json['id'],
      muridId: json['muridId'],

      tanggal:
          DateTime.parse(json['tanggal']),

      jilid: json['jilid'],

      halaman: json['halaman'],

      nilaiBacaan:
          json['nilaiBacaan'],

      tajwid: json['tajwid'],

      makhraj: json['makhraj'],

      catatan: json['catatan'] ?? "",

      voiceNote: json['voiceNote'],
    );
  }
}