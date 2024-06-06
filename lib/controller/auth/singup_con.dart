//  import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter_application_9/featuers/auth/view/login_screen.dart';
// import 'package:flutter_application_9/featuers/auth/view/signup_screen.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// // 
// final TextEditingController firstNameController = TextEditingController();
//   final TextEditingController lastNameController = TextEditingController();
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
  
//   String _errorMessage = '';

//   Future<void> signUp() async {
//     final user = User(
//       firstName: firstNameController.text,
//       lastName: lastNameController.text,
//       phone: phoneController.text,
//       password: passwordController.text,
//     );

//     try {
//       final response = await http.post(
//         Uri.parse('http://153.92.222.153:200/auth/singUp'),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode(user.toJson()),
//       );

//       if (response.statusCode == 200) {
//         var data = jsonDecode(utf8.decode(response.body.toString().codeUnits));
//         print(data);
//         // هنا يمكنك معالجة الاستجابة بنجاح
//         Get.to(() => const LoginScreen());
//       } else{
//         ScaffoldMessenger(child: 
//         const Text("Phone Number Or Email Already Exists")
//         );
//           Get.defaultDialog(title: "ُWarning" , middleText: "Phone Number Or Email Already Exists") ; 
//           // statusRequest = StatusRequest.failure;
//         }
         
//     } catch (e) {
//       _errorMessage = (e.toString());
//     }
//   }