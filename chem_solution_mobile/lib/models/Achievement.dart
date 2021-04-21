import 'package:chem_solution_mobile/models/Model.dart';
import 'MaterialGroup.dart';
import 'User.dart';

class Achievement extends Model {
  int achievementId;
  String heading;
  String description;
  int moneyReward;
  int ratingReward;
  int countGoal;
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
      this.users});

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = new Map<String, dynamic>();
    map['achievementId'] = achievementId;
    map['heading'] = heading;
    map['description'] = description;
    map['moneyReward'] = moneyReward;
    map['ratingReward'] = ratingReward;
    map['countGoal'] = countGoal;
    map['materialGroupId'] = materialGroupId;
    map['condition'] = condition.toMap();
    List<Map<String, dynamic>> usersMaps = [];
    users.forEach((element) {
      usersMaps.add(element.toMap());
    });
    map['users'] = usersMaps;
    return map;
  }
}
