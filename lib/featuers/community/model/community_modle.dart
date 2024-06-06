class CommentModel {
  final String id;
  final String name;
  final String subject;
  final String text;
  final DateTime time;

  CommentModel({
    required this.id,
    required this.name,
    required this.subject,
    required this.text,
    required this.time,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json['id'],
      name: json['name'],
      subject: json['subject'],
      text: json['text'],
      time: DateTime.parse(json['time']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'subject': subject,
      'text': text,
      'time': time.toIso8601String(),
    };
  }
}