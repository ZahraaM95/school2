// ignore_for_file: avoid_print, no_leading_underscores_for_local_identifiers, non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:get/get.dart';

class StudyStageModle {
  String id; 
  String name;
  List<StudyClassModle> classes = [ ];

  StudyStageModle({required this.id, required this.name, required this.classes});

  factory StudyStageModle.fromJson(Map<String, dynamic> json) {
    return StudyStageModle(
      // id: json['_id'],
      // name: json['name'],
      // classes: [], 
       id: json['_id'] ?? '', // استخدام قيمة افتراضية إذا كانت `null`
      name: json['name'] ?? '', // استخدام قيمة افتراضية إذا كانت `null`
      classes: json['classes'] != null
          ? List<StudyClassModle>.from(json['classes'].map((x) => StudyClassModle.fromJson(x)))
          : [], // استخدام قائمة فارغة إذا كانت `null` // Initialize with an empty list since there's no 'classes' in the initial JSON structure
    );
  }
}

class StudyClassModle {
  int id;
  String name;
  List<String> image = [
    'assets/image/602.png',
    'assets/image/603.png',
    'assets/image/605.png',
    'assets/image/606.png',
    'assets/image/601.png',
  ];

  StudyClassModle({required this.id, required this.name});

  factory StudyClassModle.fromJson(Map<String, dynamic> json) {
    return StudyClassModle(
      id: json['id'],
      name: json['name'] ?? '', // استخدام قيمة افتراضية إذا كانت `null`

    );
  }
}

class StudyStageController extends GetxController {
  var studyStages = <StudyStageModle>[].obs;
  var isLoading = true.obs;
 var studyStage = StudyStageModle(
    id: '664b5b4fad1feaf5b6bc4921',
    name: 'Study Stage',
    classes: [],
  ).obs;

  @override
  void onInit() {
    fetchStudyStages();

    super.onInit();
  }
 Future<void> fetchStudyStages() async {
  
   final Dio _dio = Dio();
    try {
      final response = await _dio.get(
        'http://153.92.222.153:200/classes/categoryes',
        // queryParameters: {'categoryID': categoryId},
      );

      if (response.statusCode == 200) {
        // var jsonResponse = StudyStageModle.fromJson(response.data);
          var jsonResponse = response.data;
      print('JSON Response: $jsonResponse');

      if (jsonResponse['categoryes'] != null && jsonResponse['categoryes'] is List) {
        var categories = jsonResponse['categoryes'] as List;
        print('Categories: $categories');
        var stages = categories.map((data) => StudyStageModle.fromJson(data)).toList();
        print('Stages: $stages');
        studyStages.assignAll(stages);
      } else {
        print("Error: 'categoryes' field is either null or not a List");
      }
    } else {
      print("Error: ${response.statusCode}");
    }
  } catch (e) {
    print("Exception: $e");
  } finally {
    isLoading(false);
  }
  }
  
  // Future<void> fetchClasses() async {
  //   try {
  //     isLoading(true);
  //     var fetchedData = await _apiService.fetchClasses('664b5b4fad1feaf5b6bc4921');
  //     studyStage(fetchedData);
  //   } catch (e) {
  //     print("Exception: $e");
  //   } finally {
  //     isLoading(false);
  //   }
  // }
}

class ApiService {
  final Dio _dio = Dio();

  Future<StudyStageModle> fetchClasses(String categoryId) async {
    try {
      final response = await _dio.get(
        'http://153.92.222.153:200/classes?categoryID=664b5b4fad1feaf5b6bc4921',
        queryParameters: {'categoryID': categoryId},
      );
      if (response.data is List) {
        var Classess = response.data as List;
        print('Categories: $Classess');
        var stages = Classess.map((data) => StudyStageModle.fromJson(data)).toList();
        print('Stages: $stages');

      
      } else {
        print("Error: 'categoryes' field is either null or not a List");
      } return StudyStageModle.fromJson(response.data);

    //   if (response.statusCode == 200) {
    //     return StudyStageModle.fromJson(response.data);
    //   } else {
    //     throw Exception('Failed to load classes');
    //   }
    } catch (e) {
      throw Exception('Failed to load classes: $e');
    }
  }
}

