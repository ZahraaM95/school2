// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_application_9/controller/home/bottom_navigation_con.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class bottomNavigationBar extends GetView<HomeController> {
  const bottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        key: Get.nestedKey(1),
        initialRoute: '/home',
        onGenerateRoute: controller.onGenerateRoute,
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
                 items: 
        <BottomNavigationBarItem>[
       BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/svg/home.svg'),
            label: 'الرئيسية',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/svg/cup.svg'),
            label: 'التصنيف',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/svg/messages-2.svg'),
            label: 'المجتمع',
      
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/svg/user2.svg'),
            label: 'الحساب',
            
            
          ),
        ],
       
          currentIndex: controller.currentIndex.value,
          selectedItemColor: Colors.pink,
          onTap: controller.changePage,
        ),
      ),
    );
  }
}



  
