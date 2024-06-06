import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "not valid username";
    }
  }



  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "هذا ليس رقما ,يجب ان يحتوى علي 11 رقم";
    }
  }

  if (val.isEmpty) {
    return "هذا الحقل لايجب ان يكون فارغ";
  }

  if (val.length < min) {
    return "لايجب ان يكون اقل من  $min";
  }

  if (val.length > max) {
    return "لا يجب ان يكون اكبر من  $max";
  }
}