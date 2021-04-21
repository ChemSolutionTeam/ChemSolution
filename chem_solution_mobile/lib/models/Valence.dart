import 'package:chem_solution_mobile/models/Element.dart' as CS;
import 'package:chem_solution_mobile/models/Model.dart';

class Valence extends Model {
  int elementId;
  CS.Element element;
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
