import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextTitleAuth extends StatelessWidget {
  final String text;
  const CustomTextTitleAuth({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomRight,
      child: Text(
        text,
        textAlign: TextAlign.right,
        style: TextStyle(
          color: Colors.black,
          fontSize: 24.h,
          fontWeight: FontWeight.w800
        ) ,
      ),
    );
  }
}
