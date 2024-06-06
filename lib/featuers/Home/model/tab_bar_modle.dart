// ignore_for_file: unnecessary_getters_setters, non_constant_identifier_names

class Categoryes {
	List<Categoryes>? _categoryes;

	categoryes({List<Categoryes>? categoryes}) {
if (categoryes != null) {
_categoryes = categoryes;
}
}
	// List<Categoryes>? get categoryes => _categoryes;
	// set categoryes(List<Categoryes>? categoryes) => _categoryes = categoryes;

	Categoryes.fromJson(Map<String, dynamic> json) {
		if (json['categoryes'] != null) {
			_categoryes = <Categoryes>[];
			json['categoryes'].forEach((v) { _categoryes!.add(Categoryes.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		if (_categoryes != null) {
      data['categoryes'] = _categoryes!.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class Categorye {
	String? _sId;
	String? _name;

	Categoryes({String? sId, String? name}) {
if (sId != null) {
_sId = sId;
}
if (name != null) {
_name = name;
}
}

	String? get sId => _sId;
	set sId(String? sId) => _sId = sId;
	String? get name => _name;
	set name(String? name) => _name = name;

	Categorye.fromJson(Map<String, dynamic> json) {
		_sId = json['_id'];
		_name = json['name'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		data['_id'] = _sId;
		data['name'] = _name;
		return data;
	}
}
class Classess {
  List<Clasess>? _clasess;

  Classess({List<Clasess>? clasess}) {
    if (clasess != null) {
      _clasess = clasess;
    }
  }

  List<Clasess>? get clasess => _clasess;
  set clasess(List<Clasess>? clasess) => _clasess = clasess;

  Classess.fromJson(Map<String, dynamic> json) {
    if (json['clasess'] != null) {
      _clasess = <Clasess>[];
      json['clasess'].forEach((v) {
        _clasess!.add(Clasess.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (_clasess != null) {
      data['clasess'] = _clasess!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Clasess {
  String? _sId;
  String? _name;

  Clasess({String? sId, String? name}) {
    if (sId != null) {
      _sId = sId;
    }
    if (name != null) {
      _name = name;
    }
  }

  String? get sId => _sId;
  set sId(String? sId) => _sId = sId;
  String? get name => _name;
  set name(String? name) => _name = name;

  Clasess.fromJson(Map<String, dynamic> json) {
    _sId = json['_id'];
    _name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = _sId;
    data['name'] = _name;
    return data;
  }
}
// class StudyStageModle {
//   String id; 
//   String name;
//  StudyClassModle studyclassModle ;

//   StudyStageModle({required this.id, required this.name, required this.studyclassModle});

//   factory StudyStageModle.fromJson(Map<String, dynamic> json) {
//     return StudyStageModle(
//       // id: json['_id'],
//       // name: json['name'],
//       // classes: [], 
//        id: json['_id'] ?? '', // استخدام قيمة افتراضية إذا كانت `null`
//       name: json['name'] ?? '',
//       studyclassModle: StudyClassModle.fromJson(
//         json['clasess'],

//         ),
//     );
//   }
// }

// class StudyClassModle {
//   String id;
//   String name;
//   List<String> image = [
//     'assets/image/602.png',
//     'assets/image/603.png',
//     'assets/image/605.png',
//     'assets/image/606.png',
//     'assets/image/601.png',
//   ];

//   StudyClassModle({required this.id, required this.name});

//   factory StudyClassModle.fromJson(Map<String, dynamic> json) {
//     return StudyClassModle(
//       id: json['id'],
//       name: json['name'] ?? 'vvvvvvvvvv', // استخدام قيمة افتراضية إذا كانت `null`

//     );
//   }
// }
