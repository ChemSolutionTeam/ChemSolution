import 'Model.dart';

class ChemElement extends Model {
  int idElement;
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
  List<String> valence = [];

  ChemElement(
      {this.idElement,
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
      this.valence,
      this.imgAtom,
      this.imgSymbol});

  String getValence() {
    String _valence = '';
    for (String val in valence) {
      _valence += val + " ";
    }
    return _valence;
  }

  @override
  Map<String, dynamic> toMap() {
    // TODO: implement toMap
    throw UnimplementedError();
  }
}
