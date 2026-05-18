import 'package:get/get.dart';
import 'package:projectquranmu_application/dummy%20data/dummyreports.dart';

class ReportortuController extends GetxController {
  final isLoading = false.obs;
  final selectedMonth = "JAN".obs;

  void changeMonth(String month) {
    selectedMonth.value = month;
  }

  List<Map<String, dynamic>> get filteredReports {
    return allReports.where((report) {
      return report["month"] == selectedMonth.value;
    }).toList();
  }
}
