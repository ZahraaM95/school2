
import 'package:flutter/material.dart';
import 'package:flutter_application_9/controller/home/home_pinding.dart';
import 'package:flutter_application_9/featuers/Home/profile.dart';
import 'package:flutter_application_9/featuers/Home/view/home.dart';
import 'package:flutter_application_9/featuers/classified/classified_home.dart';
import 'package:flutter_application_9/featuers/community/community_home.dart';
import 'package:get/get.dart';


class HomeController extends GetxController {
  static HomeController get to => Get.find();

  var currentIndex = 0.obs;

  final pages = <String>['/browse', '/Profile', '/Classified', '/Community','/SingUpScreen','home'];

  void changePage(int index) {
    currentIndex.value = index;
    Get.toNamed(pages[index], id: 1);
  }

  Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == '/home') {
      return GetPageRoute(
        settings: settings,
        page: () =>  const BrowsePage(),
        binding: BrowseBinding(),
      );
    }

    if (settings.name == '/Profile') {
      return GetPageRoute(
        settings: settings,
        page: () => const Profile(),
        binding: ProfileBinding(),
      );
    }

    if (settings.name == '/Classified') {
      return GetPageRoute(
        settings: settings,
        page: () => const Classified(),
        binding: CommunityBinding(),
      );
    }
    if (settings.name == '/Community') {
      return GetPageRoute(
        settings: settings,
        page: () =>  Community(),
        binding: CommunityBinding(),
      );
    }
    if (settings.name == '/SingUpScreen') {
      return GetPageRoute(
        settings: settings,
        page: () =>  Community(),
        binding: SingUpScreenBinding(),
      );
    }
    if (settings.name == '/TabBarView') {
      return GetPageRoute(
        settings: settings,
        page: () =>  Community(),
        binding: SingUpScreenBinding(),
      );
    }
    return null;
  }
}

