import 'package:get/get.dart';

class PaymentMethodController extends GetxController {
  var selectedPaymentMethod = ''.obs; // Observable variable

  void selectPaymentMethod(String method) {
    selectedPaymentMethod.value = method; // Update the selected method
  }
}
