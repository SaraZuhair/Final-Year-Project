import 'dart:async';

import 'package:flutter/material.dart';

import 'login_screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 5),
          () => Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => const LoginScreen())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Center(

       child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,

          decoration: const BoxDecoration(
           color: Color(0xffFCB234),
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/logo.png",
              height: 300,
              width: 300,),

              const Text(
                "Smart Kitchen",

                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        )

   
    )
    );
  }
}