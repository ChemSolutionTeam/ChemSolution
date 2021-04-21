import 'package:chem_solution_mobile/models/Element.dart' as CS;
import 'ElementMaterial.dart';
import 'Model.dart';
import 'User.dart';
import 'ResearchHistory.dart';
import 'MaterialGroup.dart';

class Material extends Model {
  int id;
  String image;
  String formula;
  String name;
  String info;
  List<CS.Element> elements = [];
  List<User> users = [];
  List<ElementMaterial> elementMaterials = [];
  List<ResearchHistory> researchHistories = [];
  MaterialGroup materialGroup;
  int materialGroupId;

  Material(
      {this.id,
      this.image,
      this.formula,
      this.name,
      this.info,
      this.materialGroup,
      this.elementMaterials,
      this.elements,
      this.materialGroupId,
      this.researchHistories,
      this.users});

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = new Map<String, dynamic>();
    map['id'] = id;
    map['image'] = image;
    map['formula'] = formula;
    map['name'] = name;
    map['info'] = info;
    List<Map<String, dynamic>> elementsMaps = [];
    elements.forEach((element) {
      elementsMaps.add(element.toMap());
    });
    map['elements'] = elementsMaps;
    List<Map<String, dynamic>> usersMaps = [];
    users.forEach((element) {
      usersMaps.add(element.toMap());
    });
    map['users'] = usersMaps;
    List<Map<String, dynamic>> elementMaterialsMaps = [];
    elementMaterials.forEach((element) {
      elementMaterialsMaps.add(element.toMap());
    });
    map['elementMaterials'] = elementMaterialsMaps;
    List<Map<String, dynamic>> researchHistoriesMaps = [];
    researchHistories.forEach((element) {
      researchHistoriesMaps.add(element.toMap());
    });
    map['researchHistories'] = researchHistoriesMaps;
    map['materialGroup'] = materialGroup.toMap();
    map['materialGroupId'] = materialGroupId;
    return map;
  }
}
