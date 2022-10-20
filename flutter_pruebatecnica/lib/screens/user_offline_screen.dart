import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pruebatecnica/models/usuarios.dart';
import 'package:flutter/services.dart' as rootBundle;

import '../api/peticionjsonfile.dart';

class Offline extends StatefulWidget {
  @override
  State<Offline> createState() => _OfflineState();
}

class _OfflineState extends State<Offline> {
  late final List<Users> usuarios;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(
            "Lista de Usuarios JSON File",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Color.fromARGB(0, 134, 37, 137),
          elevation: 5,
        ),
        body: FutureBuilder(
            future: MostrarUserOffline(),
            builder: ((context, data) {
              if (data.hasError) {
                return Text("${data.error}");
              } else if (data.hasData) {
                var items = data.data as List<Users>;
                return ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 200,
                        width: 200,
                        child: Card(
                          shadowColor: Color.fromARGB(255, 255, 64, 217),
                          elevation: 10,
                          child: Column(
                            children: [
                              Container(
                                  height: 80,
                                  width: 60,
                                  child: CircleAvatar(
                                    radius: 20,
                                    child: Text(items[index]
                                        .name
                                        .substring(0, 1)
                                        .toUpperCase()),
                                  )),
                              Text(
                                items[index].name,
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Color.fromARGB(255, 0, 0, 0)),
                              ),
                              Text('Correo: ' + items[index].email,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 0, 0, 0))),
                              Text(
                                'Ciudad: ' + items[index].address.city,
                              ),
                              Text(
                                'Compañia: ' + items[index].company.name,
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            })),
      ),
    );
  }
}
