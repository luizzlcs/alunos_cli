import 'dart:convert';

import 'package:alunos_cli/model/products.dart';
import 'package:http/http.dart' as http;

class ProductsRepository {
  Future<Products> findByName(String name) async {
    final url =
        await http.get(Uri.parse('http://localhost:8080/products?name=$name'));

    if (url.statusCode != 200) {
      throw Exception();
    }

    final List<dynamic> response = jsonDecode(url.body);

    if (response.isEmpty) {
      throw Exception('Curso não encontrado');
    }

    return Products.fromMap(response.first);
  }
}
