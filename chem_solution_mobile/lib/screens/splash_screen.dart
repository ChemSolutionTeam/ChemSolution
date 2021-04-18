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
    with TickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
      vsync: this,
      duration: new Duration(milliseconds: 720),
    );
    animationController.repeat();

    Timer(Duration(milliseconds: 2500), () {
      Navigator.of(context).pushReplacementNamed(widget.nextRoute);
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEBFAFF),
      body: Center(
        child: new AnimatedBuilder(
          animation: animationController,
          child: new Container(
            child: TweenAnimationBuilder<Size>(
              tween: SizeTween(begin: Size(0, 0), end: Size(300, 300)),
              curve: Curves.bounceOut,
              duration: Duration(milliseconds: 2000),
              builder: (BuildContext _, Size size, Widget __) {
                return Image.asset(
                  'assets/images/logo2.png',
                  width: size.width,
                  height: size.height,
                );
              },
              onEnd: () {
                setState(() {
                  animationController.forward();
                  animationController.stop();
                });
              },
            ),
          ),
          builder: (BuildContext context, Widget _widget) {
            return new Transform.rotate(
              angle: animationController.value * math.pi * 2,
              child: _widget,
            );
          },
        ),
      ),
    );
  }
}
