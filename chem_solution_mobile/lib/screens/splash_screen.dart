import 'dart:async';
import 'dart:core';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
  final String nextRoute;
  SplashScreen({this.nextRoute});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 2000), () {
      Navigator.of(context).pushReplacementNamed(widget.nextRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEBFAFF),
      body: Center(
        child: TweenAnimationBuilder<Size>(
          tween: SizeTween(begin: Size(0, 0), end: Size(400, 400)),
          curve: Curves.bounceOut,
          duration: Duration(milliseconds: 1000),
          builder: (BuildContext _, Size size, Widget __) {
            return Image.asset(
              'assets/images/logo2.png',
              width: size.width,
              height: size.height,
            );
          },
        ),
      ),
    );
  }
}
