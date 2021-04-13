import 'package:chem_solution_mobile/models/ChemElement.dart';
import 'package:flutter/material.dart';

class ElementInfo extends StatelessWidget {
  final ChemElement element;
  const ElementInfo({Key key, @required this.element}) : super(key: key);

  Widget _info(String title, String info) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Flexible(
        child: Wrap(
          children: [
            Text(
              title,
              style: TextStyle(
                color: Color(0xff2F455C),
                fontSize: 16.0,
                fontWeight: FontWeight.w700
              ),
            ),
            Text(
              info,
              style: TextStyle(
                color: Color(0xff2F455C),
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _img(String img) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(20.0),
      child: Image.network(
        img,
        fit: BoxFit.fitWidth,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) {
        if (details.primaryVelocity > 0) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        backgroundColor: Color(0xffEBFAFF),
        appBar: AppBar(
          backgroundColor: Color(0xff2F455C),
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(element.name,
                style: TextStyle(
                    color: Color(0xff21D0B2),
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0)),
          ),
        ),
        body: Container(
          child: Column(
            children: [              
              _img(element.imgSymbol),
              _info('Номер елемента: ',element.idElement.toString()),
              _info('Позначення: ',element.symbol),
              _info('Назва: ', element.name),
              _info('Група: ', element.group.toString()),
              _info('Валентність: ',element.getValence()),
              _info('Атомна маса: ',element.atomicWeight.toString()),
              _info('Електрони: ',element.electronQuantity.toString()),
              _info('Протони: ',element.protonQuantity.toString()),
              _info('Нейтрони: ',element.neutronQuantity.toString()),
              _info('Електронегативність: ',element.electronegativity.toString()),
              _info('Категорія: ',element.category),
              _info('Енергетичні рівні: ',element.energyLevels.toString()),
              _info('Температура кипіння: ',element.boilingTemperature.toString()),
              _info('Температура плавлення: ',element.meltingTemperature.toString()),
              _info('Загальна інформація: ',element.info),
              _img(element.imgAtom),

            ],
          ),
        ),
      ),
    );
  }
}
