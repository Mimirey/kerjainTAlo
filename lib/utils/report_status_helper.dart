import 'package:flutter/material.dart';

enum ReportStatus {
  lancar,
  cukupLancar,
  kurangLancar,
}

class ReportStatusHelper {
  static ReportStatus fromString(String value) {
    switch (value) {
      case "LANCAR":
        return ReportStatus.lancar;

      case "CUKUP_LANCAR":
        return ReportStatus.cukupLancar;

      case "KURANG_LANCAR":
        return ReportStatus.kurangLancar;

      default:
        return ReportStatus.kurangLancar;
    }
  }

  static Color primaryColor(ReportStatus status) {
    switch (status) {
      case ReportStatus.lancar:
        return Colors.green;

      case ReportStatus.cukupLancar:
        return Colors.amber;

      case ReportStatus.kurangLancar:
        return Colors.red;
    }
  }

  static String label(ReportStatus status) {
    switch (status) {
      case ReportStatus.lancar:
        return "Lancar";

      case ReportStatus.cukupLancar:
        return "Cukup\nLancar";

      case ReportStatus.kurangLancar:
        return "Kurang\nLancar";
    }
  }
}