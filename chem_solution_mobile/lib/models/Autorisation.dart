import 'dart:convert';
import 'package:chem_solution_mobile/models/User.dart';
import 'package:http/http.dart' as http;
import 'package:chem_solution_mobile/main.dart';

abstract class Autorisation {
  // ignore: missing_return
  static String getInfo(String o, RegExp exp) {
    Match match = exp.firstMatch(o);
    try {
      String result = match.group(0);
      return result.substring(4, result.length - 2);
    } catch (ex) {
      print(ex);
    }
  }

  static Future<void> signIn(
      String email, String password, Function() update) async {
    try {
      final response = await http.get(
          Uri.http(chemURL, 'getjwt', {'email': email, 'password': password}));

      if ('${response.statusCode}'.indexOf('2') == 0) {
        try {
          await storage.write(
              key: 'token',
              value: getInfo(Utf8Codec().decode(response.bodyBytes),
                  RegExp(r'n":"(\S)+",')));
          autorised = true;
          setUser();
        } catch (ex) {
          print(ex);
          autorised = false;
        }
      } else {
        autorised = false;
      }
      update();
    } catch (ex) {
      print(ex);
    }
  }

  static Future<void> setUser() async {
    currentUser = await User.fetchObject();
  }
}
