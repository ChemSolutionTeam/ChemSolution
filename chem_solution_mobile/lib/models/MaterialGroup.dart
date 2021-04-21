import 'package:chem_solution_mobile/models/Model.dart';
import 'package:chem_solution_mobile/models/Molecule.dart';
import 'Achievement.dart';

class MaterialGroup extends Model {
  int materialGroupId;
  List<Molecule> materials = [];
  List<Achievement> achievement = [];
  String groupName;

  MaterialGroup({
    this.materialGroupId,
    this.materials,
    this.achievement,
    this.groupName,
  });

  @override
  Map<String, dynamic> toMap() {
    // TODO: implement toMap
    throw UnimplementedError();
  }
}
