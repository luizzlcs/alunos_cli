import 'dart:convert';
import 'package:alunos_cli/model/address.dart';
import 'package:alunos_cli/model/courses.dart';

class Students {
  final int id;
  final String name;
  final int? age;
  final List<String> nameCourses;
  final List<Courses> courses;
  final Address address;

  Students({
    required this.id,
    required this.name,
    this.age,
    required this.nameCourses,
    required this.courses,
    required this.address,
  });

  Map<String, dynamic> toMap() {
    final map = {
      'id': id,
      'name': name,
      'age': age,
      'nameCourses': nameCourses,
      'courses': courses.map((mapCourse) => mapCourse.toMap()).toList(),
      'address': address.toMap(),
    };

    if (age != null) {
      map['age'] = age;
    }

    return map;
  }

  String toJson() => jsonEncode(toMap());

  factory Students.fromMap(Map<String, dynamic> map) {
    return Students(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      age: map['age'],
      nameCourses: List<String>.from(map['nameCourses'] ?? <String, dynamic>{}),
      courses: map['courses']
              ?.map<Courses>((course) => Courses.fromMap(course))
              .toList() ??
          <Courses>[],
      address: Address.fromMap(map['address'] ?? <String, dynamic>{}),
    );
  }

  factory Students.fromJson(String json) => Students.fromMap(jsonDecode(json));

  @override
  String toString() {
    return '''
       Nome: $name
       Idade: $age    
     ''';
  }
}
