import 'dart:convert';
import 'dart:io';
import 'package:chem_solution_mobile/models/Element.dart' as CS;
import 'package:chem_solution_mobile/models/Model.dart';
import 'package:chem_solution_mobile/models/Material.dart' as CSM;
import 'package:http/http.dart' as http;
import 'package:chem_solution_mobile/main.dart';
import 'BlogPost.dart';
import 'Achievement.dart';
import 'Request.dart';
import 'ResearchHistory.dart';

class User extends Model {
  String userEmail;
  String userName;
  String dateOfBirth;
  String password;
  int balance = 0;
  int rating = 0;
  int honesty = 100;

  List<BlogPost> blogPosts = [];
  List<Achievement> achievement = [];
  List<CS.Element> elements = [];
  List<Request> requests = [];
  List<ResearchHistory> researchHistorys = [];
  List<CSM.Material> materials = [];

  User({
    this.achievement,
    this.balance,
    this.blogPosts,
    this.dateOfBirth,
    this.elements,
    this.honesty,
    this.materials,
    this.password,
    this.rating,
    this.requests,
    this.researchHistorys,
    this.userEmail,
    this.userName,
  });

  DateTime get birthday {
    RegExp regex = new RegExp(r'(\d{4})-(\d{2})-(\d{2})');
    Match match = regex.firstMatch(dateOfBirth);
    return DateTime(
      int.parse(match.group(1)),
      int.parse(match.group(2)),
      int.parse(match.group(3)),
    );
  }

  String get birthdayToString {
    String day = '${birthday.day}'.padLeft(2, '0');
    String month = '${birthday.month}'.padLeft(2, '0');
    return '$day:$month:${birthday.year}';
  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = new Map<String, dynamic>();
    map['userEmail'] = userEmail;
    map['userName'] = userName;
    map['dateOfBirth'] = dateOfBirth;
    map['password'] = password;
    map['balance'] = balance;
    map['rating'] = rating;
    map['honesty'] = honesty;
    List<Map<String, dynamic>> blogPostsMaps = [];
    blogPosts.forEach((element) {
      blogPostsMaps.add(element.toMap());
    });
    map['blogPosts'] = blogPostsMaps;
    List<Map<String, dynamic>> achievementMaps = [];
    achievement.forEach((element) {
      achievementMaps.add(element.toMap());
    });
    map['achievement'] = achievementMaps;

    List<Map<String, dynamic>> elementsMaps = [];
    elements.forEach((element) {
      elementsMaps.add(element.toMap());
    });
    map['elements'] = elementsMaps;
    List<Map<String, dynamic>> requestsMaps = [];
    requests.forEach((element) {
      requestsMaps.add(element.toMap());
    });
    map['requests'] = requestsMaps;
    List<Map<String, dynamic>> researchHistorysMaps = [];
    researchHistorys.forEach((element) {
      researchHistorysMaps.add(element.toMap());
    });
    map['researchHistorys'] = researchHistorysMaps;
    List<Map<String, dynamic>> materialsMaps = [];
    materials.forEach((element) {
      materialsMaps.add(element.toMap());
    });
    map['materials'] = materialsMaps;
    return map;
  }

  static User fromObject(dynamic o) {
    User u = new User();
    u.userEmail = o['userEmail'];
    u.userName = o['userName'];
    u.dateOfBirth = o['dateOfBirth'];
    u.password = o['password'];
    u.balance = o['balance'];
    u.rating = o['rating'];
    u.honesty = o['honesty'];

    List<BlogPost> bps = [];
    o['blogPosts'].forEach((element) {
      bps.add(BlogPost.fromObject(element));
    });
    u.blogPosts = bps;

    List<Request> r = [];
    o['requests'].forEach((element) {
      r.add(Request.fromObject(element));
    });
    u.requests = r;

    List<Achievement> a = [];
    o['achievement'].forEach((element) {
      a.add(Achievement.fromObject(element));
    });
    u.achievement = a;

    /*  List<ResearchHistory> rs = [];
    o['researchHistorys'].forEach((element) {
      rs.add(ResearchHistory.fromObject(element));
    });
    u.researchHistorys = rs;

 

    List<CS.Element> e = [];
    o['elements'].forEach((element) {
      e.add(CS.Element.fromObject(element));
    });
    u.elements = e;




    List<CSM.Material> m = [];
    o['materials'].forEach((element) {
      m.add(CSM.Material.fromObject(element));
    });
    u.materials = m; */

    return u;
  }

  // ignore: missing_return
  static Future<User> fetchObject() async {
    try {
      String token = await storage.read(key: 'token');

      final response = await http.get(Uri.http(chemURL, "Users"),
          headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});

      if (response.statusCode == 200) {
        autorised = true;
        return User.fromObject(jsonDecode(response.body));
      } else {
        autorised = false;
        throw Exception('Failed to load');
      }
    } catch (ex) {
      autorised = false;
    }
  }
}
