import 'package:chem_solution_mobile/elements/element_card.dart';
import 'package:chem_solution_mobile/models/ChemElement.dart';
import 'package:flutter/material.dart';

class Elements extends StatefulWidget {
  Elements({Key key}) : super(key: key);

  @override
  _ElementsState createState() => _ElementsState();
}

List<ChemElement> elements = [
  new ChemElement(
      idElement: 1,
      symbol: 'H',
      name: 'Гідроген',
      category: 'Неметали',
      atomicWeight: 1.008,
      valence: ['I'],
      isLocked: false,
      imgSymbol:
          'https://i.yaklass.by/res/659b46b2-754a-414f-a138-1149c2710f01/vodorod.jpg',
      imgAtom:
          'https://indicator.ru/thumb/2250x0/filters:quality(75):no_upscale()/imgs/2019/08/13/13/3515248/e388b0fea75f40fa2f7f992e2825a976b85eb50f.jpg'),
  new ChemElement(
      idElement: 2,
      symbol: 'He',
      name: 'Гелій',
      category: 'Благородні гази',
      atomicWeight: 2.0026,
      isLocked: false,
      valence: ['II'],
      imgSymbol:
          'https://znaesh-kak.com/wp-content/uploads/2020/04/3-200x200.jpg',
      imgAtom:
          'https://indicator.ru/thumb/2250x0/filters:quality(75):no_upscale()/imgs/2019/08/13/13/3515247/3d8071dc86532a650e3f0b457b02f5ef4ef18f5d.jpg'),
];

class _ElementsState extends State<Elements> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return ElementCard(element: elements[index]);
        },
        itemCount: elements.length,
      ),
    );
  }
}
