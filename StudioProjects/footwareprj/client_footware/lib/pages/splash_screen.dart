import 'package:flutter/material.dart';


import 'dart:async';

import 'login_page.dart';


class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Login_Page()));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body:
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/shoe.jpg"),
              //fit: BoxFit.cover,

            ),
          ),

        )
    );
  }
}




