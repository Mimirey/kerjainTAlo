import 'package:get/get.dart';

class NavigationController extends GetxController {
  var currentIndex = 0.obs;

  void changeIndex(int index) {
    print("CLICKED INDEX: $index");
    currentIndex.value = index;
  }
}