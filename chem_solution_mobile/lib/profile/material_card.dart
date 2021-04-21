import 'package:chem_solution_mobile/models/Molecule.dart';
import 'package:chem_solution_mobile/profile/material_info.dart';
import 'package:chem_solution_mobile/widgets/element_material_card.dart';
import 'package:flutter/material.dart';

class MaterialCard extends StatefulWidget {
  final Molecule material;
  MaterialCard({Key key, @required this.material}) : super(key: key);

  @override
  _MaterialCardState createState() => _MaterialCardState(material: material);
}

class _MaterialCardState extends State<MaterialCard>
    with SingleTickerProviderStateMixin {
  Molecule material;
  Color _colorCard = Colors.white;
  _MaterialCardState({this.material});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MaterialInfo(material: material),
            ),
          );
        },
         onLongPressStart: (_){
            setState(() {
            _colorCard = Color(0xff1dcdfe);
          });
        },
        onLongPressEnd: (_){
           setState(() {
            _colorCard = Colors.white;
          });
        },
        onTapDown: (details) {
          setState(() {
            _colorCard = Color(0xff21D0B2);
          });
        },
        onTapUp: (details) {
          _colorCard = Colors.white;
        },
        child: cardElementMaterial(
            material.image,
            _colorCard,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                rowInfo('Назва: ', '${material.name}'),
                rowInfo('Формула: ', '${material.formula}'),
                rowInfo('Клас: ', '${material.materialGroup}'),
              ],
            ),
            100),
      ),
    );
  }
}
