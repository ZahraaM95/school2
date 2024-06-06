import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_9/controller/auth/login_controller.dart';
import 'package:flutter_application_9/core/constant/color.dart';
import 'package:flutter_application_9/featuers/quiz/quiz.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg_flutter.dart';

class ChooseLessonesListView extends StatelessWidget {
  final String seasonID;

  const ChooseLessonesListView({super.key, required this.seasonID});

  @override
  Widget build(BuildContext context) {
    final LessonController controller = Get.put(LessonController());
    final LoginController loginController = Get.put(LoginController());

    String userId = loginController.userID.toString();

    controller.fetchSeason(seasonID, userId);
    return Scaffold(
      appBar: AppBar(
        title: const Text('الدروس'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          child: Obx(() {
            log('isLoading: ${controller.isLoading.value}');
            log('season length: ${controller.season.length}');

            if (controller.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            } else if (controller.season.isEmpty) {
              return const Center(child: Text('لا توجد دروس'));
            }

            return Column(
               children:
                [
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Align(
                     alignment: Alignment.topRight,
                     child: Container(
                     height: 25.w,
                      width: 64.h,
                     padding: const EdgeInsets.all(4.0),

                      decoration: BoxDecoration(
                    color: AppColor.lightblue,
                    borderRadius: BorderRadius.circular(20),
                                   ),
                                             child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [

                            SvgPicture.asset('assets/svg/Group.svg',width: 10,height: 10,),
                            Text(
                         '${controller.season.length} / ${controller.season.length} ',
                              textAlign: TextAlign.right,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                     ),
                   ),
                 ),
                 Visibility(
                   visible: true,
                   child: GestureDetector(
                     onTap: () {
                       Get.to(() => QuizView());
                     },
                     child: const DirectExam(),
                   ),
                 ),

                 Expanded(
                   child: ListView.builder(
                     itemCount: controller.season.length,
                     itemBuilder: (context, index) {
                       final season = controller.season[index];
                       log('Displaying lesson: ${season.nameAr}');
                       return GestureDetector(
                         onTap: () {},
                         child: CheckItem(
                           text: season.nameAr,
                           text2: season.nameEn,
                           lessonCompleted: season.isDone,
                         ),
                       );
                     },
                   ),
                 ),
               ],
            );
          }),
        ),
      ),
    );
  }
}

class DirectExam extends StatelessWidget {
  const DirectExam({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              offset: Offset(1, 1),
            ),
          ],
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'اختبار شامل ',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ),
    );
  }
}

class CheckItem extends StatelessWidget {
  const CheckItem({
    super.key,
    required this.text,
    required this.text2,
    required this.lessonCompleted,
  });

  final String text;
  final String text2;
  final bool lessonCompleted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: 60,
          width: 150,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                offset: Offset(1, 1),
              ),
            ],
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                   child: Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.right,
                ),
               
              ),
              Text(
                  " / ",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.right,
                ),
               Text(
                  text2,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.right,
                ),
              const Spacer(
                flex: 1,
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  lessonCompleted 
                      ? 'assets/svg/done.svg'
                      :'assets/svg/Group.svg'
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LessonController extends GetxController {
  var isLoading = true.obs;
  var season = <Lesson>[].obs;

  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'http://153.92.222.153:200',
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    },
  ));

  Future<void> fetchSeason(String seasonID, String userId) async {
    isLoading.value = true;
    log('$seasonID $userId');

    try {
      final response = await _dio.get('/subjects/lessons', queryParameters: {
        'seasonID': seasonID,
        'userID': userId,
      });

      if (response.statusCode == 200) {
        // log(response.data.toString()); // Log the entire response to see its structure

        var data = response.data['lessons'] as List;
        season.value = data.map<Lesson>((json) => Lesson.fromJson(json)).toList();
         log(response.data.toString()); // Log the entire response to see its structure

            } else {
        throw ServerFailure(response.data['msg'].toString());

      }
    } catch (e) {
      log('Error fetching season: $e');
      
      // Handle the error, possibly by showing a message to the user
    } finally {
      isLoading.value = false;
    }
  }
}

class ServerFailure implements Exception {
  final String message;
  ServerFailure(this.message);
}

class Lesson {
  String id;
  String nameAr;
  String nameEn;
  String examId;
  bool isDone;

  Lesson({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.examId,
    required this.isDone,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      id: json['_id'],
      nameAr: json['name_ar'],
      nameEn: json['name_en'],
      examId: json['exam_id'],
      isDone: json['is_done'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name_ar': nameAr,
      'name_en': nameEn,
      'exam_id': examId,
      'is_done': isDone,
    };
  }
}
