import 'package:dio/dio.dart';
import 'package:flutter_application_9/model/Home/tab_bar_model.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'http://153.92.222.153:200/classes',
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    },
  ));

  Future<List<Category>> fetchCategories() async {
    try {
      final response = await _dio.get('/categoryes');
      List<dynamic> data = response.data['categoryes'];
      return data.map((json) => Category.fromJson(json)).toList();
    } catch (error) {
      throw Exception('خطأ في تحميل: $error');
    }
  }

  Future<List<Class>> fetchClasses(String categoryId) async {
    try {
      final response = await _dio.get('/?categoryID=$categoryId', queryParameters: {
        'categoryId': categoryId,
      });
      List<dynamic> data = response.data['clasess'];
      return data.map((json) => Class.fromJson(json)).toList();
    } catch (error) {
      throw Exception('خطأ في التحميل: $error');
    }
  }
}
