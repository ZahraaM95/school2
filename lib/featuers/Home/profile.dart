// ignore_for_file: public_member_api_docs, sort_constructors_first, deprecated_member_use, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_application_9/core/constant/color.dart';
import 'package:flutter_application_9/core/function/alert.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'edit_info_user.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return   SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: Column(
          children: [
              const SizedBox( height: 60),
            GestureDetector(
              onTap:(){
                Get.to(()=> const EditInFoUser());
              },
              child: ProfileItem(
                text:'معلومات الحساب ',
                image: 'assets/svg/user2.svg',
                color: Colors.black,
            
              ),
            ),
             divider(),

            ProfileItem2(
              text:' ارسال الاشعارات  ',
              image: 'assets/svg/notification.svg',
              color: Colors.black,
              image2: 'assets/svg/Switch.svg',


            ),
             divider(),

            ProfileItem(
              text:'  سياسه الخصوصيه  ',
              image: 'assets/svg/danger.svg',
              color: Colors.black,

            ),
             divider(),

              ProfileItem2(
              text:'تواصل معنا  ',
              image: 'assets/svg/message_3.svg',
              image2:'assets/svg/back.svg',
                color: Colors.black,


            ), 
              divider(),
                  GestureDetector(
                    onTap: (){
                       Get.defaultDialog(
                  title: "  ",
                  content:const AlertApp(
                    image: 'assets/image/logout.png',
                  ),
                       );
                    },
                    child: ProfileItem(
                                text:' تسجيل الخروج ',
                                image: 'assets/svg/logout.svg',
                                color: Colors.red,
                              ),
                  ), 
             SizedBox( height: 255.h),
          ]
        ),
      ),
    );
    
  }

  Divider divider() {
    return const  Divider(
          thickness: 1,
          height: 10,
          indent: 40,
          endIndent: 40,
          color:AppColor.grey,
        );
  }
  
}

class ProfileItem extends StatelessWidget {
  ProfileItem({
    Key? key,
    required this.text,
    required this.color,
    required this.image,
  }) : super(key: key);
   final String text;
   final String image ;
    Color color   ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children:  [
         
           Padding(
             padding: const EdgeInsets.all(12.0),
             child: SvgPicture.asset(
              image,
              color: color,
                           ),
           ),
           Text(text,
            style: TextStyle(
              fontSize: 16, 
              fontWeight: FontWeight.bold,
              color: color,
              ),
          ),
          const Spacer(),
          
     
        ]
      ),
    );
  }
}

class ProfileItem2 extends StatelessWidget {
  ProfileItem2({
    Key? key,
    required this.text,
    required this.color,
    required this.image,
    required this.image2,
  }) : super(key: key);
   final String text;
   final String image ;
    String image2  ;
    Color color   ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children:  [
         
           Padding(
             padding: const EdgeInsets.all(12.0),
             child: SvgPicture.asset(
              image,
              color: color,
                           ),
           ),
           Text(text,
            style: TextStyle(
              fontSize: 16, 
              fontWeight: FontWeight.bold,
              color: color,
              ),
          ),
          const Spacer(),
            Padding(
             padding: const EdgeInsets.symmetric(horizontal: 16),
             child: SvgPicture.asset(
              image2,
           
                           ),
           ),
          
     
        ]
      ),
    );
  }
}
