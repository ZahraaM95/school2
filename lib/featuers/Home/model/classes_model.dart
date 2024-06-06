class StageModel {
  final int id;
  final String name;
  final List<ClassModel> classes;

  StageModel({
    required this.id,
    required this.name,
    required this.classes,
  });

  static fromJson(json) {}
}
class ClassModel {
  final int id;
  final String name;
  final String image;

  ClassModel({
    required this.id,
    required this.name,
    required this.image,
  });
}



// class ClassesModel {
//   final String name;
//   final bool login;
//   final bool isSelected;
//   final String backImage;
//   final List<String> image;
//   final int id;

//   ClassesModel({
//     required this.name,
//     required this.login,
//     required this.isSelected,
//     required this.backImage,
//     required this.image,
//     required this.id,
//   });

//   factory ClassesModel.fromJson(Map<String, dynamic> json) {
//     return ClassesModel(
//       name: json['name'],
//       login: json['login'],
//       isSelected: json['isSelected'],
//       backImage: json['backImage'],
//       image: List<String>.from(json['image']),
//       id: json['id'],
//     );
//   }
// }
