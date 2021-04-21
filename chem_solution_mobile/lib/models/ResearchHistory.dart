import 'package:chem_solution_mobile/models/Model.dart';
import 'package:chem_solution_mobile/models/Material.dart' as CS;
import 'User.dart';

class ResearchHistory extends Model {
  String userEmail;
  int materialId;
  CS.Material material;
  User user;
  DateTime dateTime;

  ResearchHistory({
    this.dateTime,
    this.material,
    this.materialId,
    this.user,
    this.userEmail,
  });

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = new Map<String, dynamic>();
    map['userEmail'] = userEmail;
    map['materialId'] = materialId;
    map['material'] = material.toMap();
    map['user'] = user.toMap();
    map['dateTime'] = dateTime;
    return map;
  }
}
