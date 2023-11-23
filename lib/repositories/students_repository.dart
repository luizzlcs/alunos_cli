import 'dart:convert';

import 'package:alunos_cli/model/students.dart';
import 'package:http/http.dart' as http;

class StudentsRepository {
  Future<List<Students>> findAll() async {
    final url = await http.get(Uri.parse('http://localhost:8080/students'));
    if (url.statusCode != 200) {
      throw Exception();
    }

    final List<dynamic> response = jsonDecode(url.body);

    if (response.isEmpty) {
      throw Exception('Alunos não encontrados');
    }

    return response
        .map<Students>((students) => Students.fromMap(students))
        .toList();
  }

  Future<Students> findById(int id) async {
    final url =
        await http.get(Uri.parse('http://localhost:8080/students?id=$id'));

    if (url.statusCode != 200) {
      throw Exception();
    }

    if (url.body == '{}') {
      throw Exception();
    }

    return Students.fromJson(url.body);
  }

  Future<void> insert(Students students) async {
    final url = await http.post(
      Uri.parse('http://localhost:8080/students'),
      body: students.toJson(),
      headers: {'content-type': 'application/json'},
    );
    if(url.statusCode !=200){
      throw Exception();
    }
  }
}
