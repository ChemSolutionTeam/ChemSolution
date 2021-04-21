import 'package:chem_solution_mobile/models/Molecule.dart';
import 'User.dart';
import 'Valence.dart';
import 'Model.dart';

class ChemElement extends Model {
  int elementId;
  String symbol;
  String name;
  double atomicWeight;
  int electronQuantity;
  int protonQuantity;
  int neutronQuantity;
  double atomicRadius;
  double electronegativity;
  String category;
  int energyLevels;
  double meltingTemperature;
  double boilingTemperature;
  bool isLocked;
  String info;
  String imgSymbol;
  String imgAtom;
  int group;

  List<User> users = [];
  List<Molecule> materials = [];
  List<Valence> valences = [];

  ChemElement(
      {this.elementId,
      this.symbol,
      this.name,
      this.atomicWeight,
      this.electronQuantity,
      this.protonQuantity,
      this.neutronQuantity,
      this.atomicRadius,
      this.electronegativity,
      this.category,
      this.energyLevels,
      this.meltingTemperature,
      this.boilingTemperature,
      this.isLocked,
      this.info,
      this.imgAtom,
      this.group,
      this.imgSymbol,
      this.users,
      this.materials,
      this.valences});

  String getValence() {
    String _valence = '';
    for (Valence val in valences) {
      String value;
      switch (val.valenceVal) {
        case 1:
          value = 'I';
          break;
        case 2:
          value = 'II';
          break;
        case 3:
          value = 'III';
          break;
        case 4:
          value = 'IV';
          break;
        case 5:
          value = 'V';
          break;
        case 6:
          value = 'VI';
          break;
        case 7:
          value = 'VII';
          break;
        case 8:
          value = 'VIII';
          break;
      }
      _valence += val.valenceVal.toString() + " ";
    }
    return _valence;
  }

  @override
  Map<String, dynamic> toMap() {
    // TODO: implement toMap
    throw UnimplementedError();
  }
}
