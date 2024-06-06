import 'package:flutter/material.dart';
import 'package:flutter_application_9/featuers/Home/tab_bar_list_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_9/featuers/auth/view/widget/auth/custombuttonauth.dart';
import 'package:flutter_application_9/featuers/Home/view/offers_screen.dart';

class BrowsePage extends StatelessWidget {
  const BrowsePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

