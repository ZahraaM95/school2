import 'package:flutter/material.dart';
import 'package:flutter_application_9/controller/home/tab_bar_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_9/generated/l10n.dart';
import 'core/constant/color.dart';
import 'package:flutter_application_9/controller/home/bottom_navigation_con.dart';
import 'package:flutter_application_9/controller/home/home_pinding.dart';
import 'package:flutter_application_9/featuers/auth/view/signup_screen.dart';
import 'package:flutter_application_9/featuers/quiz/finshe_exam.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  Get.lazyPut<ApiService>(() => ApiService());
  Get.lazyPut<ApiService>(() => ApiService());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, _) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          textDirection: TextDirection.rtl,
          locale: const Locale('ar'),
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          theme: ThemeData(
            iconTheme: const IconThemeData(color: AppColor.black),
            backgroundColor: Colors.white,
            fontFamily: 'LamaSans-SemiBold.ttf',
            secondaryHeaderColor: const Color.fromRGBO(142, 142, 142, 1),
            textTheme: const TextTheme(
              titleSmall: TextStyle(
                color: AppColor.grey,
                fontFamily: 'LamaSans-SemiBold.ttf',
              ),
            ),
          ),
          initialRoute: '/',
          defaultTransition: Transition.fade,
          getPages: [
            GetPage(
              name: '/',
              page: () => AuthService().isLoggedIn() ? const BasePage() : const SignUpScreen(),
            ),
            GetPage(
              name: '/signup',
              page: () => const SignUpScreen(),
              binding: SingUpScreenBinding(),
            ),
            GetPage(
              name: '/FinsheExam',
              page: () => FinsheExam(),
            ),
          ],
        );
      },
    );
  }
}

class BasePage extends GetView<HomeController> {
  const BasePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        key: Get.nestedKey(1),
        initialRoute: '/browse',
        onGenerateRoute: controller.onGenerateRoute,
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/svg/home.svg'),
              label: 'الصفحة الرئيسية',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/svg/user2.svg'),
              label: 'الحساب',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/svg/cup.svg'),
              label: 'التصنيف',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/svg/messages-2.svg'),
              label: 'المجتمع',
            ),
          ],
          currentIndex: controller.currentIndex.value,
          selectedItemColor: Colors.pink,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.green,
          onTap: controller.changePage,
        ),
      ),
    );
  }
}

class AuthService {
  bool isLoggedIn() {
    return false; // غيّر إلى true لمحاكاة مستخدم مسجل الدخول
  }
}



