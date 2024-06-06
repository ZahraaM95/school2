import 'package:flutter_application_9/controller/auth/forgetpassword_controller.dart';
import 'package:flutter_application_9/core/constant/color.dart';
import 'package:flutter_application_9/core/function/vild.dart';
import 'package:flutter_application_9/featuers/Home/view/home.dart';
import 'package:flutter_application_9/featuers/auth/view/widget/auth/custombuttonauth.dart';
import 'package:flutter_application_9/featuers/auth/view/widget/auth/customtextformauth.dart';
import 'package:flutter_application_9/featuers/auth/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ForgetPasswordControllerImp controller =
        Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text(' ',
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColor.grey)),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: ListView(children: [
          const SizedBox(height: 20),
          const CustomTextTitleAuth(text: "اعادة تعيين كلمة المرور"),
          const SizedBox(height: 10),
         
          const SizedBox(height: 15),
           CustonTextFormAuth(
            valid: (val) {
              return validInput(val!, 5, 100, "username");
            },
            
            mycontroller: controller.email,
            hinttext: "كلمة المرور الجديدة",
        svg: 'assets/svg/lock.svg',           
            // mycontroller: ,
          ),
          const SizedBox(height: 15),
           CustonTextFormAuth(
                   valid: (val) {
                          return validInput(val!, 5, 100, "username");
                        },
            mycontroller: controller.email,
            hinttext:'كود التحقق',
          svg: 'assets/svg/lock.svg',           
            // mycontroller: ,
          ),
          CustomButtomAuth(text: "اعادة تعيين", onPressed: () {
             Get.to(() =>  const BrowsePage());
            controller.goToVerfiyCode() ; 
          }),
          const SizedBox(height: 40),
        ]),
      ),
    );
  }
}


 