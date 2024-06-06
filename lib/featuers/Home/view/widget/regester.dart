
import 'package:flutter/material.dart';
import 'package:flutter_application_9/core/constant/color.dart';
import 'package:flutter_application_9/featuers/auth/view/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegasterSreen extends StatelessWidget {
  const RegasterSreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(' App Logo',style: TextStyle(color: Colors.black),),
        elevation: 0,
        actions: [
          IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_forward_outlined,
            color: Colors.black,
          )
        ),
        ]
      ),

      body: Center(
       child:   Column(
         children: [
           Container(
                
    width: ScreenUtil().setWidth(350),
    height: ScreenUtil().setHeight(450),
    padding:  EdgeInsets.all(20.h),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.h),
    border: Border.all(
      color:AppColor.primaryColor, 
      width: 1.0, // سمك الحدود
    ),
            color: Colors.white,
    ),
            child: Column(
              children: [
     SizedBox(
                  width: 400.h,
                  child: Text('طريقة الدفع  عبر ارسال مندوب\n خاص اليك لاستلام مبلغ الاشتراك قم بملئ معلوماتك\n لاكمال العملية',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.h,
                    height: 1.4,
                  ),
                  textAlign: TextAlign.center,),
                ),
                const SizedBox(height: 30),

                Text('الخامس العلمي باقة الدروس الشاملة 120\$',
                style: TextStyle(
                  color:AppColor.primaryColor,
                  fontSize: 14.h,
                  height: 2,
                ),
                ),

                const SizedBox(height: 30),

                CustomTextForm(
                  mycontroller: TextEditingController(),

                 svg:'assets/svg/location.svg' ,
                 keyboardType:false ,
                 hinttext: 'المحافظة',
                ),
                CustomTextForm(
                  mycontroller: TextEditingController(),
                 svg:'assets/svg/location.svg' ,
                 keyboardType:false ,
                 hinttext: 'المحافظة',
                ),
                CustomTextForm(
                  mycontroller: TextEditingController(),
                 svg:'assets/svg/call.svg' ,
                 keyboardType:false ,
                 hinttext: 'المحافظة',
                ),
                          ElevatedButton(
                              onPressed: (){
                              // Get.to(() => const RegasterSreen());
                              },
                             style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                    
                              ),
                             ),
                             child:  Padding(
                               padding:const EdgeInsets.symmetric(horizontal: 70,vertical: 15),
                               child:  Text('ارسال',
                               style: TextStyle(
                                 color: Colors.white,
                                 fontSize: ScreenUtil().setSp(20),
                               )
                               ),
                             )
                             ),

                            
                              ]
                )
      
            ),
            const SizedBox(height: 30),
             OutlinedButton(
              onPressed: (){},
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                     EdgeInsets.symmetric(horizontal: 95.h,vertical: 20.h)),
                  side: MaterialStateProperty.all(
                    const BorderSide(color: AppColor.grey)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ))
                ),
                  
                
                          child:  Text('طريقة الدفع  عبر زين كاش',
                           style: TextStyle(
                             color:AppColor.grey,
                             fontSize: ScreenUtil().setSp(14),
                           )
                           ),)
         ],
       ),
      ),
    );
  }
}