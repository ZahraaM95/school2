// // ignore_for_file: avoid_print
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_9/controller/home/tab_bar_controller.dart';
// import 'package:flutter_application_9/featuers/Home/class_study_stage_details_screen.dart';
// import 'package:flutter_application_9/featuers/Home/view/lensses.dart';
// import 'package:get/get.dart';
// class StudyStageScreen extends StatelessWidget {
//   const StudyStageScreen({super.key});

// @override
// Widget build(BuildContext context) {
//   final StudyStageController controller = Get.put(StudyStageController());

//   return Directionality(
//     textDirection: TextDirection.rtl,
//     child: Scaffold(
//       backgroundColor: Colors.accents[0],
//       body: Obx(() {
//         print('isLoading: ${controller.isLoading.value}');
//         print('studyStages: ${controller.studyStages}');
//         if (controller.isLoading.value) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (controller.studyStages.isEmpty) {
//           return const Center(child: Text('لا تتوفر بيانات'));
//         } else {
//           return DefaultTabController(
//             length: controller.studyStages.length,
//             child: Column(
//               children: [
//                 TabBar(
//                   indicator: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     image: const DecorationImage(
//                       image: AssetImage('assets/image/back.png'),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   labelColor: Colors.black,
//                   labelStyle: const TextStyle(
//                     fontSize: 14,
//                     color: Colors.black,
//                     fontFamily: 'lamaSans-SemiBold.ttf',
//                   ),
//                   isScrollable: true,
//                   tabs: controller.studyStages
//                       .map((stage) => Container(
//                             padding: const EdgeInsets.all(13),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               border: Border.all(color: const Color(0xFF4F98CA)),
//                             ),
//                             child: GestureDetector(
//                               onTap: () {
//                                 // controller.fetchClasses(stage.id);
//                               },
//                               child: Tab(text:( stage.name))),
//                           ))
//                       .toList(),
//                 ),
//                 Expanded(
//                   child: TabBarView(
//                     children: controller.studyStages
//                         .map((stage) => StudyStageDetailsScreen(stage))
//                         .toList(),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         }
//       }),
//     ),
//   );
// }
// }
// class StudyStageDetailsScreen extends StatelessWidget {
//   final ClassesController classesController = Get.put(ClassesController());
//   final StudyStageModle studyStage;

//    StudyStageDetailsScreen(this.studyStage, {super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       shrinkWrap: true,
//       scrollDirection: Axis.horizontal,
//       itemCount: studyStage.classes.length,
//       itemBuilder: (context, index) {
//         return Stack(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: GestureDetector(
//                 onTap: () {
//                   Get.to(() => const LossenSreen());
//                 },
//                 child: Image.asset(studyStage.classes[index].image[index]),
                        
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 110, right: 50),
//               child: Image.asset('assets/image/Rectangle 245.png'),
//             ),
//             SizedBox(
//               width: 267,
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 100),
//                 child: Align(
//                   alignment: Alignment.topCenter,
//                   child: Text(
//                     studyStage.classes[index].image[index]
//                     ,
                  
//                     style: const TextStyle(
//                       fontSize: 30,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
