import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'user_list_screen.dart';
import 'user_offline_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: CircleAvatar(
            radius: 30,
            child: Image.network(
                'https://static.wixstatic.com/media/98f07d_c433417234e34410a610f561b2f7a511~mv2.png/v1/fill/w_337,h_336,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/AntPack_Logo_White_Transparent.png'),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SafeArea(
            child: Container(
          padding: EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _API(),
                SizedBox(
                  height: 30,
                ),
                _JSONFILE(),

              ],
            ),
          ),
        )),
      ),
    );
  }
}

class _API extends StatelessWidget {
  const _API({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => Lista(), transition: Transition.zoom);
      },
      child: Container(
        width: double.infinity,
        height: 215,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Color.fromARGB(218, 204, 12, 12),
            image: DecorationImage(
                image: 
                AssetImage('assets/api.png'),
                fit: BoxFit.fill)),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
            Colors.white.withOpacity(.2),
            Colors.white12.withOpacity(.1),
          ])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 210,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _JSONFILE extends StatelessWidget {
  const _JSONFILE({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => Offline(), transition: Transition.zoom);
         Get.snackbar(
          "No Tienes internet",
          'Aun asi aca estan los datos ',
          icon: Icon(Icons.wifi, color: Colors.red),
          snackPosition: SnackPosition.BOTTOM,
        );
      },
      child: Container(
        width: double.infinity,
        height: 215,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Color.fromARGB(218, 204, 12, 12),
            image: DecorationImage(
                image:  AssetImage('assets/json.png'),
                fit: BoxFit.fill)),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
            Colors.white.withOpacity(.2),
            Colors.white12.withOpacity(.1),
          ])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 210,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

