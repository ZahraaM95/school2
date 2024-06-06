
// // import 'package:flutter_application_9/featuers/quiz/model/quiz_modle.dart';
// // import 'package:get/get.dart';

// // class QuizController extends GetxController {
// //   final List<Question> questions = [
// //     Question(question: 'What is the capital of France?',
// //      options: ['Paris', 'London', 'Rome', 'Madrid'], 
// //      correctAnswerIndex: 1),
// //     Question(question: 'Who is the Prime Minister of Canada?', 
// //     options: ['Justin Trudeau', 'Boris Johnson', 'Emmanuel Macron', 'Angela Merkel'], 
// //     correctAnswerIndex: 2),
// //     Question(question: 'What is the currency of Japan?', 
// //     options: ['Yen', 'Euro', 'Dollar', 'Pound'], correctAnswerIndex: 1),
// //   ];

// //   var selectedAnswer = 0.obs;
// //   var currentQuestionIndex = 0.obs;

// //   bool isAnswered(int index) => selectedAnswer.value != 0;

// //   bool isCorrect(int index) => questions[index].correctAnswerIndex == selectedAnswer.value;

// //   void checkAnswer(int index) {
// //     selectedAnswer.value = index;
// //     update();
// //   }

// //   void nextQuestion() {
// //     if (currentQuestionIndex.value < questions.length - 1) {
// //       currentQuestionIndex.value++;
// //       selectedAnswer.value = 0;
// //       update();
// //     }
// //   }
// // }


// import 'package:flutter/material.dart';
// import 'package:flutter_application_9/featuers/quiz/ff.dart';
// import 'package:flutter_application_9/featuers/quiz/finshe_exam.dart';
// import 'package:flutter_application_9/featuers/quiz/model/quiz_modle.dart';
// import 'package:flutter_application_9/featuers/quiz/quiz.dart';
// import 'package:get/get.dart';

// class QuizController extends GetxController {
//    final List<QuizQuestion> questions = quizs;
//    int   inde = 0;
//    int correctAnswer = 0;
//    bool color = false ;
//     int currentIndex = 0;
//     int score = 0;
//  changeinde(index){
//   questions[inde].answers[index] == questions[inde].correctAnswerIndex ?
//    chackAniswer() : go() ;
//   // inde != questions.length - 1 ? inde++ :  Get.to(()=>   MyWidget(correctAnswer:correctAnswer));                                     
//    update();
//    }

//    chackAniswer() async{
//     correctAnswer++;
//     color = true ;

//     await Future.delayed( const Duration(milliseconds: 3000));
//        update();
//        inde != questions.length - 1 ? inde++ :  Get.to(()=> 
//          MyWidget(correctAnswer:correctAnswer));
//          color = false ;
//          update();
//    }
//    go(){
//     inde++ ;
//      update();
//    }
//     checkAnswer(int index) {
//     if (questions[currentIndex].correctAnswerIndex == index) {
//       // Correct answer
//         score++;
//         questions[currentIndex].backgroundColor = Colors.green;
//       } else if (questions[currentIndex].correctAnswerIndex != index) {
//         questions[currentIndex].backgroundColor = Colors.red;
//       }
//     } 
//       // Incorrect answer
//         // questions[currentIndex].backgroundColor = Colors.red;
//       }
    
  


//  final List<QuizQuestion> quizs = [
//     QuizQuestion(
//       question: 'What is the capital of France?',
//       answers: ['London', 'Paris', 'Berlin', 'Madrid'],
//       correctAnswerIndex: 1,
//     ),
//     QuizQuestion(
//       question: 'What is the largest country in the world?',
//       answers: ['Russia', 'Canada', 'China', 'USA'],
//       correctAnswerIndex: 2,
//     ),
//      QuizQuestion(
//       question: 'What is the capital of France?',
//       answers: ['London', 'Paris', 'Berlin', 'Madrid'],
//       correctAnswerIndex: 1,
//     ),
//     QuizQuestion(
//       question: 'What is the largest country in the world?',
//       answers: ['Russia', 'Canada', 'China', 'USA'],
//       correctAnswerIndex: 2,
//     ),


//   ];
