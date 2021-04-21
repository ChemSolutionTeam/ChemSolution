import 'package:chem_solution_mobile/models/Element.dart' as CS;
import 'package:chem_solution_mobile/models/Model.dart';
import 'package:chem_solution_mobile/models/Material.dart' as CSM;

class ElementMaterial extends Model {
  int materialId;
  CSM.Material material;
  int elementId;
  CS.Element element;
  int amount;

  ElementMaterial({
    this.materialId,
    this.material,
    this.elementId,
    this.element,
    this.amount,
  });

  @override
  Map<String, dynamic> toMap() {
 Map<String, dynamic> map = new Map<String, dynamic>();
    return map;
  }
}
