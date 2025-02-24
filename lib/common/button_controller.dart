import 'package:get/get.dart';

class SelectButtonController extends GetxController {
  var isselected = false.obs;

  void toggleSelection() {
    isselected.value = !isselected.value;
  }
}
