
import 'package:flutter/material.dart';
import 'package:flutter_pruebatecnica/screens/home_screen.dart';
import 'package:flutter_pruebatecnica/screens/user_list_screen.dart';

import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  static Widget create(BuildContext context) => SplashScreen();

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
        const Duration(milliseconds: 4000), () => Get.to(() => HomeScreen()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      
      children: [
        _backgroundImage(),
        Stack(children: [
          Column(
            children: <Widget>[
              Spacer(),
              AnimatedContainer(
                curve: Curves.bounceIn,
                duration: Duration(milliseconds: 200),
                child: Center(
                  child: FractionallySizedBox(
                    widthFactor: .6,
                    child: Image.asset('assets/logo.png')
                  ),
                ),
              ),
              CircularProgressIndicator(
                color: Colors.white,
              ),
              
              SizedBox(
                height: 100,
              ),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ])
      ],
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
         child: Image.asset('assets/fondo.jpg',
         fit: BoxFit.cover,
         width: double.infinity,
         height: double.infinity
         ));

        
  }
}
