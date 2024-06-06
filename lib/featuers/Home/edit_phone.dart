import 'package:flutter/material.dart';
import 'package:flutter_application_9/controller/profile/edit_phone_controller.dart';
import 'package:flutter_application_9/core/function/vild.dart';
import 'package:flutter_application_9/featuers/auth/view/custom_text.dart';
import 'package:flutter_application_9/featuers/auth/view/widget/auth/custombuttonauth.dart';
import 'package:flutter_application_9/featuers/auth/view/widget/auth/customtextformauth.dart';
import 'package:get/get.dart';

class EditPhone extends StatelessWidget {
  const EditPhone({super.key});

  @override
  Widget build(BuildContext context) {
    final EditPhoneController controller = Get.put(EditPhoneController());

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: ListView(
              children: [
                const SizedBox(height: 40),
                CustonTextFormAuth(
                   valid: (val) {
                          return validInput(val!, 5, 100, "phone");
                        },
                  mycontroller: controller.phoneNumberController,
                  hinttext: 'ادخل رقم الهاتف',
                  svg: 'assets/svg/call.svg',
                  keyboardType: true,
                ),
                CustomTextForm(
                  
                  mycontroller: controller.verificationCodeController,
                  hinttext: 'كود التحقق',
                  svg: 'assets/svg/lock.svg',
                ),
                CustomTextForm(
                  mycontroller: controller.passwordController,
                  hinttext: 'كلمه مرور الحساب',
                  svg: 'assets/svg/lock.svg',
                ),
                CustomButtomAuth(
                  text: 'حفظ',
                  onPressed: () {
                    controller.saveDetails();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
