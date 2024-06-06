

class Category {
  final String id;
  final String name;

  Category({required this.id, required this.name});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['_id'],
      name: json['name'],
    );
  }
}

class Class {
  final String id;
  final String name;

  Class({required this.id, required this.name});

  factory Class.fromJson(Map<String, dynamic> json) {
    return Class(
      id: json['_id'],
      name: json['name'],
    );
  }
}