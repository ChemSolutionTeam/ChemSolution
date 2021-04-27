import 'package:chem_solution_mobile/models/BlogPost.dart';
import 'package:chem_solution_mobile/screens/home_screen.dart';
import 'package:chem_solution_mobile/screens/splash_screen.dart';
import 'package:flutter/material.dart';

bool autorised = false;
final String chemURL = '192.168.0.103:5001';
List<BlogPost> allPosts;

void main() async {
  allPosts = await BlogPost.fetchObjects(path: 'BlogPosts');
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
