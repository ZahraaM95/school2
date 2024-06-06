// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_application_9/controller/home/tab_bar_cont.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_application_9/featuers/Home/view/lensses.dart';

import '../../controller/droos/lessons_con.dart';

class TabBarListView extends StatelessWidget {
  const TabBarListView({super.key});

  @override
  Widget build(BuildContext context) {
    final TabBarController controller = Get.put(TabBarController());

    Get.put(LessonsController()); 

    return Scaffold(
      body: Column(
        children: [
          Obx(() {
            if (controller.isLoadingCategories.value) {
              return Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 100.0,
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, __) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 100.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    itemCount:6,
                  ),
                ),
              );
            } else {
              
              return Container(
                height: 100.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.categories.length,
                  itemBuilder: (context, index) {
                    final category = controller.categories[index];
                    final isSelected = category.id == controller.selectedCategoryId.value;
                    return GestureDetector(
                      onTap: () => controller.fetchClasses(category.id),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Builder(
                          builder: (context) {
                            return 
                            Container(
                              width: 100.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: isSelected
                                    ? const DecorationImage(
                                        image: AssetImage('assets/image/back.png'),
                                        fit: BoxFit.fill,
                                      )
                                    : null,
                                border: isSelected
                                    ? null
                                    : Border.all(color: const Color(0xFF4F98CA)),
                              ),
                              child: Center(
                                child: Text(
                                  category.name,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            );
                          }
                        ),
                      ),
                    );
                  },
                ),
              );
         
            }
          }),
          Expanded(
            child: Obx(() {
              if (controller.isLoadingClasses.value) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, __) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 300.0,
                        height: 200.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    itemCount: 6,
                  ),
                );
              } else {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.classes.length,
                  itemBuilder: (context, index) {
                    final classItem = controller.classes[index];
                    final imagePaths = _getImagesForCategory(controller.selectedCategoryId.value);
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LessonsView
                            (classItem: classItem,
                              // userId: controller.userId.value,

                            
                            ),
                          ),
                        );
                      },
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              imagePaths[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 90, right: 40),
                            child: Image.asset('assets/image/Rectangle 245.png'),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 70.0),
                            child: SizedBox(
                              height: 350.0,
                              child: Text(
                                classItem.name,
                                style: const TextStyle(
                              
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }
            }),
          ),
        ],
      ),
    );
  }

  List<String> _getImagesForCategory(String? categoryId) {
    switch (categoryId) {
      case '664b5b4fad1feaf5b6bc4921':
        return [
          'assets/image/602.png',
          'assets/image/603.png',
          'assets/image/605.png',
          'assets/image/606.png',
          'assets/image/601.png',
        ];
      case '6654c295a58d01de7bd93f45':
        return [
          'assets/image/602.png',
          'assets/image/603.png',
          'assets/image/605.png',
          'assets/image/606.png',
          'assets/image/601.png',
        ];
      case '6654c2a57b2d0e0af3a0efd9':
        return [
          'assets/image/602.png',
          'assets/image/603.png',
          'assets/image/605.png',
          'assets/image/606.png',
          'assets/image/601.png',
        ];
      default:
        return [
          'assets/image/602.png',
          'assets/image/603.png',
          'assets/image/605.png',
          'assets/image/606.png',
          'assets/image/601.png',
        ];
    }
  }
}

