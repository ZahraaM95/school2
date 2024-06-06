// import 'package:flutter_application_9/controller/auth/checkemail_controller.dart';
// import 'package:flutter_application_9/core/constant/color.dart';
// import 'package:flutter_application_9/featuers/auth/view/widget/auth/custombuttonauth.dart';
// import 'package:flutter_application_9/featuers/auth/view/widget/auth/customtextbodyauth.dart';
// import 'package:flutter_application_9/featuers/auth/view/widget/auth/customtextformauth.dart';
// import 'package:flutter_application_9/featuers/auth/view/widget/auth/customtexttitleauth.dart'; 
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class CheckEmail extends StatelessWidget {
//   const CheckEmail({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     CheckEmailControllerImp controller =
//         Get.put(CheckEmailControllerImp());
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: AppColor.backgroundcolor,
//         elevation: 0.0,
//         title: Text('27'.tr,
//             style: Theme.of(context)
//                 .textTheme
//                 .displayLarge!
//                 .copyWith(color: AppColor.grey)),
//       ),
//       body: Container(
//         padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
//         child: ListView(children: [
//           const SizedBox(height: 20),
//             CustomTextTitleAuth(text: "28".tr),
//           const SizedBox(height: 10),
//             CustomTextBodyAuth(
//               text:
//                   "29".tr),
//           const SizedBox(height: 15),
//           CustonTextFormAuth(
            
//             hinttext: "12".tr,
//             svg: 'assets/svg/location.svg',
            
//             mycontroller:   controller.email,
//           ),
//           CustomButtomAuth(text: "30".tr, onPressed: () {
//           }),
//           const SizedBox(height: 40),
//         ]),
//       ),
//     );
//   }
// }


 