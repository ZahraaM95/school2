
import 'package:flutter_application_9/featuers/quiz/api_qution.dart';
import 'package:flutter_application_9/featuers/quiz/finshe_exam.dart';
import 'package:flutter_application_9/featuers/quiz/quiz.dart';
import 'package:get/get.dart';

class QuizController extends GetxController {
  
  final ApiService apiService;
  QuizController(this.apiService);

  var isLoading = true.obs;
  var quiz = Rxn<Quiz>();
  var currentQuestionIndex = 0.obs;
  var selectedAnswer = (-1).obs;
  var isAnswerCorrect = false.obs;
  var correctAnswersCount = 0.obs;
  var isAnswered = false.obs;

  double get correctAnswersPercentage =>
      correctAnswersCount.value / quiz.value!.questions.length;

  @override
  void onInit() {
    super.onInit();
    fetchQuiz();
  }

  void fetchQuiz() async {
    try {
      isLoading(true);
      quiz.value = await apiService.fetchQuiz();
    } finally {
      isLoading(false);
    }
  }

  void selectAnswer(int index) {
    selectedAnswer(index);
  }

  void confirmAnswer() {
    if (selectedAnswer.value != -1) {
      isAnswered(true);
      isAnswerCorrect(quiz.value!.questions[currentQuestionIndex.value].ans == selectedAnswer.value);
      if (isAnswerCorrect.value) {
        correctAnswersCount++;
      }
    }
  }

  void nextQuestion() {
    if (currentQuestionIndex.value < quiz.value!.questions.length - 1) {
      currentQuestionIndex++;
      selectedAnswer(-1);
      isAnswerCorrect(false);
      isAnswered(false);
    } else {
      // انتهى الاختبار
      // يمكن إضافة منطق للانتقال إلى شاشة النتائج هنا
      Get.off(() => FinsheExam());
    }
  }
}