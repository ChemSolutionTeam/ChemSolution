import 'package:chem_solution_mobile/models/Material.dart' as CS;
import 'package:chem_solution_mobile/widgets/element_material_info.dart';
import 'package:flutter/material.dart';

class MaterialInfo extends StatelessWidget {
  final CS.Material material;
  const MaterialInfo({Key key, @required this.material}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return scaffoldInfo(
      context,
      material.name,
      Column(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 20.0),
            child: Image.network(
              material.image,
              fit: BoxFit.fitWidth,
            ),
          ),
          info('Назва: ', '${material.name}'),
          info('Формула: ', '${material.formula}'),
          info('Клас: ', '${material.materialGroup}'),
          info('Загальна інформація:', ''),
          info('', '\n${material.info}'),
        ],
      ),
    );
  }
}
