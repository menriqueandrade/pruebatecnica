import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_pruebatecnica/models/usuarios.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../api/peticionapi.dart';

import 'dart:convert';

class Lista extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final title;
  const MyHomePage({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("Lista de Usuarios API" ,style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Color.fromARGB(0, 134, 37, 137),
        elevation: 5,
      ),
      body: FutureBuilder<List<Users>>(
        future: MostrarUser(http.Client()),
        builder: (BuildContext context, AsyncSnapshot snapshop) {
          if (snapshop.hasError) print(snapshop.error);
          return snapshop.data != null
              ? UserList(usuarios: snapshop.data)
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class UserList extends StatefulWidget {
  final List<Users> usuarios;
  final data_user;

  UserList({Key? key, this.data_user, required this.usuarios})
      : super(key: key);

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  final ScrollController _scrollController = ScrollController();
  late final List<Users> usuarios;

  bool loading = false, allLoaded = false;
  mockFetch() async {
    if (allLoaded) {
      return;
    }
    setState(() {
      loading = true;
    });
    await Future.delayed(Duration(milliseconds: 800));
    List<String> nuevaData = usuarios.length >= 5
        ? []
        : List.generate(5, (index) => "Lista User ${usuarios.length + index}");
    if (nuevaData.isNotEmpty) {
      usuarios
          .addAll(nuevaData.map<Users>((e) => Users.fromJson(jsonDecode(e))));
    }
    setState(() {
      loading = false;
      allLoaded = nuevaData.isEmpty;
    });
  }

  @override
  void initState() {
    usuarios = widget.usuarios;
    // TODO: implement initState
    super.initState();
    mockFetch();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent) {
          Get.snackbar(
          "No hay mas usuarios",
          'llegaste muy abajo :D',
          icon: Icon(Icons.error, color: Colors.red),
          snackPosition: SnackPosition.BOTTOM,
        );
        print("Nueva informacion");
        mockFetch();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ListView.builder(
          controller: _scrollController,
          itemCount: widget.usuarios.length,
          itemBuilder: (context, index) {
            return Container(
              height: 200,
              width: 200,
              child: Card(shadowColor: Color.fromARGB(255, 255, 64, 217),
                          elevation: 10,
                child: Column(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      child: Image.asset('assets/user.png'),
                    ),
                    Text(
                      widget.usuarios[index].name,
                      style: TextStyle(
                          fontSize: 25, color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    Text('Correo: ' + widget.usuarios[index].email,
                        style: TextStyle(
                            fontSize: 15, color: Color.fromARGB(255, 0, 0, 0))),
                    Text(
                      'Ciudad: ' + widget.usuarios[index].address.city,
                    ),
                    Text(
                      'Compañia: ' + widget.usuarios[index].company.name,
                    ),
                  ],
                ),
              ),
            );
          }),
      if (loading) ...[
        Positioned(
          width: 50,
          height: 50,
          left: 180,
          bottom: 0,
          child: CircularProgressIndicator(),
        ),
      ],
    ]);
  }
}
