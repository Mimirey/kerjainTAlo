class Student {
  final String id;
  final String name;
  final String kitab;
  final String laporan;
  final String status;
  final String date;
  final String jilid;     // 1
  final String halaman; 

  Student({
    required this.id,
    required this.name,
    required this.kitab,
    required this.laporan,
    required this.status,
    required this.date,
    required this.jilid,
    required this.halaman,
  });

  String get fullKitab => "$kitab $jilid hal $halaman";
  String get shortKitab => "$kitab $jilid";
}