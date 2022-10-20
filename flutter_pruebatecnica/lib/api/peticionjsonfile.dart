
import 'dart:convert';
import '../models/usuarios.dart';
import 'package:flutter/material.dart';

import 'dart:convert';


import 'package:flutter/services.dart' as rootBundle;



Future<List<Users>> MostrarUserOffline() async {
  final jsondata =
      await rootBundle.rootBundle.loadString('json/datosoffline.json');
  final list = json.decode(jsondata) as List<dynamic>;

  return list.map((e) => Users.fromJson(e)).toList();
}
