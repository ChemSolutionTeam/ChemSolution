import 'package:chem_solution_mobile/models/Material.dart' as CS;
import 'User.dart';
import 'Valence.dart';
import 'Model.dart';

class Element extends Model {
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
  List<CS.Material> materials = [];
  List<Valence> valences = [];

  Element(
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
      _valence += value + " ";
    }
    return _valence;
  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = new Map<String, dynamic>();
    map['elementId'] = elementId;
    map['symbol'] = symbol;
    map['name'] = name;
    map['atomicWeight'] = atomicWeight;
    map['electronQuantity'] = electronQuantity;
    map['protonQuantity'] = protonQuantity;
    map['neutronQuantity'] = neutronQuantity;
    map['atomicRadius'] = atomicRadius;
    map['electronegativity'] = electronegativity;
    map['category'] = category;
    map['energyLevels'] = energyLevels;
    map['meltingTemperature'] = meltingTemperature;
    map['boilingTemperature'] = boilingTemperature;
    map['isLocked'] = isLocked;
    map['info'] = info;
    map['imgAtom'] = imgAtom;
    map['group'] = group;
    map['imgSymbol'] = imgSymbol;
    List<Map<String, dynamic>> usersMaps = [];
    users.forEach((element) {
      usersMaps.add(element.toMap());
    });
    map['users'] = usersMaps;
    List<Map<String, dynamic>> materialsMaps = [];
    materials.forEach((element) {
      materialsMaps.add(element.toMap());
    });
    map['materials'] = materialsMaps;
    List<Map<String, dynamic>> valencesMaps = [];
    valences.forEach((element) {
      valencesMaps.add(element.toMap());
    });

    map['valences'] = valences;
    return map;
  }
}
