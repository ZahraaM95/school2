import 'package:flutter_application_9/controller/auth/login_controller.dart';
import 'package:flutter_application_9/core/function/vild.dart';
import 'package:flutter_application_9/featuers/Home/view/home.dart';
import 'package:flutter_application_9/featuers/auth/view/forgetpassword.dart';
import 'package:flutter_application_9/featuers/auth/view/widget/auth/custombuttonauth.dart';
import 'package:flutter_application_9/featuers/auth/view/widget/auth/customtextformauth.dart';
import 'package:flutter_application_9/featuers/auth/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter_application_9/featuers/auth/view/widget/auth/textsignup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imgaeasset.dart';
import 'signup_Screen.dart';
import 'widget/auth/logoauth.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
   
  @override
  
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(25), horizontal: ScreenUtil().setWidth(16)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.offAll(() => const BrowsePage());
                  },
                  child: Text(
                    "تخطي",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontSize: 16.h,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(50)),
                  child: const LogoAuth(
                    image: AppImageAsset.login,
                  ),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.all(8.0.h),
                  child: const CustomTextTitleAuth(
                    text: "تسجيل الدخول",
                  ),
                ),
                TextButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        ' قم بتسجيل الدخول للاستمرار او ',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontSize: 12.h,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() =>  const SignUpScreen());
                        },
                        child: Text(
                          'أنشئ حساب جديد ',
                          style: TextStyle(
                            color: AppColor.primaryColor,
                            fontSize: 12.h,
                          ),
                        ),
                      ),
                      const Icon(Icons.arrow_forward),
                    ],
                  ),
                  onPressed: () {
                    Get.offAll(() =>  const BrowsePage());
                  },
                ),
                SizedBox(height: 15.h),
                CustonTextFormAuth(
                   valid: (val) {
                    return validInput(val!, 11, 11, "phone");
                   },
                  mycontroller: controller.phone,
                  hinttext: 'رقم الهاتف',
                  svg: 'assets/svg/call.svg',
                  keyboardType: true,
                ),
                CustonTextFormAuth(
                   valid: (val) {
                    return validInput(val!, 5, 100, "username");
                   },
                  mycontroller: controller.password,
                  svg: 'assets/svg/lock.svg',
                  hinttext: 'كلمة المرور',
                ),
              
                Padding(
                  padding: EdgeInsets.all(8.0.h),
                  child: CustomButtomAuth(
                    text: 'تسجيل الدخول',
                    onPressed: () {
                      controller.login();

                    },
                  ),
                ),
                SizedBox(height: 10.h),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomTextSignUpOrSignIn(
                    texttwo: 'نسيت كلمة السر؟',
                    onTap: () {
                      Get.to(() => const ForgetPassword());
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
