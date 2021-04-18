import 'package:chem_solution_mobile/screens/home_screen.dart';
import 'package:chem_solution_mobile/screens/splash_screen.dart';
import 'package:flutter/material.dart';

bool autorised = false;

void main() {
  runApp(ChemApp());
}

class ChemApp extends StatelessWidget {

  final routes = <String, WidgetBuilder>{
    '/Home': (BuildContext context) => ChemSolutionWidget()
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChemSolution',
      home: SplashScreen(nextRoute: '/Home'),
      routes: routes,
      theme: ThemeData(
        fontFamily: 'CenturyGothic',
      ),
    );
  }
}
