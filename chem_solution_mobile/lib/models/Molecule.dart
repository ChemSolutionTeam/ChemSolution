import 'Model.dart';

class Molecule extends Model {
  int idMaterial;
  String image;
  String formula;
  String name;
  String info;
  String materialGroup;

  Molecule({
    this.idMaterial,
    this.image,
    this.formula,
    this.name,
    this.info,
    this.materialGroup,
  });

  @override
  Map<String, dynamic> toMap() {
    // TODO: implement toMap
    throw UnimplementedError();
  }
}
