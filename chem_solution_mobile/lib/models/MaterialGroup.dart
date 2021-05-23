import 'package:chem_solution_mobile/models/Model.dart';
import 'package:chem_solution_mobile/models/Material.dart' as CS;
import 'Achievement.dart';

class MaterialGroup extends Model {
  int materialGroupId;
 // List<CS.Material> materials = [];
  //List<Achievement> achievement = [];
  String groupName;

  MaterialGroup({
    this.materialGroupId,
    //this.materials,
    //this.achievement,
    this.groupName,
  });

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = new Map<String, dynamic>();
    map['materialGroupId'] = materialGroupId;
 /*   List<Map<String, dynamic>> materialsMaps = [];
    materials.forEach((element) {
      materialsMaps.add(element.toMap());
    });
    map['materials'] = materialsMaps;
    List<Map<String, dynamic>> achievementsMaps = [];
    achievement.forEach((element) {
      achievementsMaps.add(element.toMap());
    });
    map['achievement'] = achievementsMaps; */
    map['groupName'] = groupName;
    return map;
  }

  static MaterialGroup fromObject(dynamic o) {
    MaterialGroup mg = new MaterialGroup();
    mg.materialGroupId = o['materialGroupId'];
  /*  o['materials'].forEach((e) {
      mg.materials.add(CS.Material.fromObject(e));
    });
    o['achievement'].forEach((e) {
      mg.achievement.add(Achievement.fromObject(e));
    }); */
    mg.groupName = o['groupName'];
    return mg;
  }
}
