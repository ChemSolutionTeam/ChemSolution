import 'package:chem_solution_mobile/assets/images.dart';
import 'package:chem_solution_mobile/models/Model.dart';
import 'MaterialGroup.dart';

class Achievement extends Model {
  int achievementId;
  String heading;
  String description;
  int moneyReward;
  int ratingReward;
  int countGoal;
  String imgAchievement;
  int materialGroupId;
  MaterialGroup materialGroup;
  // List<User> users = [];

  Achievement(
      {this.achievementId,
      this.heading,
      this.description,
      this.moneyReward,
      this.ratingReward,
      this.countGoal,
      this.materialGroupId,
      this.materialGroup,
      //  this.users,
      this.imgAchievement});

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = new Map<String, dynamic>();
    map['achievementId'] = achievementId;
    map['heading'] = heading;
    map['description'] = description;
    map['moneyReward'] = moneyReward;
    map['ratingReward'] = ratingReward;
    map['countGoal'] = countGoal;
    map['imgAchievement'] = imgAchievement;
    map['materialGroupId'] = materialGroupId;
    map['materialGroup'] = materialGroup.toMap();
    /*  List<Map<String, dynamic>> usersMaps = [];
    users.forEach((element) {
      usersMaps.add(element.toMap());
    });
    map['users'] = usersMaps; */
    return map;
  }

  static Achievement fromObject(dynamic o) {
    Achievement a = Achievement();
    a.achievementId = o['achievementId'];
    a.heading = o['heading'];
    a.imgAchievement = o['imgAchievement']?? notFound;
    a.description = o['description'];
    a.moneyReward = o['moneyReward'];
    a.ratingReward = o['ratingReward'];
    a.countGoal = o['countGoal'];
    a.materialGroupId = o['materialGroupId'];
   
    /*  
    
    a.materialGroup = MaterialGroup.fromObject(o['materialGroup']); */
    /*  o['users'].forEach((element) {
      a.users.add(User.fromObject(element));
    }); */
    return a;
  }
}
