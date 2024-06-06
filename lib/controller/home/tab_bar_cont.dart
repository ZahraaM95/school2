import 'package:flutter_application_9/data/home/tab_bar_data.dart';
import 'package:flutter_application_9/model/Home/tab_bar_model.dart';
import 'package:get/get.dart';

class TabBarController extends GetxController {
  final ApiService apiService = ApiService();
  var categories = <Category>[].obs;
  var classes = <Class>[].obs;
  var isLoadingCategories = true.obs;
  var isLoadingClasses = false.obs;
  var selectedCategoryId = ''.obs;
     final RxBool isSelected = false.obs;


  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }
   

   
  void fetchCategories() async {
    try {
      categories.value = await apiService.fetchCategories();
    } catch (error) {
      Get.snackbar('Error', 'Failed to load categories: $error');
    } finally {
      isLoadingCategories.value = false;
    }
  }

  void fetchClasses(String categoryId) async {
    try {
      isLoadingClasses.value = true;
      selectedCategoryId.value = categoryId;
      classes.value = await apiService.fetchClasses(categoryId);
    } catch (error) {
      Get.snackbar('Error', 'Failed to load classes: $error');
    } finally {
      isLoadingClasses.value = false;
    }
  }

  
}
