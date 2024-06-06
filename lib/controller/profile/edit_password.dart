// ignore_for_file: avoid_print

import 'package:get/get.dart';

class EditPasswordController extends GetxController {
  var phoneNumber = ''.obs;
  var verificationCode = ''.obs;
  var password = ''.obs;

  void saveDetails() {
    // Add your logic for saving the details here
    // You can access the values using phoneNumber.value, verificationCode.value, password.value
    print('Phone Number: ${phoneNumber.value}');
    print('Verification Code: ${verificationCode.value}');
    print('Password: ${password.value}');
  }
}
