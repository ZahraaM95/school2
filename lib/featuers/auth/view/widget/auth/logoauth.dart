// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class LogoAuth extends StatelessWidget {
  const LogoAuth({
    Key? key,
    required this.image,
  }) : super(key: key);
final String image ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)), // Border radius
      child: Image.asset(
        image,
        fit: BoxFit.cover,
        width: ScreenUtil().setWidth(250),
        height: ScreenUtil().setHeight(250),)
    
        
      
    );
  }
}
