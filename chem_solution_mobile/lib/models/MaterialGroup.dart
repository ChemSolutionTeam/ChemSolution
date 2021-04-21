import 'package:chem_solution_mobile/models/Model.dart';
import 'package:chem_solution_mobile/models/Material.dart' as CS;
import 'Achievement.dart';

class MaterialGroup extends Model {
  int materialGroupId;
  List<CS.Material> materials = [];
  List<Achievement> achievements = [];
  String groupName;

  MaterialGroup({
    this.materialGroupId,
    this.materials,
    this.achievements,
    this.groupName,
  });

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = new Map<String, dynamic>();
    map['materialGroupId'] = materialGroupId;
    List<Map<String, dynamic>> materialsMaps = [];
    materials.forEach((element) {
      materialsMaps.add(element.toMap());
    });
    map['materials'] = materialsMaps;
    List<Map<String, dynamic>> achievementsMaps = [];
    achievements.forEach((element) {
      achievementsMaps.add(element.toMap());
    });
    map['achievements'] = achievementsMaps;
    map['groupName'] = groupName;
    return map;
  }
}
