import 'package:chem_solution_mobile/models/ChemElement.dart';
import 'package:chem_solution_mobile/models/Model.dart';
import 'package:chem_solution_mobile/models/Molecule.dart';

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
  List<ChemElement> elements = [];
  List<Request> requests = [];
  List<ResearchHistory> researchHistorys = [];
  List<Molecule> materials = [];

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
    // TODO: implement toMap
    throw UnimplementedError();
  }
}
