import 'package:flutter/material.dart';
import 'package:flutter_pruebatecnica/screens/user_list_screen.dart';
import 'package:get/get.dart';

import 'screens/home_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/user_offline_screen.dart';



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CRUD HTTP API REST',
      theme: ThemeData(primarySwatch: Colors.brown),
      home: SplashScreen(),
    );
  }
}