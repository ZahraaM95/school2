// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_application_9/core/constant/imgaeasset.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ListViewItem extends StatelessWidget {
  const ListViewItem({
    Key? key,
    required this.image,
  }) : super(key: key);
final String image;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
     height: ScreenUtil().setHeight(200), 
     width: ScreenUtil().setWidth(400),
      child: ListView.builder(
         shrinkWrap: true,
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return  Padding(
                    padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(5)),
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                       Image.asset(AppImageAsset.ImageOne),
                       Image.asset(AppImageAsset.ImageTwo),
                       Image.asset(AppImageAsset.ImageThree),
                      ]
                    ),
              
      );
                }
      ),
    );
  }
  
  // ignore: non_constant_identifier_names
  CustomClassImage() {
   
    return Container(
      width:  ScreenUtil().setWidth(400),
      height: ScreenUtil().setHeight(600),
     
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.h),
        image:   DecorationImage(
          image: AssetImage(image)
          
        )
      ),

    );
  }
}
