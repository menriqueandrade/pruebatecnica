
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
                    child: Image.network(
                        'https://static.wixstatic.com/media/98f07d_c433417234e34410a610f561b2f7a511~mv2.png/v1/fill/w_337,h_336,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/AntPack_Logo_White_Transparent.png',
                        fit: BoxFit.fill,
                        width: 200,
                        height: 300),
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
        child: Image.network(
            'https://static6.depositphotos.com/1037473/614/i/600/depositphotos_6149148-stock-photo-plain-pink-background.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity));
  }
}
