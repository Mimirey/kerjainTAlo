class InputNilaiRequest {
  final int muridId;
  final int jilid;
  final int halaman;
  final String nilaiBacaan;
  final int tajwid;
  final int makhraj;
  final String? catatan;
  final String? audioPath;

  InputNilaiRequest({
    required this.muridId,
    required this.jilid,
    required this.halaman,
    required this.nilaiBacaan,
    required this.tajwid,
    required this.makhraj,
    this.catatan,
    this.audioPath,
  });
}