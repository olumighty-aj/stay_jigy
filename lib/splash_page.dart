import 'package:flutter/material.dart';
import 'package:stay_jigy/shared/color.dart';
import 'dart:async';

import 'package:stay_jigy/shared/route.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool _navigated = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_navigated) {
      _navigated = true;
      Timer(const Duration(seconds: 3), () {
        _navigateToBottomNavBar();
      });
    }
  }

  void  _navigateToBottomNavBar(){
    try {
      Navigator.of(context).pushNamedAndRemoveUntil(
        '/BottomNavBar',
        (route) => false,
        arguments: ScreenArguments(0, false), 
      );
    } catch (e) {
      print("Navigation error: $e");
    }
   }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[blue, darkBlue],
            ),
            boxShadow: [
              BoxShadow(
                color: blueShadow,
                offset: Offset(0, 10),
                spreadRadius: 2,
                blurRadius: 20.0,
              )
            ],
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/Logo.png'),
            ),
          ),
        ),
      ),
    );
  }
}
