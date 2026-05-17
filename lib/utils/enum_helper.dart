extension JilidExtension on String {
  String get jilidLabel {
    switch (this) {
      case "JILID_1":
        return "Jilid 1";

      case "JILID_2":
        return "Jilid 2";

      case "JILID_3":
        return "Jilid 3";

      case "JILID_4":
        return "Jilid 4";

      default:
        return this;
    }
  }
}

extension StatusExtension on String {
  String get statusLabel {
    switch (this) {
      case "KURANG_LANCAR":
        return "Kurang Lancar";

      case "CUKUP_LANCAR":
        return "Cukup Lancar";

      case "LANCAR":
        return "Lancar";

      default:
        return this;
    }
  }
}

extension KelulusanExtension on String {
  String get kelulusanLabel {
    switch (this) {
      case "LULUS":
        return "Lulus";

      case "MENGULANG":
        return "Mengulang";

      default:
        return this;
    }
  }
}