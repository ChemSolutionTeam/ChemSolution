import 'package:chem_solution_mobile/models/ChemElement.dart';
import 'ElementMaterial.dart';
import 'Model.dart';
import 'User.dart';
import 'ResearchHistory.dart';
import 'MaterialGroup.dart';

class Molecule extends Model {
  int id;
  String image;
  String formula;
  String name;
  String info;
  List<ChemElement> elements = [];
  List<User> users = [];
  List<ElementMaterial> elementMaterials = [];
  List<ResearchHistory> researchHistories = [];
  MaterialGroup materialGroup;
  int materialGroupId;

  Molecule({
    this.id,
    this.image,
    this.formula,
    this.name,
    this.info,
    this.materialGroup,
    this.elementMaterials,
    this.elements,
    this.materialGroupId,
    this.researchHistories,
    this.users
  });

  @override
  Map<String, dynamic> toMap() {
    // TODO: implement toMap
    throw UnimplementedError();
  }
}
