import 'package:chem_solution_mobile/models/ChemElement.dart';
import 'package:chem_solution_mobile/widgets/element_material_info.dart';
import 'package:flutter/material.dart';

class ElementInfo extends StatelessWidget {
  final ChemElement element;
  const ElementInfo({Key key, @required this.element}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return scaffoldInfo(
      context,
      element.name,
      Column(
        children: [
          img(element.imgSymbol),
          info('Номер елемента: ', element.idElement.toString()),
          info('Позначення: ', element.symbol),
          info('Назва: ', element.name),
          info('Група: ', element.group.toString()),
          info('Валентність: ', element.getValence()),
          info('Атомна маса: ', element.atomicWeight.toString()),
          info('Електрони: ', element.electronQuantity.toString()),
          info('Протони: ', element.protonQuantity.toString()),
          info('Нейтрони: ', element.neutronQuantity.toString()),
          info('Електронегативність: ', element.electronegativity.toString()),
          info('Категорія: ', element.category),
          info('Енергетичні рівні: ', element.energyLevels.toString()),
          info('Температура кипіння: ', element.boilingTemperature.toString()),
          info(
              'Температура плавлення: ', element.meltingTemperature.toString()),
          info('Загальна інформація: ', element.info),
          img(element.imgAtom),
        ],
      ),
    );
  }
}
