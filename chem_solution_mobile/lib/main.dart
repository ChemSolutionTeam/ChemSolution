import 'package:chem_solution_mobile/models/Autorisation.dart';
import 'package:chem_solution_mobile/models/BlogPost.dart';
import 'package:chem_solution_mobile/models/User.dart';
import 'package:chem_solution_mobile/screens/home_screen.dart';
import 'package:chem_solution_mobile/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:chem_solution_mobile/models/Element.dart' as CS;
import 'package:provider/provider.dart';

import 'bloc/auth_bloc.dart';

bool autorised;
//final String chemURL = '192.168.0.104:5001';
//final String chemURL = '192.168.1.8:5001';
final String chemURL = 'chemsolutionapi.azurewebsites.net';
final storage = FlutterSecureStorage();
User currentUser;
List<BlogPost> allPosts = [];
List<CS.Element> allElements = [];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  allPosts = await BlogPost.fetchObjects(path: 'BlogPosts');
  allElements = await CS.Element.fetchObjects(path: 'Elements');
  await Autorisation.setUser();
  runApp(ChemApp());
}

class ChemApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    '/Home': (BuildContext context) => ChemSolutionWidget()
  };

  @override
  Widget build(BuildContext context) {
    return Provider<AuthBloc>(
      create: (context) => AuthBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ChemSolution',
        home: SplashScreen(nextRoute: '/Home'),
        routes: routes,
        theme: ThemeData(
          fontFamily: 'CenturyGothic',
        ),
      ),
    );
  }
}
