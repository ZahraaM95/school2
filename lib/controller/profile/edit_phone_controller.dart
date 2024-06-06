// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditPhoneController extends GetxController {
  final phoneNumberController = TextEditingController();
  final verificationCodeController = TextEditingController();
  final passwordController = TextEditingController();

  var phoneNumber = ''.obs;
  var verificationCode = ''.obs;
  var password = ''.obs;

  @override
  void onInit() {
    super.onInit();
    phoneNumberController.addListener(() {
      phoneNumber.value = phoneNumberController.text;
    });
    verificationCodeController.addListener(() {
      verificationCode.value = verificationCodeController.text;
    });
    passwordController.addListener(() {
      password.value = passwordController.text;
    });
  }

  void saveDetails() {
    // أضف المنطق الخاص بحفظ التفاصيل هنا
    // يمكنك الوصول إلى القيم باستخدام phoneNumber.value و verificationCode.value و password.value
    print('Phone Number: ${phoneNumber.value}');
    print('Verification Code: ${verificationCode.value}');
    print('Password: ${password.value}');
  }

  @override
  void onClose() {
    phoneNumberController.dispose();
    verificationCodeController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
