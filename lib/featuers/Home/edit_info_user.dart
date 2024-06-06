
// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_application_9/core/function/alert.dart';
import 'package:flutter_application_9/featuers/Home/edit_phone.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg_flutter.dart';

import 'editname.dart';

class EditInFoUser extends StatelessWidget {
  
  const EditInFoUser({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Center(child: 
        Column(
          children: [
            const SizedBox( height: 60),
            CustomTextFormPrfile(
              // mycontroller: controller.name,
              ontap:(){ 
                Get.to(() => const EditName());
                },
            hinttext: 'الاسم الاول ', 
            svg: "assets/svg/user.svg",
            prefixIconsvg:'assets/svg/edit-2.svg',
            ),
              SizedBox(height: 15.h),
               CustomTextFormPrfile(
              ontap:(){
                Get.to(() => const EditPhone());
                  },

                // mycontroller: controller.phone,
                hinttext: 'رقم الهاتف',
                svg: 'assets/svg/call.svg',  
                prefixIconsvg:'assets/svg/edit-2.svg',
         
                 keyboardType:true,

                // mycontroller: ,
              ),
               CustomTextFormPrfile(
              ontap:(){ 
                // Get.to(() =>  EditPasswoed( ));
                 },

                // mycontroller: controller.password,
                svg: 'assets/svg/lock.svg',    
                  prefixIconsvg:'assets/svg/edit-2.svg',
                hinttext: 'كلمة المرور',

                // mycontroller: ,
              ),
              TextButton(onPressed: (){
                Get.defaultDialog(
                  title: "  ",
                  content:const AlertApp(
                    image: 'assets/image/bubble-gum-head-with-a-sad-face 1.png',
                  ),
                  
                );
                // Get.dialog(
                //   Center(
                //     child: Container(
                //       decoration: const BoxDecoration(
                //         borderRadius: BorderRadius.all(
                //           Radius.circular(18)
                //         ),
                //         color:Colors.white,
                                  
                                  
                //       ),
                //       width: 300.h,
                //       height: 320.h,
                //       child:column(),
                //     ),
                //   ),
                
                // );
              }, child: const Text('حذف الحساب',
              style: TextStyle(
                color: Colors.red,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
              ))
          ],
        )
        )),
      
    );
  }
}

class CustomTextFormPrfile extends StatelessWidget {
  final String hinttext;
  late bool? keyboardType;
  final String svg;
  final String prefixIconsvg;
  VoidCallback ontap;
//  final TextEditingController? mycontroller;

   CustomTextFormPrfile(
      {Key? key,
      // required this.mycontroller,
      required this.hinttext,
       this.keyboardType,
      required this.svg,
       required this.prefixIconsvg,
       required this.ontap,
 
     })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: TextFormField(
        keyboardType: keyboardType == true?TextInputType.phone:TextInputType.text,
        textAlign: TextAlign.right,
        // controller: mycontroller,
        decoration: InputDecoration(
          
            hintText: hinttext,
            
            hintStyle:  TextStyle(fontSize: ScreenUtil().setSp(14),),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding:
                 EdgeInsets.symmetric(
                  vertical: ScreenUtil().setHeight(5), 
                  horizontal: ScreenUtil().setWidth(10)),
           prefixIcon: Padding(
             padding: const EdgeInsets.all(10.0),
             child: SvgPicture.asset(svg,
                
              fit: BoxFit.contain,
              ),
           ),
           suffixIcon: GestureDetector(
            onTap: ontap,
             child: Padding(
               padding: const EdgeInsets.all(10.0),
               child: SvgPicture.asset(prefixIconsvg,
                  
                fit: BoxFit.contain,
                ),
             ),
           ),
            border:
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.h),

                  )),
      ),
    );
  }
  
}

