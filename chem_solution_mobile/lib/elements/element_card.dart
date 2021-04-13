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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListTile(
            leading: Image.network(
              element.images['Позначення'],
              height: 100,
              width: 200,
            ),
            trailing: Icon(
              CommunityMaterialIcons.more,
              color: element.isLocked ? Color(0xff1DCDFE) : Colors.blueGrey,
            ),
            title: Text(
                '${element.idElement} - ${element.symbol} - ${element.name}'),
            subtitle: Flexible(
              child: Column(
                children: [
                  Flexible(
                    child: Row(
                      children: [
                        Text('Категорія: '),
                        Text('${element.category}'),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Row(
                      children: [
                        Text('Атомна маса: '),
                        Text('${element.atomicWeight}'),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Row(
                      children: [
                        Text('Валентність: '),
                        Text('${element.getValence()}'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
