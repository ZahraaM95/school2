import 'package:dio/dio.dart';
import 'package:flutter_application_9/featuers/quiz/quiz.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'http://153.92.222.153:200/',
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    },
  ));

  Future<Quiz> fetchQuiz() async {
    try {
      final response = await _dio.get('exam/single?id=66507e8aab941e1afc1da21a');
      return Quiz.fromJson(response.data);
    } catch (error) {
      throw Exception('Failed to load quiz: $error');
    }
  }
}
