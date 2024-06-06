// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_9/controller/quzi/quiz_controller.dart';
import 'package:flutter_application_9/core/constant/color.dart';
import 'package:flutter_application_9/core/function/alert.dart';
import 'package:flutter_application_9/featuers/Home/view/home.dart';
import 'package:flutter_application_9/featuers/quiz/quiz.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FinsheExam extends StatelessWidget {
  FinsheExam({super.key});
  QuizController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Logo App'),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 200.h,
                  width: 200.w,
                  child: Image.asset(
                      'assets/image/lounge-awards-against-the-background-of-the-growth-chart 1.png'),
                ),
                const SizedBox(height: 10),

                 Text(
                 controller.correctAnswersCount > controller.quiz.value!.questions.length ? 'تهانينا!': ' ادرس بجد وحاول مره اخرى',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                const Text(
                  'لقد اكملت الاختبار',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  'تم الاجابه على   ${controller.quiz.value!.questions.length} /${controller.correctAnswersCount} سوال ',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 80),
                CustomButtomAuth(
                    text: 'الصفحه الرئسيه',
                    onPressed: () {
                      Get.to(() => const BrowsePage());
                    }),
                const SizedBox(height: 10),
                OutlinedButton(
                  onPressed: () {
                    Get.to(() => QuizView() );
                  },
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                          horizontal: 30.h, vertical: 10.h)),
                      side: MaterialStateProperty.all(
                          const BorderSide(color: AppColor.borderColor)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.h),
                      ))),
                  child: Text(' اعادة الاختبار ',
                      style: TextStyle(
                        color: AppColor.borderColor,
                        fontSize: ScreenUtil().setSp(16),
                        fontWeight: FontWeight.w700,
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
