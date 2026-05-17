class BukuPrestasi {
  final int id;
  final String murid;
  final String kitab;
  final String jilidSekarang;
  final String jilidBerikutnya;
  final String? halaman;
  final String statusTerakhir;
  final String laporan;
  final String? tanggalKenaikanTerakhir;

  BukuPrestasi({
    required this.id,
    required this.murid,
    required this.kitab,
    required this.jilidSekarang,
    required this.jilidBerikutnya,
    required this.halaman,
    required this.statusTerakhir,
    required this.laporan,
    required this.tanggalKenaikanTerakhir,
  });

  factory BukuPrestasi.fromJson(Map<String, dynamic> json) {
    return BukuPrestasi(
      id: json['id'],
      murid: json['murid'] ?? '',
      kitab: json['kitab'] ?? '',
      jilidSekarang: json['jilidSekarang'] ?? '',
      jilidBerikutnya: json['jilidBerikutnya'] ?? '',
      halaman: json['halaman']?.toString(),
      statusTerakhir: json['statusTerakhir'] ?? '',
      laporan: json['laporan'] ?? '',
      tanggalKenaikanTerakhir:
          json['tanggalKenaikanTerakhir']?.toString(),
    );
  }
}