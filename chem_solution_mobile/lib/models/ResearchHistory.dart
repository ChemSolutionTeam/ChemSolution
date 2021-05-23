import 'package:chem_solution_mobile/models/Model.dart';
import 'package:chem_solution_mobile/models/Material.dart' as CS;
import 'User.dart';

class ResearchHistory extends Model {
  String userEmail;
  int materialId;
  CS.Material material;
 // User user;
  DateTime dateTime;

  ResearchHistory({
    this.dateTime,
    this.material,
    this.materialId,
   // this.user,
    this.userEmail,
  });

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = new Map<String, dynamic>();
    map['userEmail'] = userEmail;
    map['materialId'] = materialId;
    map['material'] = material.toMap();
   // map['user'] = user.toMap();
    map['dateTime'] = dateTime;
    return map;
  }

  static ResearchHistory fromObject(dynamic o) {
    ResearchHistory rh = new ResearchHistory();
    rh.dateTime=o['dateTime'];
    rh.material=CS.Material.fromObject(o['material']);
    rh.materialId=o['materialId'];
  //  rh.user=User.fromObject(o['user']);
    rh.userEmail=o['userEmail'];
    return rh;
  }
}
