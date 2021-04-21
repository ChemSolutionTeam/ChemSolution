import 'package:chem_solution_mobile/models/Model.dart';
import 'package:chem_solution_mobile/models/Material.dart' as CS;
import 'Achievement.dart';

class MaterialGroup extends Model {
  int materialGroupId;
  List<CS.Material> materials = [];
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
