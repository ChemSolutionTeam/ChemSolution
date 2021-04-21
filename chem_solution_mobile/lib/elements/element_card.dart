import 'package:chem_solution_mobile/elements/element_info.dart';
import 'package:chem_solution_mobile/main.dart';
import 'package:chem_solution_mobile/models/ChemElement.dart';
import 'package:chem_solution_mobile/widgets/element_material_card.dart';
import 'package:flutter/material.dart';
import 'package:chem_solution_mobile/assets/alerts.dart';

class ElementCard extends StatefulWidget {
  final ChemElement element;
  ElementCard({Key key, @required this.element}) : super(key: key);

  @override
  _ElementCardState createState() => _ElementCardState(element);
}

class _ElementCardState extends State<ElementCard> {
  ChemElement element;
  Color _colorCard = Colors.white;
  _ElementCardState(this.element);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 0),      
      child: GestureDetector(
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
       
        child: cardElementMaterial(
            element.imgSymbol,
            _colorCard,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                rowInfo('Порядковий номер: ', '${element.idElement}'),
                rowInfo('Позначення: ', '${element.symbol}'),
                rowInfo('Назва: ', '${element.name}'),
                rowInfo('Категорія: ', '${element.category}'),
                rowInfo('Атомна маса: ', '${element.atomicWeight}'),
                rowInfo('Валентність: ', '${element.getValence()}'),
              ],
            ),
            200),
      ),
    );
  }
}
