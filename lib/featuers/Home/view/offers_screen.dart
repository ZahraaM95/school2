// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_application_9/featuers/Home/view/widget/regester.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_application_9/core/constant/color.dart';

import 'package:get/get.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration:  const BoxDecoration(
         image:  DecorationImage(image: AssetImage('assets/image/Frame 42.png'),
         fit: BoxFit.cover,
         ),
     
        ),
        child:  SafeArea(
          child: Center(
            child: Stack(
              children: [
                Padding(
                  padding:  EdgeInsets.all(5.0.h),
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     SizedBox(height: ScreenUtil().setHeight(180)),
                     Text('الخامس العلمي',
                    style: TextStyle(
                      color: AppColor.primaryColor,
                      fontSize: ScreenUtil().setSp(18),
                      fontWeight: FontWeight.bold
                    )),
                       SizedBox(height: ScreenUtil().setHeight(20)),
                    Container(
                      width: ScreenUtil().setWidth(334),
                      height: ScreenUtil().setHeight(80),
                      decoration:  BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20.h),
                          
                          ),
                         
                         
                      ),
                      child:  Text('انضم إلى عالم المعرفة والتحدي مع برنامجنا الحصري للاختبارات والتقييمات! اشتراكك معنا سيكون الخطوة الأولى نحو تحقيق أهدافك',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: ScreenUtil().setSp(14),
                          height: 1.5
                        ),
                        textAlign: TextAlign.center,
                
                      )),
                        const ContenerOffers(
                        title:'باقة الدروس الشاملة',
                        offers:[
                           '. وصول كامل إلى جميع المواد.',
                            '. مرحلة دراسية واحدة مختارة من قبلك.',
                            '. يوفر لك الفرصة لاداء اختبارات منهجية مركزة.',
                        ],
                        oldprice:220,
                        newprice: 160,
                
                
                      ),
                      const SizedBox(height: 20),
                        const ContenerOffers(
                        title:'باقة الدروس الشاملة',
                        offers:[
                           '. وصول كامل إلى جميع المواد.',
                            '. مرحلة دراسية واحدة مختارة من قبلك.',
                            '. يوفر لك الفرصة لاداء اختبارات منهجية مركزة.',
                        ],
                        oldprice:220,
                        newprice: 160,
                      ),
                
                        const SizedBox(height: 20),
                
                        ElevatedButton(
                          onPressed: (){
                          Get.to(() => const RegasterSreen());
                          },
                         style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                
                          ),
                         ),
                         child:  Padding(
                           padding:const EdgeInsets.symmetric(horizontal: 40,vertical: 15),
                           child:  Text('اشتراك',
                           style: TextStyle(
                             color: Colors.white,
                             fontSize: ScreenUtil().setSp(20),
                           )
                           ),
                         )
                         ),
                
                
                  ]
                      ),
                ),
              ]
                  ),

            )
        ),
      )
            );
          }

}

class ContenerOffers extends StatelessWidget {
   const ContenerOffers({
    Key? key,
    required this.title,
    required this.oldprice,
    required this.newprice, 
    required this.offers,
  }) : super(key: key);
  final String title;
  final List offers
  //= [
                        //  '. وصول كامل إلى جميع المواد.',
                        //   '. مرحلة دراسية واحدة مختارة من قبلك.',
                        //   '. يوفر لك الفرصة لاداء اختبارات منهجية مركزة.',
   ;                //   ];
  final int oldprice;
  final int newprice;
  @override
  Widget build(BuildContext context) {
    return Container(
    width: ScreenUtil().setWidth(375),
    height: ScreenUtil().setHeight(155),
    padding:  EdgeInsets.all(20.h),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.h),
    border: Border.all(
      color: Colors.black, // لون الحدود الأسود
      width: 1.0, // سمك الحدود
    ),
        color: Colors.white,
    ),
    child:  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
     
              
         Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Text(title,
              style: TextStyle(
                color: AppColor.primaryColor,
                height: 1.5,
                fontSize: ScreenUtil().setSp(18),
         
              ),
            ),
              Text(offers[0],
                    style: TextStyle(
                color: Colors.black,
                fontSize: ScreenUtil().setSp(14),
                 height: 1.5,
              )
              ),
              
              Text( offers[1],
                    style: TextStyle(
                color: Colors.black,
                 height: 1.7,
                fontSize: ScreenUtil().setSp(14),
              )
              ),
              Text( offers[2],
                    style: TextStyle(
                color: Colors.black,
                 height: 1.7,
                fontSize: ScreenUtil().setSp(14),
              )
              ),
          ]
            ),
             // const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    
                    Text("\$$oldprice",
                          style: TextStyle(
                             height: 1.5,
                            decoration: TextDecoration.lineThrough,
                      color: Colors.black,
                      fontSize: ScreenUtil().setSp(16),
                    )
                    ),
                    Text( '\$$newprice',
    
                          style: TextStyle(
                           height: 1.5,
                      color: AppColor.primaryColor,
                      fontSize: ScreenUtil().setSp(20),
                    )
                    ),
                    Text( 'مدى الحياة',
                       style: TextStyle(
                         height: 1.5,
                      color: Colors.black,
                      fontSize: ScreenUtil().setSp(8),
                    )
                    ),
                  ],
                ),
         
    
    
          ],
    
        ),
                   
    );
  }
}
