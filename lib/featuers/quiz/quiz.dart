import 'package:flutter/material.dart';
import 'package:flutter_application_9/controller/quzi/quiz_controller.dart';
import 'package:flutter_application_9/core/constant/color.dart';
import 'package:flutter_application_9/featuers/quiz/api_qution.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';

class QuizView extends StatelessWidget {
  final QuizController controller = Get.put(QuizController(Get.find<ApiService>()));

   QuizView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logo App'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.quiz.value == null) {
          return const Center(child: Text('Failed to load quiz'));
        } else {
          final question = controller.quiz.value!.questions[controller.currentQuestionIndex.value];
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(
                    width: 170,
                    child: LinearPercentIndicator(
                      lineHeight: 4.0,
                      percent: controller.correctAnswersPercentage,
                      backgroundColor: Colors.grey[300],
                      progressColor: Colors.blue,
                    ),
                  ),
                   Text(
                    'السوال ${controller.currentQuestionIndex.value + 1} / ${controller.quiz.value!.questions.length}',
                    style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                   SizedBox(height:10.h),
               Container(
                    width: 342.h,
                    height: 276.h,
                     padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      border: Border.all(color:AppColor.borderColor, width: 2.0),
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    child: Text(
                      question.title,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                            
                  ),
               
                  // Text(question.wantEN),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: question.answers.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            if (controller.selectedAnswer.value == -1) {
                              controller.selectAnswer(index);
                            }
                          },
                          child: Obx(() {
                            bool isSelected = controller.selectedAnswer.value == index;
                            Color borderColor =  AppColor.borderColor;
                            Color backColor =  Colors.white;
                            Color? shadowColor;
            
                            if (controller.isAnswered.value) {
                              if (index == question.ans) {
                                borderColor = const Color(0xFF12D18E);                                
                                backColor = const Color(0xFF12D18E);                                
                              } else if (isSelected && index != question.ans) {
                                borderColor = const Color(0xFFD31212);
                                backColor = const Color(0xFFD31212);
                              }
                            } else if (isSelected) {
                              shadowColor = const Color.fromARGB(255, 186, 186, 186);
                            }
            
                            return Container(
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              decoration: BoxDecoration(
                                color: backColor,
                                border: Border.all(color: borderColor, width: 2.0),
                                borderRadius: BorderRadius.circular(18.0),
                                boxShadow: isSelected && !controller.isAnswered.value
                                    ? [
                                        BoxShadow(
                                          color: shadowColor!,
                                          blurRadius: 8.0,
                                          offset: const Offset(0, 6),
                                        )
                                      ]
                                    : [],
                              ),
                              child: ListTile(
                                title: Text(
                                  question.answers[index],
                                  style: const TextStyle(
                                    // color: textColor,
                                  ),
                                ),
                              ),
                            );
                          }),
                        );
                      },
                    ),
                  ),
                  if (controller.selectedAnswer.value != -1)
                    SizedBox(
                      width: 342.h,
                      height: 56.h,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          
                          // padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 80.0),
                         shadowColor: const Color.fromARGB(255, 130, 132, 134),
                         backgroundColor: AppColor.primaryColor,
                        ),
                        onPressed: controller.isAnswered.value
                            ? controller.nextQuestion
                            : controller.confirmAnswer,
                        child: Text(controller.isAnswered.value ? 'التالي' : 'تأكيد ',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}


class Quiz {
  final List<Question> questions;

  Quiz({required this.questions});

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
      questions: (json['questions'] as List)
          .map((question) => Question.fromJson(question))
          .toList(),
    );
  }
}

class Question {
  final String title;
  final String wantEN;
  final List<String> answers;
  final int ans;

  Question({
    required this.title,
    required this.wantEN,
    required this.answers,
    required this.ans,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      title: json['title'],
      wantEN: json['want-EN'],
      answers: List<String>.from(json['answers']),
      ans: json['ans'],
    );
  }
}


