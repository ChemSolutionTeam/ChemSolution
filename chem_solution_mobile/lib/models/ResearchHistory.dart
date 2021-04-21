import 'package:chem_solution_mobile/models/Model.dart';
import 'package:chem_solution_mobile/models/Molecule.dart';
import 'User.dart';

class ResearchHistory extends Model {
  String userEmail;
  int materialId;
  Molecule material;
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
    // TODO: implement toMap
    throw UnimplementedError();
  }
}
