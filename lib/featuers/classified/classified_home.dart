// // ignore_for_file: public_member_api_docs, sort_constructors_first

// ignore_for_file: library_private_types_in_public_api

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_application_9/core/constant/color.dart';
class Classified extends StatefulWidget {
  const Classified({Key? key}) : super(key: key);

  @override
  _ClassifiedState createState() => _ClassifiedState();
}

class _ClassifiedState extends State<Classified> {
  @override

  
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showChiscoBottomSheet(context, Container(      ),
      
  );
    });
  }

  @override
  Widget build(BuildContext context) {
    return
       Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image/tasnef-vview.png',
              ),
              fit:BoxFit.cover
            ),
)          ),
       
                  // const Positioned(
                  //   bottom: 0,
                  //   child: MyBottomNavigationBar()),

        ],
      
    );
  }

  void showChiscoBottomSheet(BuildContext context, Widget child) {
    
    showModalBottomSheet<void>(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
      barrierColor: Colors.black.withOpacity(0.0),
      backgroundColor: Colors.white,
     showDragHandle: true,
      isScrollControlled: true,
      // enableDrag: true,
     isDismissible: false,
    //  useSafeArea:true,
 
      context: context,
      builder: (BuildContext context) {
        return
         BackdropFilter(
          filter: ImageFilter.blur(
          sigmaX: 1, sigmaY: 0.1, tileMode: TileMode.clamp
          ),
          child:
           SingleChildScrollView(
            child: AnimatedPadding(
              padding: MediaQuery.of(context).viewInsets,
              duration: const Duration(milliseconds: 100),
              child: SizedBox(
                height:  ScreenUtil().setHeight(500),
                child: const Padding(
                  padding:  EdgeInsets.all(10),
                  child:  SingleChildScrollView(
                    
                    child: Column(
                    children: [
                         ClassifiedItem(
                          name: "ليث",
                          mrkes:"الاول ",
                          svg: 'assets/svg/m1.svg'),
                      ClassifiedItem(
                             name: "عباس فاضل",
                          mrkes:" الثاني",
                          svg: 'assets/svg/m2.svg',
                          ),
                      ClassifiedItem(
                           name: "احمد محسن",
                          mrkes:"الثالث ",
                          svg: 'assets/svg/m3.svg'),
                      ClassifiedItem(
                      name: "نور",
                          mrkes:" الربع",
                          svg: 'assets/svg/m4.svg'),
                      ClassifiedItem(
                      name: "text",
                          mrkes:" text",
                          svg: 'assets/svg/m4.svg'),
                      ClassifiedItem(
                      name: "text",
                          mrkes:"text ",
                          svg: 'assets/svg/m4.svg'),
                   
                    ],
                                ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class ClassifiedItem extends StatelessWidget {
 final String name;
 final String svg;
 final String mrkes;

  const ClassifiedItem({
    Key? key,
    required this.name,
    required this.svg,
    required this.mrkes,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
          SizedBox(
              height: 50.h,
            ),
        Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: const Border.fromBorderSide(
                  BorderSide(color: AppColor.borderColor),
                ),
                color: AppColor.primaryColor,
              ),

              child:  ListTile(
                style:ListTileStyle.drawer,
                title: Text(name),
                subtitle:Text(mrkes),
                trailing:SvgPicture.asset(svg),
                
              ),
 
        ),
      ]
    );
  }
  
}

                 
                     