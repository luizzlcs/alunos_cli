import 'package:alunos_cli/repositories/students_repository.dart';

Future<void> main() async {
  final students = StudentsRepository();

  print( await students.findAll());
}