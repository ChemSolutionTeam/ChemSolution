import 'package:chem_solution_mobile/models/Element.dart' as CS;
import 'package:chem_solution_mobile/models/Model.dart';
import 'package:chem_solution_mobile/models/Material.dart' as CSM;

import 'BlogPost.dart';
import 'Achievement.dart';
import 'Request.dart';
import 'ResearchHistory.dart';

class User extends Model {
  String userEmail;
  String userName;
  DateTime dateOfBirth;
  String password;
  int balance=0;
  int rating=0;
  int honesty=100;

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

/*
  List<BlogPost> blogPosts = [];
  List<Achievement> achievement = [];
  List<CS.Element> elements = [];
  List<Request> requests = [];
  List<ResearchHistory> researchHistorys = [];
  List<CSM.Material> materials = [];
 */
  static User fromObject(dynamic o) {
    User u = new User();
    u.userEmail = o['userEmail'];
    u.userName = o['userName'];
    u.dateOfBirth = o['dateOfBirth'];
    u.password = o['password'];
    u.balance = o['balance'];
    u.rating = o['rating'];
    u.honesty = o['honesty'];
    o['blogPosts'].forEach((element) {
      u.blogPosts.add(BlogPost.fromObject(element));
    });
    o['achievement'].forEach((element) {
      u.achievement.add(Achievement.fromObject(element));
    });
    o['elements'].forEach((element) {
      u.elements.add(CS.Element.fromObject(element));
    });
    o['requests'].forEach((element) {
      u.requests.add(Request.fromObject(element));
    });
    o['researchHistorys'].forEach((element) {
      u.researchHistorys.add(ResearchHistory.fromObject(element));
    });
    o['materials'].forEach((element) {
      u.materials.add(CSM.Material.fromObject(element));
    });
    return u;
  }
}
