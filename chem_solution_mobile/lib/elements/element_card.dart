import 'package:chem_solution_mobile/elements/element_info.dart';
import 'package:chem_solution_mobile/main.dart';
import 'package:chem_solution_mobile/models/ChemElement.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:vibration/vibration.dart';

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

  Widget _rowInfo(String name, String value) {
    return Container(
      child: Wrap(
        children: [
          Container(
            child: Text(
              name,
              style: TextStyle(color: Color(0xff2F455C), fontSize: 16),
            ),
          ),
          Container(
              child: Text(
            value + " ",
            style: TextStyle(
                color: Color(0xff2F455C),
                fontSize: 16,
                fontWeight: FontWeight.bold),
          )),
        ],
      ),
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
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    elevation: 24,
                    title: Text(
                      'Увага!',
                      style: TextStyle(
                        color: Color(0xff2F455C),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    content: Text(
                      'Для детального перегляду інформації необхідно авторизуватися. Зробити це зараз?',
                      style: TextStyle(
                        color: Color(0xff2F455C),
                      ),
                    ),
                    actions: [
                      // ignore: deprecated_member_use
                      FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Ні',
                            style: TextStyle(color: Colors.red),
                          )),
                      // ignore: deprecated_member_use
                      FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Так',
                          style: TextStyle(
                              color: Color(0xff1DCDFE),
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  );
                },
                barrierDismissible: true);
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
          elevation: 5,
          child: Container(
            padding: EdgeInsets.all(10),
            child: new StaggeredGridView.count(
              shrinkWrap: true,
              crossAxisCount: 4,
              staggeredTiles: [
                const StaggeredTile.count(1, 2),
                const StaggeredTile.count(3, 2),
              ],
              mainAxisSpacing: 1.0,
              crossAxisSpacing: 5.0,
              padding: const EdgeInsets.all(4.0),
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  child: Image.network(
                    element.imgSymbol,
                    height: 100,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  alignment: Alignment.centerLeft,
                  child: Wrap(
                    direction: Axis.horizontal,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
