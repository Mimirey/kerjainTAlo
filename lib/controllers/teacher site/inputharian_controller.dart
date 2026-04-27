import 'package:get/get.dart';

class InputHarianController extends GetxController {
  // state
  var status = ''.obs;
  var tajwid = 0.obs;
  var makhraj = 0.obs;

  // setter
  void setStatus(String value) {
    status.value = value;
  }

  void setTajwid(int value) {
    tajwid.value = value;
  }

  void setMakhraj(int value) {
    makhraj.value = value;
  }

  // reset (optional)
  void resetForm() {
    status.value = '';
    tajwid.value = 0;
    makhraj.value = 0;
  }

  // validasi (biar ga kosong pas submit)
  bool isValid() {
    return status.value.isNotEmpty &&
           tajwid.value > 0 &&
           makhraj.value > 0;
  }

  // submit (dummy dulu)
  void submit() {
    if (!isValid()) {
      Get.snackbar("Error", "Semua field harus diisi");
      return;
    }

    final data = {
      "status": status.value,
      "tajwid": tajwid.value,
      "makhraj": makhraj.value,
    };

    print("DATA DIKIRIM: $data");

    // nanti ganti ini ke API
    // await ApiService.submitHarian(data);
  }
}