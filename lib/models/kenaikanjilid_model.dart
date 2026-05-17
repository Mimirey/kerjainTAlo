import 'package:projectquranmu_application/models/student_model.dart';

class KenaikanJilidModel {
  final int id;
  final int muridId;
  final DateTime tanggal;
  final String jilid;
  final String tajwid;
  final String makhraj;
  final String statusKelulusan;
  final String catatan;
  final String? voiceNote;
  final DateTime createdAt;

  final Student? murid;

  KenaikanJilidModel({
    required this.id,
    required this.muridId,
    required this.tanggal,
    required this.jilid,
    required this.tajwid,
    required this.makhraj,
    required this.statusKelulusan,
    required this.catatan,
    required this.voiceNote,
    required this.createdAt,
    this.murid,
  });

  factory KenaikanJilidModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return KenaikanJilidModel(
      id: json["id"],
      muridId: json["muridId"],

      tanggal: DateTime.parse(json["tanggal"]),

      jilid: json["jilid"],

      tajwid: json["tajwid"],

      makhraj: json["makhraj"],

      statusKelulusan: json["statusKelulusan"],

      catatan: json["catatan"] ?? "",

      voiceNote: json["voiceNote"],

      createdAt: DateTime.parse(json["createdAt"]),

      murid: json["murid"] != null
          ? Student.fromJson(json["murid"])
          : null,
    );
  }

  String? get voiceNoteUrl {
    if (voiceNote == null) return null;

    final cleanPath = voiceNote!.replaceAll(r'\', '/');

    return "http://YOUR_IP:3000/$cleanPath";
  }
}