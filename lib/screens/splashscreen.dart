import 'package:flutter/material.dart';

import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:shoes_store/screens/login.dart';

class SplashScreen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EasySplashScreen(
        logo: Image.asset("assets/images/logo.jpg"),
        logoSize: 250,
        durationInSeconds: 3,
        loaderColor: Color.fromARGB(255, 23, 111, 183),
        title: Text(
          "Welcome",
          style:
              TextStyle(fontSize: 30, color: Color.fromARGB(255, 23, 111, 183)),
        ),
        navigator: MyLogin(),
      ),
    );
  }
}
