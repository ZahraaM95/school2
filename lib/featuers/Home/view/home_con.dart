import 'package:flutter_application_9/featuers/Home/model/classes_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeController extends GetxController {
  var isLoading = true.obs;
  var classes = <StageModel>[].obs;

  @override
  void onInit() {
    fetchClasses();
    super.onInit();
  }

  void fetchClasses() async {
    try {
      isLoading(true);
      var response = await http.get(Uri.parse('http://153.92.222.153:200/classes?categoryID=664b5b4fad1feaf5b6bc4921'));
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        var classList = jsonResponse.map<StageModel>((json) => StageModel.fromJson(json)).toList();
        classes.value = classList;
      } else {
        // Handle error
        Get.snackbar('Error', 'Failed to fetch data');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch data');
    } finally {
      isLoading(false);
    }
  }
}


// import 'package:flutter_application_9/featuers/Home/model/classes_model.dart';


// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class HomeController extends GetxController {
//   var isLoading = true.obs;
//   var classes = <StageModel>[].obs;

//   @override
//   void onInit() {
//     fetchClasses();
//     super.onInit();
//   }

//   void fetchClasses() async {
//     try {
//       isLoading(true);
//       var response = await http.get(Uri.parse('http://153.92.222.153:200/classes?categoryID=664b5b4fad1feaf5b6bc4921'));
//       if (response.statusCode == 200) {
//         var jsonResponse = json.decode(response.body);
//         var classList = jsonResponse.map<StageModel>((json) => StageModel.fromJson(json)).toList();
//         classes.value = classList;
//       } else {
//         // Handle error
//         Get.snackbar('Error', 'Failed to fetch data');
//       }
//     } catch (e) {
//       Get.snackbar('Error', 'Failed to fetch data');
//     } finally {
//       isLoading(false);
//     }
//   }
// }
