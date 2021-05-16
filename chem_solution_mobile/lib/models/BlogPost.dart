import 'dart:io';

import 'package:chem_solution_mobile/assets/toasts.dart';
import 'package:chem_solution_mobile/models/Autorisation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:chem_solution_mobile/main.dart';
import 'Model.dart';
import 'User.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class BlogPost extends Model {
  int blogPostId;
  String title;
  String category;
  String information;
  bool isLocked;
  String image;
  List<User> users = [];

  BlogPost({
    this.blogPostId,
    this.title,
    this.category,
    this.information,
    this.isLocked,
    this.image,
    this.users,
  });

  bool like(User user) {
    if (user == null) return false;
    if (user.blogPosts == null) return false;
    for (int i = 0; i < user.blogPosts.length; i++) {
      if (user.blogPosts[i].blogPostId == this.blogPostId) return true;
    }
    return false;
  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = new Map<String, dynamic>();
    map['blogPostId'] = blogPostId;
    map['title'] = title;
    map['category'] = category;
    map['information'] = information;
    map['isLocked'] = isLocked;
    map['image'] = image;
    List<Map<String, dynamic>> usersMaps = [];
    users.forEach((element) {
      usersMaps.add(element.toMap());
    });
    map['users'] = usersMaps;
    return map;
  }

  static BlogPost fromObject(dynamic o) {
    BlogPost bp = BlogPost();
    bp.blogPostId = o['blogPostId'];
    bp.title = o['title'];
    bp.category = o['category'];
    bp.information = o['information'];
    bp.isLocked = o['isLocked'];
    bp.image = o['image'];
    /* List<User> u = [];
    o['users'].forEach((e) {
      u.add(User.fromObject(e));
    });
    bp.users = u; */

    return bp;
  }

  // ignore: missing_return
  static Future<BlogPost> fetchObject({@required String path}) async {
    try {
      final response = await http.get(Uri.http(chemURL, path));
      if (response.statusCode == 200) {
        return BlogPost.fromObject(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load');
      }
    } catch (ex) {
      showToast('Помилка підключення', Colors.redAccent, Color(0xff590000),
          Icons.error, FToast());
    }
  }

  static Future<List<BlogPost>> fetchObjects({@required String path}) async {
    final response = await http.get(Uri.http(chemURL, path));

    if (response.statusCode == 200) {
      List<BlogPost> list = [];
      jsonDecode(response.body).forEach((e) {
        list.add(BlogPost.fromObject(e));
      });
      return list;
    } else {
      throw Exception('Failed to load');
    }
  }

  Future<bool> addToLiked(User user) async {
    String token = await storage.read(key: 'token');
    try {
      final response = await http.post(
          Uri.http(chemURL, 'Users/liked/add/${this.blogPostId}'),
          headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});

      print(Uri.http(chemURL, 'Users/liked/add/${this.blogPostId}'));
      Autorisation.setUser();
      return response.statusCode == 200;
    } catch (ex) {
      print(ex);
    }
  }

  Future<bool> removeFromLiked(User user) async {
    String token = await storage.read(key: 'token');

    try {
      final response = await http.post(
          Uri.http(chemURL, 'Users/liked/remove/${this.blogPostId}'),
          headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
      Autorisation.setUser();
      print(Uri.http(chemURL, 'Users/liked/remove/${this.blogPostId}'));

      return response.statusCode == 200;
    } catch (ex) {
      print(ex);
    }
  }
}
