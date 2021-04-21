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
    // TODO: implement toMap
    throw UnimplementedError();
  }
}
