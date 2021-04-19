import 'package:chem_solution_mobile/elements/element_info.dart';
import 'package:chem_solution_mobile/main.dart';
import 'package:chem_solution_mobile/models/ChemElement.dart';
import 'package:flutter/material.dart';
import 'package:chem_solution_mobile/assets/alerts.dart';

class ElementCard extends StatefulWidget {
  final ChemElement element;
  ElementCard({Key key, @required this.element}) : super(key: key);

  @override
  _ElementCardState createState() => _ElementCardState(element);
}

class _ElementCardState extends State<ElementCard>
    with SingleTickerProviderStateMixin {
  ChemElement element;
  Color _colorCard = Colors.white;
  _ElementCardState(this.element);



  Widget _rowInfo(String name, String value) {
    return Wrap(
      direction: Axis.horizontal,
      children: [
        Container(
          child: Text(
            name,
            style: TextStyle(color: Color(0xff2F455C), fontSize: 16),
          ),
        ),
        Container(
            child: Text(
          value,
          style: TextStyle(
              color: Color(0xff2F455C),
              fontSize: 16,
              fontWeight: FontWeight.bold),
        )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: GestureDetector(
        onTap: () {
          if (autorised) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ElementInfo(
                  element: element,
                ),
              ),
            );
          } else {
            return alertDialogShow(context, createDialog(context), 200);
          }
        },
        onTapDown: (details) {
          setState(() {
            _colorCard = Color(0xff21D0B2);
          });
        },
        onTapUp: (details) {
          setState(() {
            _colorCard = Colors.white;
          });
        },
        child: Card(
          color: _colorCard,
          clipBehavior: Clip.antiAlias,
          elevation: 5,
          child: Container(
            height: 200,
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Image.network(
                      element.imgSymbol,
                      height: 100,
                    ),
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 14,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
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
                ) 
              ],
            ),
          ),
        ),
      ),
    );
  }
}
