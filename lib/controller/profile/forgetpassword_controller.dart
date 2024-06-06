import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/constant/routes.dart';

abstract class ForgetPasswordController extends GetxController {
  checkephone();
  goToVerfiyCode();
}

class ForgetPasswordControllerImp extends ForgetPasswordController { 
  late TextEditingController phone; 

  @override
  checkephone() {}

  @override
  goToVerfiyCode() {
    Get.offNamed(AppRoute.verfiyCode);
  }

  @override
  void onInit() { 
    phone = TextEditingController(); 
    super.onInit();
  }

  @override
  void dispose() { 
    phone.dispose(); 
    super.dispose();
  }
}