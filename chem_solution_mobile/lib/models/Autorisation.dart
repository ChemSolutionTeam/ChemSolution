import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:chem_solution_mobile/main.dart';
import 'package:flutter/material.dart';

abstract class Autorisation {
  static String getInfo(String o, RegExp exp) {
    Match match = exp.firstMatch(o);
    String result = match.group(0);
    return result.substring(4, result.length - 2);
  }

  static Future<void> SignIn(String email, String password) async {
    final response = await http.get(
        Uri.http(chemURL, 'getjwt', {'email': email, 'password': password}));

    print(Uri.http(chemURL, 'getjwt', {'email': email, 'password': password})
        .toString());
    print('Response status: ${response.statusCode}');
    if ('${response.statusCode}'.indexOf('2') == 0) {
      await storage.write(
          key: 'token',
          value: getInfo(
              Utf8Codec().decode(response.bodyBytes), RegExp(r'n":"(\S)+",')));
      autorised = true;
    } else {
      autorised = false;
    }
    print(autorised);
    // print(getInfo(
    //   Utf8Codec().decode(response.bodyBytes), RegExp(r'n":"(\S)+",')));
    print(getInfo(
        Utf8Codec().decode(response.bodyBytes), RegExp(r'e":"(\S)+"\}')));
  }
}
