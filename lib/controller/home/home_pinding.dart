
import 'package:flutter_application_9/controller/home/bottom_navigation_con.dart';
import 'package:get/get.dart';

class BrowseController extends GetxController {
  final title = 'Browser'.obs;
}

class ProfileController extends GetxController {
  final title = 'History'.obs;
}

class ClassifiedController extends GetxController {
  final title = 'Classified'.obs;
}
class CommunityController extends GetxController {
  final title = 'Community'.obs;
}
class SingUpScreenController extends GetxController {
  final title = 'SingUpScreen'.obs;
}

class BrowseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BrowseController());
  }
}

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
  }
}

class ClassifiedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CommunityController());
  }
}
class CommunityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CommunityController());
  }
}

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}

class SingUpScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}

class TabBarViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}