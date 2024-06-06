import 'package:flutter_application_9/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextSignUpOrSignIn extends StatelessWidget {
  
  final String texttwo;
  final void Function() onTap;
  const CustomTextSignUpOrSignIn(
      {Key? key,
    
      required this.texttwo,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
       
        InkWell(
          onTap: onTap,
          child: Text(texttwo,
              style:  TextStyle(
                  color: AppColor.primaryColor, 
                  fontWeight: FontWeight.bold,
                  fontSize: 14.h,
                  decoration: TextDecoration.underline
                  )),
        )
      ],
    );
  }
}
