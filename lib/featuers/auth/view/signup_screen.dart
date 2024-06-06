import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_application_9/core/constant/imgaeasset.dart';
import 'package:flutter_application_9/core/function/vild.dart';
import 'package:flutter_application_9/featuers/Home/view/home.dart';
import 'package:flutter_application_9/featuers/auth/view/login_screen.dart';
import 'package:flutter_application_9/featuers/auth/view/widget/auth/custombuttonauth.dart';
import 'package:flutter_application_9/featuers/auth/view/widget/auth/customtextformauth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

import 'widget/auth/customtexttitleauth.dart';
import 'widget/auth/logoauth.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  
  String _errorMessage = '';

  Future<void> signUp() async {
    final user = User(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      phone: phoneController.text,
      password: passwordController.text,
    );

    try {
      final response = await Dio().post(
        'http://153.92.222.153:200/auth/singUp',
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
        data: jsonEncode(user.toJson()),
      );

      if (response.statusCode == 200) {
        var data = response.data;
        log(data.toString());
        // هنا يمكنك معالجة الاستجابة بنجاح
        Get.offAll(() => const BrowsePage());
      } else {
        // هنا يمكنك معالجة الخطأ
        _errorMessage = response.data.toString();
        showErrorDialog(_errorMessage);
      }
    } on DioException catch (e) {
      if (e.response != null) {
        // معالجة حالة الخطأ بناءً على رمز الحالة
        switch (e.response!.statusCode) {
          case 409:
            _errorMessage = 'Conflict: The request could not be completed due to a conflict with the current state of the resource.';
            break;
          default:
            _errorMessage = 'Error: ${e.response!.statusCode} - ${e.response!.data}';
        }
      } else {
        // معالجة الأخطاء الأخرى
        _errorMessage = 'An error occurred: ${e.message}';
      }
      showErrorDialog(_errorMessage);
    } catch (e) {
      _errorMessage = 'An unexpected error occurred: ${e.toString()}';
      showErrorDialog(_errorMessage);
    }
  }

  void showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('خطأ'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('حسناً'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(15), horizontal: ScreenUtil().setWidth(30)),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const LogoAuth(image: AppImageAsset.signup),
                const SizedBox(height: 20),
                const CustomTextTitleAuth(text: 'إنشاء حساب'),
                const SizedBox(height: 10),
                TextButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'انشئ حساب لتتمكن من ',
                        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 14),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => const LoginScreen());
                        },
                        child: const Text(
                          ' تسجيل الدخول ',
                          style: TextStyle(decoration: TextDecoration.underline),
                        ),
                      ),
                      const Icon(Icons.arrow_forward),
                    ],
                  ),
                  onPressed: () {
                    Get.to(() => const LoginScreen());
                  },
                ),
                const SizedBox(height: 15),
                NamePerson(
                  firstNameController: firstNameController,
                  lastNameController: lastNameController,
                ),
                const SizedBox(height: 15),
                CustonTextFormAuth(
                   valid: (val) {
                  return validInput(val!, 11, 11, "phone");
                        },
                  mycontroller: phoneController,
                  hinttext: 'رقم الهاتف',
                  svg: 'assets/svg/call.svg',
                  keyboardType: true,
                ),
                 
                if (_errorMessage.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      _errorMessage,
                      style: const TextStyle(color: Colors.red),
                    ),  
                  ),
                 
                ],
                CustonTextFormAuth(
                   valid: (val) {
                     return validInput(val!, 5, 100, "username");
                   },
                  mycontroller: passwordController,
                  hinttext: 'كلمة المرور',
                  svg: 'assets/svg/lock.svg',
                ),
                const SizedBox(height: 10),

            
                  CustomButtomAuth(
                    text: 'إنشاء حساب',
                    onPressed: () {
                      signUp();
                    },
                  ),
                

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NamePerson extends StatelessWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;

  const NamePerson({
    Key? key,
    required this.firstNameController,
    required this.lastNameController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustonTextFormAuth(
             valid: (val) {
                return validInput(val!, 2, 100, "username");
                },
            mycontroller: firstNameController,
            hinttext: 'الاسم الاول',
            svg: 'assets/svg/user.svg',
          ),
        ),
        const SizedBox(width: 25),
        Expanded(
          child: CustonTextFormAuth(
                   valid: (val) {
                          return validInput(val!, 2, 100, "username");
                        },
            mycontroller: lastNameController,
            hinttext: 'الاسم الثاني',
            svg: 'assets/svg/user.svg',
          ),
        ),
      ],
    );
  }
}

class User {
  final String firstName;
  final String lastName;
  final String phone;
  final String password;

  User({
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'fname': firstName,
      'lname': lastName,
      'phone': phone,
      'password': password,
    };
  }
}
