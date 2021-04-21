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
    map['materialId'] = materialId;
    map['material'] = material.toMap();
    map['elementId'] = elementId;
    map['element'] = element.toMap();
    map['amount'] = amount;
    return map;
  }

  static ElementMaterial fromObject(dynamic o) {
    ElementMaterial em = new ElementMaterial();
    em.materialId = o['materialId'];
    em.material = CSM.Material.fromObject(o['material']);
    em.elementId = o['elementId'];
    em.element = CS.Element.fromObject(o['element']);
    em.amount = o['amount'];
    return em;
  }
}
