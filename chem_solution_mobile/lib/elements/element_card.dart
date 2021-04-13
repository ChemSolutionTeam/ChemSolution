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
                if(!element.isLocked){

                } else{
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
