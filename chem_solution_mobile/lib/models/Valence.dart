import 'package:chem_solution_mobile/models/ChemElement.dart';
import 'package:chem_solution_mobile/models/Model.dart';

class Valence extends Model {
  int elementId;
  ChemElement element;
  int valenceVal;

  Valence({
    this.element,
    this.elementId,
    this.valenceVal,
  });

  @override
  Map<String, dynamic> toMap() {
    // TODO: implement toMap
    throw UnimplementedError();
  }
}
