import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_9/controller/auth/login_controller.dart';
import 'package:flutter_application_9/core/constant/color.dart';
import 'package:flutter_application_9/featuers/Home/view/choese_lesson.dart';
import 'package:flutter_application_9/featuers/quiz/quiz.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg_flutter.dart';

class ChooseLesson extends StatelessWidget {
  final String lessonId;

  const ChooseLesson({super.key, required this.lessonId});

  @override
  Widget build(BuildContext context) {
    final LessonssController controller = Get.put(LessonssController());
    final LoginController loginController = Get.put(LoginController());

    String userId = loginController.userID.toString();

    controller.fetchLessons(lessonId, userId);
    return Scaffold(
        appBar: AppBar(
          // title: Text('دروس ${classItem.name}'),
          centerTitle: true,
        ),
        body: SafeArea(
          child:
              // lesson.directExam == true? Get.to(()=> ):
              Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else if (controller.lessons.isEmpty) {
                return const Center(child: Text('لا توجد دروس'));
              }

              return ListView(
                children: [
                  Align(
                      alignment: Alignment.bottomRight,
                    child: Text(
                      '${controller.lessons.length}/ ${controller.lessons.length} ',
                      textAlign: TextAlign.right,
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
                      itemCount: controller.lessons.length,
                      itemBuilder: (context, index) {
                        final lesson = controller.lessons[index];
                        return GestureDetector(
                          onTap: () {
                            Get.to(() => ChooseLessonesListView(
                                  seasonID: lesson.id,
                                ));
                          },
                          child: CheckItem(
                            text: lesson.name,
                            lessonTaken: lesson.directExam,
                            lessonCompleted: lesson.isDone,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }),
          ),
        ));
  }
}

class DirectExam extends StatelessWidget {
  const DirectExam({
    super.key,
  });

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
            )
          ],
          color: AppColor
              .primaryColor, // يمكنك استخدام AppColor.primaryColor هنا إذا كنت قد عرفت اللون في مكان آخر
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'اختبار فصلي',
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
    Key? key,
    required this.text,
    required this.lessonTaken,
    required this.lessonCompleted,
  }) : super(key: key);

  final String text;
  final bool lessonTaken;
  final bool lessonCompleted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        height: 60,
        width: 150,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              offset: Offset(1, 1),
            )
          ],
          color: AppColor
              .primaryColor, // يمكنك استخدام AppColor.primaryColor هنا إذا كنت قد عرفت اللون في مكان آخر
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
            const Spacer(
              flex: 1,
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                lessonCompleted && lessonTaken
                    ? 'assets/svg/done.svg'
                    : lessonTaken
                        ? 'assets/svg/Group.svg'
                        : 'assets/svg/lock2.svg',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LessonssController extends GetxController {
  var lessons = <Lesson>[].obs;
  var isLoading = false.obs;

  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'http://153.92.222.153:200',
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    },
  ));

  Future<void> fetchLessons(String lessonId, String userId) async {
    isLoading.value = true;
    log('$lessonId $userId');

    final response = await _dio.get('/subjects/seasons', queryParameters: {
      'subjectID': lessonId,
      'userID': userId,
    });

    if (response.statusCode == 200) {
      var data = response.data['seasons'] as List;
      lessons.value = data.map((json) => Lesson.fromJson(json)).toList();
    } else {
      //  ServerFailure( response.data['msg']);
    }

    isLoading.value = false;
  }
}

class Lesson {
  final String id;
  final String name;
  final bool directExam;
  final String examId;
  final bool isDone;

  Lesson({
    required this.id,
    required this.name,
    required this.directExam,
    required this.examId,
    required this.isDone,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      id: json['_id'],
      name: json['name'],
      directExam: json['direct_exam'],
      examId: json['exam_id'],
      isDone: json['is_done'],
    );
  }
}
