// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_9/core/constant/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextForm extends StatelessWidget {
  final String hinttext;
  late bool? keyboardType;
  final String svg;
 final TextEditingController? mycontroller;


   CustomTextForm(
      {Key? key,
      required this.hinttext,
       this.keyboardType,
      required this.svg,
     required this.mycontroller,
      // required Null Function(dynamic value) onChanged
     })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        keyboardType: keyboardType == true?TextInputType.phone:TextInputType.text,
        textAlign: TextAlign.right,
        controller: mycontroller,
        decoration: InputDecoration(
          
            hintText: hinttext,
            
            hintStyle:  TextStyle(fontSize: ScreenUtil().setSp(14),),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding:
                 EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(5), horizontal: ScreenUtil().setWidth(10)),
           prefixIcon: Padding(
             padding: const EdgeInsets.all(10.0),
             child: SvgPicture.asset(svg,
              color: AppColor.grey,
                
              fit: BoxFit.contain,
              ),
           ),
            border:
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14.h))),
      ),
    );
  }
}
