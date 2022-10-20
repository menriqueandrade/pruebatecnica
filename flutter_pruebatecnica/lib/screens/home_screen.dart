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
                // SizedBox(
                //   height: 30,
                // ),
                // GestionDePagos(),
                // SizedBox(
                //   height: 30,
                // ),
                // ChatHorizontal(),
              ],
            ),
          ),
        )),

        // Container(
        //   width: 280,
        //   height: 280,
        //   decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(50),
        //       color: Colors.lightBlueAccent,
        //       image: DecorationImage(
        //           image: NetworkImage(
        //               'https://www.codigocorrecto.com/wp-content/uploads/2020/11/HTTP-API-1024x536.jpg'),
        //           fit: BoxFit.fill)),
        //   child: Container(
        //     decoration: BoxDecoration(
        //         gradient:
        //             LinearGradient(begin: Alignment.bottomRight, colors: [
        //       Colors.white.withOpacity(.2),
        //       Colors.white12.withOpacity(.1),
        //     ])),
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: <Widget>[
        //         Text(
        //           "Junta Administrativa",
        //           style: TextStyle(
        //               color: Color.fromARGB(255, 0, 0, 0),
        //               fontSize: 25,
        //               fontWeight: FontWeight.bold),
        //         ),
        //         SizedBox(
        //           height: 210,
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
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
          Get.to(() => Lista(),  transition: Transition.zoom);
      },
      child: Container(
        width: double.infinity,
        height: 250,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.lightBlueAccent,
            image: DecorationImage(
                image: NetworkImage(
                    'https://www.elemental.co.za/cms/resources/uploads/blog/86/926f6aaba773.png'),
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
          Get.to(() => Offline(),  transition: Transition.zoom);
      },
      child: Container(
        width: double.infinity,
        height: 250,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.lightBlueAccent,
            image: DecorationImage(
                image: NetworkImage(
                    'https://cdn-icons-png.flaticon.com/512/136/136443.png'),
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
class _backgroundImage extends StatelessWidget {
  const _backgroundImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Image.network(
            'https://static6.depositphotos.com/1037473/614/i/600/depositphotos_6149148-stock-photo-plain-pink-background.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity));
  }
}
