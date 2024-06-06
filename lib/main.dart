// ignore_for_file: unused_element
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_9/featuers/auth/view/signup_screen.dart';
import 'package:flutter_application_9/featuers/quiz/api_qution.dart';
import 'package:flutter_application_9/generated/l10n.dart';
import 'package:get/get.dart';
import 'core/constant/color.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_application_9/controller/home/bottom_navigation_con.dart';
import 'package:flutter_application_9/controller/home/home_pinding.dart';
import 'package:flutter_application_9/featuers/quiz/finshe_exam.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  Get.lazyPut<ApiService>(() => ApiService());
  Get.lazyPut<ApiService>(() => ApiService());
  Get.lazyPut<ApiService>(() => ApiService());

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
  
}
  //   late ConnectivityResult _connectivityResult;
  // late StreamSubscription<ConnectivityResult> _subscription;

class _MyAppState extends State<MyApp> {
  final AuthService _authService = AuthService();

  @override
  //   void initState() {
  //   super.initState();
  //   _subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
  //     setState(() {
  //       _connectivityResult = result;
  //     });
  //     if (result == ConnectivityResult.none) {
  //       _showNoInternetDialog();
  //     }
  //   });
  // }
  //  @override
  // void dispose() {
  //   _subscription.cancel();
  //   super.dispose();
  // }
  //  void _showNoInternetDialog() {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: const Text('انقطاع الاتصال بالإنترنت'),
  //         content: const Text('يرجى التحقق من اتصالك بالإنترنت.'),
  //         actions: <Widget>[
  //           TextButton(
  //             child: const Text('موافق'),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

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
          initialRoute: _authService.isLoggedIn() ? '/home' : '/signup',
          defaultTransition: Transition.fade,
          getPages: [
            // GetPage(
            //   name: '/',
            //   page: () => const HomePage(),
            //   binding: HomeBinding(),
            // ),
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


class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
    );
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
              label: 'الصفحه الرئسيه',
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
  // محاكاة التحقق من تسجيل الدخول
  bool isLoggedIn() {
    // استبدل هذا بالتحقق الفعلي من تسجيل الدخول (مثل التحقق من توكن أو جلسة)
    return false; // غيّر إلى true لمحاكاة مستخدم مسجل الدخول
  }
}

// ignore_for_file: deprecated_member_use

// import 'package:flutter/material.dart';
// import 'package:flutter_application_9/featuers/Home/view/home.dart';
// import 'package:flutter_application_9/featuers/auth/view/signup_screen.dart';
// import 'package:flutter_application_9/featuers/quiz/api_qution.dart';
// import 'package:flutter_application_9/featuers/quiz/quiz.dart';
// import 'package:flutter_application_9/generated/l10n.dart';
// import 'package:get/get.dart';
// import 'core/constant/color.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';


// void main() {
//      Get.lazyPut<ApiService>(() => ApiService());
//      Get.lazyPut<ApiService>(() => ApiService());
//   runApp(const MyApp());
// }
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       designSize: const Size(375, 812),
//       minTextAdapt: true,
//       splitScreenMode: true,
//       builder: (context, child) {
        
//         return GetMaterialApp(
//           debugShowCheckedModeBanner: false,
             
//       textDirection: TextDirection.rtl,
//       locale: const Locale('ar'),
//       localizationsDelegates:const [
//                 S.delegate,
//                 GlobalMaterialLocalizations.delegate,
//                 GlobalWidgetsLocalizations.delegate,
//                 GlobalCupertinoLocalizations.delegate,
//             ],
//             supportedLocales: S.delegate.supportedLocales,
           
//       theme: ThemeData(
//         iconTheme:const IconThemeData(
//           color: AppColor.black

//         ),
//          fontFamily:'LamaSans-SemiBold.ttf',
//          secondaryHeaderColor: const Color.fromRGBO(142, 142, 142, 1),
//          textTheme: const TextTheme(
          
//            titleSmall : TextStyle(color: AppColor.grey,
//             fontFamily:'LamaSans-SemiBold.ttf',),
//          ), 
//         backgroundColor: Colors.white, 
//         bottomAppBarTheme: const BottomAppBarTheme(color: Colors.black)
       
//        // visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home:const SignUpScreen(),
//         );
      
       
//       }
//     );
//   }
// }