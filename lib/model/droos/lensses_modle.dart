
class Lesson {
  final String id;
  final String title;

  Lesson({required this.id, required this.title});

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      id: json['_id'],
      title: json['name'],
    );
  }
}
