import 'package:flutter/material.dart';
import 'package:flutter_application_9/featuers/Home/tab_bar_list_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_9/featuers/auth/view/widget/auth/custombuttonauth.dart';
import 'package:flutter_application_9/featuers/Home/view/offers_screen.dart';
import 'package:get/get.dart';

import '../../../controller/home/bottom_navigation_con.dart';

class BrowsePage extends GetView<HomeController> {
  const BrowsePage({super.key});


  

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            centerTitle: true,
            title: const Text(
              'Logo',
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                 SizedBox(
                  height: ScreenUtil().setHeight(500),
                  width: ScreenUtil().setWidth(600),
                  
                  child: const TabBarListView(),
                  ),
                  CustomButtomAuth(
                    text: 'التسجيل',
                    onPressed: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) => const OffersScreen(),
                      );
                    },
                  ),
                  // const SizedBox(height: 40),
                  // const SizedBox(height: 40),
                ],
              ),
            ),
          ),

    );
  }
}

class HomeController extends GetxController {
  var currentIndex = 0.obs;

  void changePage(int index) {
    currentIndex.value = index;
    // Add your page changing logic here
  }

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    // Define your route generation logic here
    return MaterialPageRoute(builder: (_) => const Placeholder());
  }
}