//  Future<void> fetchStudyStages() async {
//   try {
//     isLoading(true);
//     final response = await http.get(
//       Uri.parse('http://153.92.222.153:200/classes/categoryes'),
//       headers: {
//         'Accept': 'application/json',
//         'Content-Type': 'application/json'
        
//       },
//     );

//     if (response.statusCode == 200) {
//      var jsonResponse = json.decode(response.body);
//       print('JSON Response: $jsonResponse');

//       if (jsonResponse['categoryes'] != null && jsonResponse['categoryes'] is List) {
//         var categories = jsonResponse['categoryes'] as List;
//         print('Categories: $categories');
//         var stages = categories.map((data) => StudyStageModle.fromJson(data)).toList();
//         print('Stages: $stages');
//         studyStages.assignAll(stages);
//       } else {
//         print("Error: 'categoryes' field is either null or not a List");
//       }
//     } else {
//       print("Error: ${response.statusCode}");
//     }
//   } catch (e) {
//     print("Exception: $e");
//   } finally {
//     isLoading(false);
//   }
// }

// }


class ClassesController extends GetxController {
  var studyStages = <StudyStageModle>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
     fetchClasses();

    super.onInit();
  }
 Future<void> fetchClasses() async {
  try {
    isLoading(true);
     final Dio _dio = Dio();
    
      final response = await _dio.get(
        'http://153.92.222.153:200/classes?categoryID=',
        queryParameters: {'categoryID': '664b5b4fad1feaf5b6bc4921'},
      );
         if (response.statusCode == 200) {
        // var jsonResponse = StudyStageModle.fromJson(response.data);
          var jsonResponse = response.data;
      print('JSON Response: $jsonResponse');

      if (jsonResponse['categoryes'] != null && jsonResponse['categoryes'] is List) {
        var categories = jsonResponse['categoryes'] as List;
        print('Categories: $categories');
        var stages = categories.map((data) => StudyStageModle.fromJson(data)).toList();
        print('Stages: $stages');
        studyStages.assignAll(stages);
      } else {
        print("Error: 'categoryes' field is either null or not a List");
      }
    } else {
      print("Error: ${response.statusCode}");
    }
  } catch (e) {
    print("Exception: $e");
  } finally {
    isLoading(false);
  }
  }
        // queryParameters: {'categoryID': categoryId},
      
    // final response = await http.get(
    //   Uri.parse('http://153.92.222.153:200/classes?categoryID=664b5b4fad1feaf5b6bc4921'),
    //   headers: {
    //     'Content-Type': 'application/json; charset=UTF-8',
        
    //   },
    // );

//     if (response.statusCode == 200) {
//       var jsonResponse =  json.decode(response.body);
//       print('JSON Response: $jsonResponse');

//       if (jsonResponse['clasess'] != null && jsonResponse['clasess'] is List) {
//         var classes = jsonResponse['clasess'] as List;
//         print('clasess: $classes');
//         var myclass = classes.map((data) => StudyStageModle.fromJson(data)).toList();
//         print('clasess: $myclass');
//         studyStages.assignAll(myclass);
//       } else {
//         print("Error: 'categoryes' field is either null or not a List");
//       }
//     } else {
//       print("Error: ${response.statusCode}");
//     }
//   } catch (e) {
//     print("Exception: $e");
//   } finally {
//     isLoading(false);
//   }
// }

}



// class Class {
//   String id;
//   String name;
//   List<String> image;

//   Class({required this.name, required this.image, required this.id});

//   factory Class.fromJson(Map<String, dynamic> json) {
//     return Class(
//       id: json['id'],
//       name: json['clasess'],
//       image: List<String>.from(json['image']),
//     );
//   }
// }


