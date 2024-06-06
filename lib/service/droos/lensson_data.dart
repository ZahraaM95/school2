

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_application_9/model/droos/lensses_modle.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'http://153.92.222.153:200/subjects?classID=6654c53fa58d01de7bd93f46&userID=664b503ead1feaf5b6bc491f',
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    },
  ));

  Future<List<Lesson>> fetchLessons(String classId, String userId) async {
  try {
    final response = await _dio.get('/subjects', queryParameters: {
      'classID': classId,
      'userID': userId, // إضافة id_user كمعامل إضافي
    });
    print(response.data);
    List<dynamic> data = response.data['subjects'];
    return data.map((json) => Lesson.fromJson(json)).toList();
  } catch (error) {
    throw Exception('Failed to load subjects: $error');
  }
  
}

}


// import 'package:dio/dio.dart';
// import 'package:flutter_application_9/model/droos/lensses_modle.dart';

// class ApiService {
//   final Dio _dio = Dio(BaseOptions(
//     baseUrl: 'http://153.92.222.153:200/subjects?classID=6654c53fa58d01de7bd93f46',
//     headers: {
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//   ));

//   Future<List<Lesson>> fetchLessons(String classId) async {
    
//     try {
//       final response = await _dio.get('/subjects', queryParameters: {
//         'classID': classId,
//       });
//       // print( response.data);
//       List<dynamic> data = response.data['subjects'];
//             print( response.data);

//       return data.map((json) => Lesson.fromJson(json)).toList();
//     } catch (error) {
//       throw Exception('Failed to load subjects: $error');
//     }
//   }
// }
