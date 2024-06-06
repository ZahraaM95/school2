import 'package:flutter_application_9/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtomAuth extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomButtomAuth({Key? key, required this.text, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
      padding: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
      child: MaterialButton(
        
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        padding: EdgeInsets.symmetric(vertical:ScreenUtil().setHeight(18), horizontal:ScreenUtil().setWidth(110)),
        onPressed: onPressed,
        color: AppColor.primaryColor,
        textColor: Colors.white,
        
        child: Text(text, 
        style: TextStyle(
          fontWeight: FontWeight.bold , fontSize: ScreenUtil().setSp(16))),
      ),
    );
  }
}
