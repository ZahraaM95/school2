// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';
// import 'dart:developer';

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get.dart';
// import 'package:get/get.dart';

// import 'package:flutter_application_9/controller/home/tab_bar_controller.dart';
// import 'package:flutter_application_9/featuers/Home/view/lensses.dart';

// class StudyStageDetailsScreen extends StatelessWidget {
//   final ClassessController controller = Get.put(ClassessController());

//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       if (controller.isLoading.value) {
//         return Center(child: CircularProgressIndicator());
//       } else {
//         return ListView.builder(
//           shrinkWrap: true,
//           scrollDirection: Axis.horizontal,
//           itemCount: controller.studyStage.value.classes.length,
//           itemBuilder: (context, index) {
//             return Stack(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: GestureDetector(
//                     onTap: () {
//                       Get.to(() => const LossenSreen());
//                     },
//                     child: Image.asset(controller.studyStage.value.classes[index].image[0]),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 110, right: 50),
//                   child: Image.asset('assets/image/Rectangle 245.png'),
//                 ),
//                 SizedBox(
//                   width: 267,
//                   child: Padding(
//                     padding: const EdgeInsets.only(top: 100),
//                     child: Align(
//                       alignment: Alignment.topCenter,
//                       child: Text(
//                         utf8.decode(controller.studyStage.value.classes[index].name.runes.toList()),
//                         style: const TextStyle(
//                           fontSize: 30,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             );
//           },
//         );
//       }
//     });
//   }
// }


// class ClassessController extends GetxController {
//   var studyStage = StudyStageModle(
//     id: '664b5b4fad1feaf5b6bc4921',
//     name: 'Study Stage',
//     classes: [],
//   ).obs;
//   var isLoading = true.obs;
//   final ApiService _apiService = ApiService();

//   @override
//   void onInit() {
//     fetchClasses();
//     super.onInit();
//   }

//   Future<void> fetchClasses() async {
//     try {
//       isLoading(true);
//       var fetchedData = await _apiService.fetchClasses('664b5b4fad1feaf5b6bc4921');
//       studyStage(fetchedData);
//     } catch (e) {
//       print("Exception: $e");
//     } finally {
//       isLoading(false);
//     }
//   }
// }



// class ApiService {
//   final Dio _dio = Dio();

//   Future<StudyStageModle> fetchClasses(String categoryId) async {
//     try {
//       final response = await _dio.get(
//         'http://153.92.222.153:200/classes',
//         queryParameters: {'categoryID': categoryId},
//       );

//       if (response.statusCode == 200) {
//         return StudyStageModle.fromJson(response.data);
//       } else {
//         throw Exception('Failed to load classes');
//       }
//     } catch (e) {
//       throw Exception('Failed to load classes: $e');
//     }
//   }
// }


// // import 'dart:convert';
// // import 'dart:developer';
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:http/http.dart' as http;
// // import 'package:flutter_application_9/featuers/Home/view/lensses.dart';

// // class StudyStageDetailsScreen extends StatelessWidget {
// //   final ClassessController controller = Get.put(ClassessController());

// //   @override
// //   Widget build(BuildContext context) {
// //     return Obx(() {
// //       if (controller.isLoading.value) {
// //         return Center(child: CircularProgressIndicator());
// //       } else {
// //         return ListView.builder(
// //           shrinkWrap: true,
// //           scrollDirection: Axis.horizontal,
// //           itemCount: controller.studyStage.value.classes.length,
// //           itemBuilder: (context, index) {
// //             return Stack(
// //               children: [
// //                 Padding(
// //                   padding: const EdgeInsets.all(8.0),
// //                   child: GestureDetector(
// //                     onTap: () {
// //                       Get.to(() => const LossenSreen());
// //                     },
// //                     child: Image.asset(controller.studyStage.value.classes[index].image[index]),
// //                   ),
// //                 ),
// //                 Padding(
// //                   padding: const EdgeInsets.only(top: 110, right: 50),
// //                   child: Image.asset('assets/image/Rectangle 245.png'),
// //                 ),
// //                 SizedBox(
// //                   width: 267,
// //                   child: Padding(
// //                     padding: const EdgeInsets.only(top: 100),
// //                     child: Align(
// //                       alignment: Alignment.topCenter,
// //                       child: Text(
// //                         utf8.decode(controller.studyStage.value.classes[index].name.runes.toList()),
// //                         style: const TextStyle(
// //                           fontSize: 30,
// //                           fontWeight: FontWeight.bold,
// //                           color: Colors.white,
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             );
// //           },
// //         );
// //       }
// //     });
// //   }
// // }
// // class ClassessController extends GetxController {
// //   var studyStage = ClassessModle(
// //     id: '664b5b4fad1feaf5b6bc4921',
// //     name: 'Study Stage',
// //     classes: [],
// //   ).obs;
// //   var isLoading = true.obs;

// //   @override
// //   void onInit() {
// //     fetchClasses();
// //     super.onInit();
// //   }

// //   Future<void> fetchClasses() async {
// //   try {
// //     isLoading(true);
// //     final response = await http.get(
// //       Uri.parse('http://153.92.222.153:200/classes?categoryID=664b5b4fad1feaf5b6bc4921'),
// //       headers: {
// //         'Content-Type': 'application/json; charset=UTF-8',
        
// //       },
// //     );

// //     if (response.statusCode == 200) {
// //       var jsonResponse =  json.decode(response.body);
// //       print('JSON Response: $jsonResponse');

// //       if (jsonResponse['classes'] != null && jsonResponse['classes'] is List) {
// //         var classes = jsonResponse['classes'] as List;
// //         log('classes: $classes');
// //         var myclass = classes.map((data) => ClassessModle.fromJson(data)).toList();
// //         print('classes: $myclass');
// //         // studyStages.assignAll(myclass);
// //       } else {
// //         print("Error: 'categoryes' field is either null or not a List");
// //       }
// //     } else {
// //       print("Error: ${response.statusCode}");
// //     }
// //   } catch (e) {
// //     print("Exception: $e");
// //   } finally {
// //     isLoading(false);
// //   }
// // }



// // }

// // class Class {
// //   String name;
// //   List<String> image;

// //   Class({required this.name, required this.image});

// //   factory Class.fromJson(Map<String, dynamic> json) {
// //     return Class(
// //       name: json['name'],
// //       image: List<String>.from(json['image']),
// //     );
// //   }
// // }
// // class ClassessModle {
// //   String id ;
// //   String name;
// //   List<String> image = [
// //     'assets/image/602.png',
// //     'assets/image/603.png',
// //     'assets/image/605.png',
// //     'assets/image/606.png',
// //     'assets/image/601.png', 
// //   ];
// //   List<Class> classes;

// //   ClassessModle({
// //     required this.id,
// //     required this.name,
// //     required this.classes,
// //   });

// //   factory ClassessModle.fromJson(Map<String, dynamic> json) {
// //     return ClassessModle(
// //         name: json['name'],

// //       id: json['id'],
      
// //       classes: json['classes'] != null
// //           ? List<Class>.from(json['classes'].map((x) => Class.fromJson(x)))
// //           : [],
// //     );
// //   }
// // }
