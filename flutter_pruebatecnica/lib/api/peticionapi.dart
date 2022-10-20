import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../models/usuarios.dart';
import 'package:flutter/material.dart';


int page = 1;
bool isLoading = false;
bool hasMore = true;

Future<List<Users>> MostrarUser(http.Client cliente) async {
  var url = Uri.parse('https://jsonplaceholder.typicode.com/users');

  final response = await cliente.get(url);
  print('Estado:${response.statusCode}');

  return compute(pasarUser, response.body);
}

List<Users> pasarUser(String respuestaBody) {
  final pasar = json.decode(respuestaBody).cast<Map<String, dynamic>>();

  return pasar.map<Users>((json) => Users.fromJson(json)).toList();
}
