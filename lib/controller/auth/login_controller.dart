// import 'dart:convert';
// import 'dart:developer';

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_9/featuers/Home/view/home.dart';
// import 'package:get/get.dart';

// class LoginController extends GetxController {
//   final Dio _dio = Dio();
  
//   final TextEditingController phone = TextEditingController();
//   final TextEditingController password = TextEditingController();
//   final TextEditingController userID = TextEditingController();
//   final _errorMessage = ''.obs;
  
//   Future<void> login() async {
//     try {
//       final response = await _dio.post(
//         'http://153.92.222.153:200/auth/singIn',
//         data: jsonEncode({
//           'phone': phone.text,
//           'password': password.text,
//           'userID': userID.text,
//         }),
//         options: Options(
//           headers: {'Content-Type': 'application/json'},
//         ),
//       );

//       if (response.statusCode == 200) {
//         var data = response.data;
//         log(data);
        
//         // معالجة البيانات بنجاح
//         Get.offAll(() => const BrowsePage());
//       } else {
//         // هنا يمكنك معالجة الخطأ
//         _errorMessage.value = response.data.toString();
//       }
//     } catch (e) {
//       _errorMessage.value = e.toString();
//     }
//   }
// }


import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_9/featuers/Home/view/home.dart';
import 'package:get/get.dart';
import 'dart:convert';

class LoginController extends GetxController {
  final Dio _dio = Dio();
  
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController userID = TextEditingController();
  var _errorMessage = ''.obs;
  
  Future<void> login() async {
    try {
      final response = await _dio.post(
        'http://153.92.222.153:200/auth/singIn',
        data: jsonEncode({
          'phone': phone.text,
          'password': password.text,
          'userID': userID.text,
          
        }),
        // في صفحة تسجيل الدخول
       
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      if (response.statusCode == 200) {
        var data = response.data;
        print(data);
        // معالجة البيانات بنجاح

        Get.offAll(() => const BrowsePage());
      } else {
        // هنا يمكنك معالجة الخطأ
        _errorMessage.value = response.data.toString();
      }
    } catch (e) {
      _errorMessage.value = e.toString();
    }
  }
  
}

// class AuthService {
// late final  String _token ;
//   // محاكاة التحقق من تسجيل الدخول
//   bool isLoggedIn() {
//     // استبدل هذا بالتحقق الفعلي من تسجيل الدخول (مثل التحقق من توكن أو جلسة)

//     return false; // غيّر إلى true لمحاكاة مستخدم مسجل الدخول
//   }
// }
