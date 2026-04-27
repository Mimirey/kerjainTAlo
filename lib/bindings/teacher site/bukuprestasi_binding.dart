import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:projectquranmu_application/controllers/teacher%20site/bukuprestasi_controller.dart';

class BukuprestasiBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(()=> BukuprestasiController());
  }

}