import 'package:flutter/material.dart';
import 'package:flutter_application_9/featuers/Home/view/exam.dart';
import 'package:get/get.dart';
import 'package:flutter_application_9/controller/auth/login_controller.dart';
import 'package:flutter_application_9/controller/droos/lessons_con.dart';
import 'package:flutter_application_9/model/Home/tab_bar_model.dart';

class LessonsView extends StatelessWidget {
  final Class classItem;

  const LessonsView({super.key, required this.classItem});

  @override
  Widget build(BuildContext context) {
    final LessonsController controller = Get.put(LessonsController());
    final LoginController loginController = Get.put(LoginController());

    String userId = loginController.userID.toString();
    controller.fetchLessons(classItem.id, userId);

    return Scaffold(
      appBar: AppBar(
        title: Text('دروس ${classItem.name}'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoadingLessons.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return GridView.builder(
            padding: const EdgeInsets.all(10.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // عدد الأعمدة
              mainAxisSpacing: 10.0, // المسافة الرأسية بين الصفوف
              crossAxisSpacing: 10.0, // المسافة الأفقية بين الأعمدة
              childAspectRatio: 1.5, // نسبة العرض إلى الارتفاع لكل عنصر
            ),
            itemCount: controller.lessons.length,
            itemBuilder: (context, index) {
              final lesson = controller.lessons[index];
              final imagePaths = _getImagesForClasses(controller.selectedCategoryId.value);

              return GestureDetector(
                onTap: () {
                  Get.to(()=> ChooseLesson(lessonId: lesson.id, ));
                 
                },
                child: Container(
                  width: 150,
                  height: 125,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imagePaths[index]), 
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: Text(
                      lesson.title,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }

  List<String> _getImagesForClasses(String? categoryId) {
    switch (categoryId) {
      case '664b5b4fad1feaf5b6bc4921':
        return [
          'assets/droos/Frame 18.png',
          'assets/droos/Frame 26.png',
          'assets/droos/Frame 27.png',
          'assets/droos/Frame 29.png',
          'assets/droos/Frame 30.png',
          'assets/droos/Frame 31.png',
        ]; // مجموعة صور للابتدائية
      case '6654c295a58d01de7bd93f45':
        return [
          'assets/droos/Frame 18.png',
          'assets/droos/Frame 26.png',
          'assets/droos/Frame 27.png',
          'assets/droos/Frame 29.png',
          'assets/droos/Frame 30.png',
          'assets/droos/Frame 31.png',
        ]; // مجموعة صور للإعدادية
      case '6654c2a57b2d0e0af3a0efd9':
        return [
          'assets/droos/Frame 18.png',
          'assets/droos/Frame 26.png',
          'assets/droos/Frame 27.png',
          'assets/droos/Frame 29.png',
          'assets/droos/Frame 30.png',
          'assets/droos/Frame 31.png',
        ]; // مجموعة صور للمتوسطة
      default:
        return [
          'assets/droos/Frame 18.png',
          'assets/droos/Frame 26.png',
          'assets/droos/Frame 27.png',
          'assets/droos/Frame 29.png',
          'assets/droos/Frame 30.png',
          'assets/droos/Frame 31.png',
        ]; // مجموعة صور افتراضية
    }
  }
}
