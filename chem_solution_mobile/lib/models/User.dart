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
  int balance;
  int rating;
  int honesty;
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
}
