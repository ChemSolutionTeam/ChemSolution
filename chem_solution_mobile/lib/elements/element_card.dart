import 'package:chem_solution_mobile/models/ChemElement.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

class ElementCard extends StatefulWidget {
  final ChemElement element;
  ElementCard({Key key, @required this.element}) : super(key: key);

  @override
  _ElementCardState createState() => _ElementCardState(element);
}

class _ElementCardState extends State<ElementCard> {
  ChemElement element;

  _ElementCardState(this.element);

  Widget _rowInfo(String name, String value) {
    return Container(
      child: Wrap(
        children: [
          Container(child: Text(name)),
          Container(child: Text(value)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 5, 10),
              alignment: Alignment.centerLeft,
              child: Image.network(
                element.imgSymbol,
                height: 100,
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
              child: Wrap(
                direction: Axis.vertical,
                children: [
                  _rowInfo('Порядковий номер: ', '${element.idElement}'),
                  _rowInfo('Позначення: ', '${element.symbol}'),
                  _rowInfo('Назва: ', '${element.name}'),
                  _rowInfo('Категорія: ', '${element.category}'),
                  _rowInfo('Атомна маса: ', '${element.atomicWeight}'),
                  _rowInfo('Валентність: ', '${element.getValence()}'),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(5, 10, 10, 10),
                alignment: Alignment.centerRight,
                child: Icon(
                  CommunityMaterialIcons.more,
                  color:
                      !element.isLocked ? Color(0xff1DCDFE) : Colors.blueGrey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
