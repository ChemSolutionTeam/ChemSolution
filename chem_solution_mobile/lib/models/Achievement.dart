import 'package:chem_solution_mobile/models/Model.dart';
import 'MaterialGroup.dart';
import 'User.dart';

class Achievement extends Model{
  int achievementId;
  String heading;
  String description;
  int moneyReward;
  int ratingReward;
  int countGoal;
  String imgAchievemen;
  int materialGroupId;
  MaterialGroup condition;
  List<User> users = [];

  Achievement(
      {this.achievementId,
      this.heading,
      this.description,
      this.moneyReward,
      this.ratingReward,
      this.countGoal,
      this.materialGroupId,
      this.condition,
      this.users,
      this.imgAchievemen});

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = new Map<String, dynamic>();
    map['achievementId'] = achievementId;
    map['heading'] = heading;
    map['description'] = description;
    map['moneyReward'] = moneyReward;
    map['ratingReward'] = ratingReward;
    map['countGoal'] = countGoal;
    map['imgAchievemen'] = imgAchievemen;
    map['materialGroupId'] = materialGroupId;
    map['condition'] = condition.toMap();
    List<Map<String, dynamic>> usersMaps = [];
    users.forEach((element) {
      usersMaps.add(element.toMap());
    });
    map['users'] = usersMaps;
    return map;
  }

  static Achievement fromObject(dynamic o) {
    Achievement a = Achievement();
    a.achievementId = o['achievementId'];
    a.heading = o['heading'];
    a.imgAchievemen = o['imgAchievemen'];
    a.description = o['description'];
    a.moneyReward = o['moneyReward'];
    a.ratingReward = o['ratingReward'];
    a.countGoal = o['countGoal'];
    a.materialGroupId = o['materialGroupId'];
    a.condition = MaterialGroup.fromObject(o['condition']);
    o['users'].forEach((element) {
      a.users.add(User.fromObject(element));
    });
    return a;
  }
}
