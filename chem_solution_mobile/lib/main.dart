import 'package:chem_solution_mobile/models/Autorisation.dart';
import 'package:chem_solution_mobile/models/User.dart';
import 'package:chem_solution_mobile/screens/home_screen.dart';
import 'package:chem_solution_mobile/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

bool autorised;
final String chemURL = '192.168.0.103:5001';
final storage = FlutterSecureStorage();
User currentUser;

void main() async {
  try {
    await Autorisation.setUser();
    autorised = true;
  } on Exception catch (ex) {
    print(ex);
    autorised = false;
  }

  print(autorised);
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
