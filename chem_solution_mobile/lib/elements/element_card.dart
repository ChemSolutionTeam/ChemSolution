import 'package:chem_solution_mobile/elements/element_info.dart';
import 'package:chem_solution_mobile/main.dart';
import 'package:chem_solution_mobile/models/Element.dart' as CS;
import 'package:chem_solution_mobile/widgets/element_material_card.dart';
import 'package:flutter/material.dart';
import 'package:chem_solution_mobile/assets/alerts.dart';
import 'package:chem_solution_mobile/assets/colors.dart';


class ElementCard extends StatefulWidget {
  final CS.Element element;
  ElementCard({Key key, @required this.element}) : super(key: key);

  @override
  _ElementCardState createState() => _ElementCardState(element);
}

class _ElementCardState extends State<ElementCard> {
  CS.Element element;
  Color _colorCard = Colors.white;
  _ElementCardState(this.element);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 0),      
      child: GestureDetector(
        onLongPressStart: (_){
            setState(() {
            _colorCard = themeBlue;
          });
        },
        onLongPressEnd: (_){
           setState(() {
            _colorCard = Colors.white;
          });
        },
         onTapDown: (details) {
          setState(() {
            _colorCard = themeGreen;
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
            return alertDialogShow(context, createDialog(context, 'детального перегляду інформації'), 200);
          }
        },
       
        child: cardElementMaterial(
            element.imgSymbol,
            _colorCard,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                rowInfo('Порядковий номер: ', '${element.elementId}'),
                rowInfo('Позначення: ', '${element.symbol}'),
                rowInfo('Назва: ', '${element.name}'),
                rowInfo('Категорія: ', '${element.category.categoryName}'),
                rowInfo('Атомна маса: ', '${element.atomicWeight}'),
                rowInfo('Валентність: ', '${element.getValence()}'),
              ],
            ),
            200),
      ),
    );
  }
}
