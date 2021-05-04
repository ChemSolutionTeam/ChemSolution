import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:chem_solution_mobile/main.dart';

abstract class Autorisation {
  static String getInfo(String o, RegExp exp) {
    Match match = exp.firstMatch(o);
    try {
      String result = match.group(0);
      return result.substring(4, result.length - 2);
    } catch (ex) {
      //throw new Exception(ex);
      print(ex);
    }
  }

  static Future<void> signIn(
      String email, String password, Function() update) async {
    final response = await http.get(
        Uri.http(chemURL, 'getjwt', {'email': email, 'password': password}));

    print(Uri.http(chemURL, 'getjwt', {'email': email, 'password': password})
        .toString());
    print('Response status: ${response.statusCode}');
    if ('${response.statusCode}'.indexOf('2') == 0) {
      try {
        await storage.write(
            key: 'token',
            value: getInfo(Utf8Codec().decode(response.bodyBytes),
                RegExp(r'n":"(\S)+",')));
        autorised = true;
      } catch (ex) {
        print(ex);
        autorised = false;
      }
    } else {
      autorised = false;
    }
    update();
    print(autorised);
    print(getInfo(
        Utf8Codec().decode(response.bodyBytes), RegExp(r'n":"(\S)+",')));
    print(getInfo(
        Utf8Codec().decode(response.bodyBytes), RegExp(r'e":"(\S)+"\}')));
  }
}
