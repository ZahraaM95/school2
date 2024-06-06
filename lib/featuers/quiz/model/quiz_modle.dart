class Question {
  final bool isTF;
  final String title;
  final String wantEN;
  final String wantAR;
  final List<String> answers;
  final int ans;

  Question({
    required this.isTF,
    required this.title,
    required this.wantEN,
    required this.wantAR,
    required this.answers,
    required this.ans,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      isTF: json['isTF'],
      title: json['title'],
      wantEN: json['want-EN'],
      wantAR: json['want-AR'],
      answers: List<String>.from(json['answers']),
      ans: json['ans'],
    );
  }
}

class Quiz {
  final String id;
  final List<Question> questions;

  Quiz({
    required this.id,
    required this.questions,
  });

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
      id: json['_id'],
      questions: List<Question>.from(json['questions'].map((q) => Question.fromJson(q))),
    );
  }
}

// import 'package:flutter/material.dart';
// class Question {
//   final String question;
//   final List<String> options;
//   final int correctAnswerIndex;

//   Question({
//     required this.question,
//     required this.options,
//     required this.correctAnswerIndex,
//   });
// }
// class QuizQuestion {
//   final String question;
//   final List<String> answers;
//   final int correctAnswerIndex;
//   Color backgroundColor =  Colors.white ;

//   QuizQuestion({
//     required this.question,
//     required this.answers,
//     required this.correctAnswerIndex,
//   });

//   factory QuizQuestion.fromJson(Map<String, dynamic> json) {
//     return QuizQuestion(
//       question: json['question'],
//       answers: json['answers'].cast<String>(),
//       correctAnswerIndex: json['correct_answer_index'],
//     );
//   }
// }