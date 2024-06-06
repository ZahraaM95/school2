

import 'package:flutter_application_9/model/droos/lensses_modle.dart';
import 'package:flutter_application_9/service/droos/lensson_data.dart';
import 'package:get/get.dart';

class LessonsController extends GetxController {
  final ApiService apiService = ApiService();
  var lessons = <Lesson>[].obs;
  var isLoadingLessons = true.obs;
  var selectedCategoryId = ''.obs;


  void fetchLessons(String classId , String userId) async {
    try {
      lessons.value = await apiService.fetchLessons(classId,userId);
    } catch (error) {
      Get.snackbar('Error', 'Failed to load lessons: $error');
    } finally {
      isLoadingLessons.value = false;
    }
  }
}

//

// import 'package:flutter_application_9/model/droos/lensses_modle.dart';
// import 'package:flutter_application_9/service/droos/lensson_data.dart';
// import 'package:get/get.dart';

// class LessonsController extends GetxController {
//   final ApiService apiService = ApiService();
//   var lessons = <Lesson>[].obs;
//   var isLoadingLessons = true.obs;
//   var selectedCategoryId = ''.obs;


//   void fetchLessons(String classId, String userId) async {
//     try {
//       lessons.value = await apiService.fetchLessons(classId,userId);
//     } catch (error) {
//       Get.snackbar('Error', 'Failed to load lessons: $error');
//     } finally {
//       isLoadingLessons.value = false;
//     }
//   }
// }