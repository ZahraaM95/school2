
import 'package:flutter/material.dart';
import 'package:flutter_application_9/controller/profile/edit_password.dart';
import 'package:flutter_application_9/featuers/auth/view/custom_text.dart';
import 'package:flutter_application_9/featuers/auth/view/widget/auth/custombuttonauth.dart';
import 'package:get/get.dart';

class EditPassword extends StatelessWidget {
  const EditPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final EditPasswordController controller = Get.put(EditPasswordController());

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
                CustomTextForm(
                  mycontroller: TextEditingController()
                    ..text = controller.phoneNumber.value,
                  hinttext: 'ادخل رقم الهاتف',
                  svg: 'assets/svg/call.svg',
                  keyboardType: true,
                  // onChanged: (value) {
                  //   controller.phoneNumber.value = value;
                  // },
                ),
                CustomTextForm(
                  mycontroller: TextEditingController()
                    ..text = controller.verificationCode.value,
                  hinttext: 'كود التحقق',
                  svg: 'assets/svg/lock.svg',
                  // onChanged: (value) {
                  //   controller.verificationCode.value = value;
                  // },
                ),
                CustomTextForm(
                  mycontroller: TextEditingController()
                    ..text = controller.password.value,
                  hinttext: 'كلمه مرور الحساب',
                  svg: 'assets/svg/lock.svg',
                  // onChanged: (value) {
                  //   controller.password.value = value;
                  // },
                ),
                CustomButtomAuth(
                  text: 'حفظ',
                  onPressed: () {
                    controller.saveDetails();
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