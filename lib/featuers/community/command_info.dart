// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'community_home.dart';

class CommandInfo extends StatelessWidget {
  const CommandInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            actions: [
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: SvgPicture.asset('assets/svg/back2.svg'),
                color: Colors.black,
              ),
            ],
            leading: null,
          ),
         
          body:  Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.all(0),  

              child: Column( 
                crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
               const Command(height:300),

                SizedBox(
                   width:360.h,
                  child: CustomTextForm(
                    hinttext: 'اكتب تعليق ',
                    svg: 'assets/svg/send.svg',
                    ),
                ),
                 const Padding(
                   padding: EdgeInsets.symmetric(horizontal: 20),
                   child: Text(' التعليقات (120)' ,textAlign: TextAlign.right,
                   style:   TextStyle(fontSize: 14),),
                 ),
                ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                return  const SizedBox(
                  height: 200,
                  width: 120,
                  child: OldCommands());
             }
        )
                ],
            ),
            )
          )),
    );
  }
}

class OldCommands extends StatelessWidget {
  const OldCommands({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width:360.h,
      padding: const EdgeInsets.all(20),
      child: 
      SizedBox(
        height: 200,
        width: 360,
        child: ListView(
          shrinkWrap: true,
          children: [
              SizedBox(
                width: 200,
                height: 70,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(' عباس فاضل    '   ,style: TextStyle(fontSize: 12),),
                    const Text('20/8/2022',style: TextStyle(fontSize: 10),),
                    const Spacer(flex: 1,),
                    SvgPicture.asset('assets/svg/warning-2.svg',width: 24,),
                  ],
                ),
              ),
      
                  Text('يكتب التعليق هنا يكتب التعليق هنا يكتب التعليق هنا يكتب التعليق هنا يكتب التعليق هنا يكتب التعليق هنا يكتب التعليق هنا يكتب التعليق هنا يكتب التعليق هنا يكتب التعليق هنا يكتب التعليق هنا يكتب التعليق هنا ',
                  style: TextStyle(fontSize: ScreenUtil().setSp(12),
                  height: 1.7,
                  ),
                 
                  ),
              
      
      
      
          ],
        ),
      ),
      
      
      );
  }
}

// ignore_for_file: deprecated_member_use


class CustomTextForm extends StatelessWidget {
  final String hinttext;
  late bool? keyboardType;
  final String svg;
 // final TextEditingController? mycontroller;

   CustomTextForm(
      {Key? key,
      required this.hinttext,
       this.keyboardType,
      required this.svg,
     // required this.mycontroller
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
           suffixIcon: Padding(
             padding: const EdgeInsets.all(10.0),
             child: SvgPicture.asset(svg,
                
              fit: BoxFit.contain,
              ),
           ),
            border:
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.h))),
      ),
    );
  }
}
