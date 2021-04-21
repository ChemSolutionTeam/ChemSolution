import 'package:chem_solution_mobile/models/ChemElement.dart';
import 'package:chem_solution_mobile/models/Model.dart';
import 'package:chem_solution_mobile/models/Molecule.dart';

class ElementMaterial extends Model {
  int materialId;
  Molecule material;
  int elementId;
  ChemElement element;
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
    // TODO: implement toMap
    throw UnimplementedError();
  }
}
