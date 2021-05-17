import 'package:chem_solution_mobile/elements/element_card.dart';
import 'package:chem_solution_mobile/models/Category.dart' as CSC;
import 'package:chem_solution_mobile/models/Element.dart' as CS;
import 'package:chem_solution_mobile/models/Valence.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Elements extends StatefulWidget {
  Elements({Key key}) : super(key: key);

  @override
  _ElementsState createState() => _ElementsState();
}

class _ElementsState extends State<Elements>
    with SingleTickerProviderStateMixin {
  List<Widget> elements = [];
  final GlobalKey<AnimatedListState> _key = new GlobalKey<AnimatedListState>();

  AnimationController _controller;
  Animation<Offset> _offsetAnimationToLeft;
  Animation<Offset> _offsetAnimationToRight;

  void _addElements() {
    List<CS.Element> temp = [
      new CS.Element(
          elementId: 1,
          symbol: 'H',
          name: 'Гідроген',
          category: CSC.Category(categoryName: 'Неметали'),
          atomicWeight: 1.008,
          valences: [Valence(valenceVal: 1)],
          isLocked: false,
          imgSymbol:
              'https://i.yaklass.by/res/659b46b2-754a-414f-a138-1149c2710f01/vodorod.jpg',
          imgAtom:
              'https://indicator.ru/thumb/2250x0/filters:quality(75):no_upscale()/imgs/2019/08/13/13/3515248/e388b0fea75f40fa2f7f992e2825a976b85eb50f.jpg'),
      new CS.Element(
          elementId: 2,
          symbol: 'He',
          name: 'Гелій',
          category: CSC.Category(categoryName: 'Благородні гази'),
          atomicWeight: 2.0026,
          isLocked: false,
          valences: [Valence(valenceVal: 2)],
          imgSymbol:
              'https://znaesh-kak.com/wp-content/uploads/2020/04/3-200x200.jpg',
          imgAtom:
              'https://indicator.ru/thumb/2250x0/filters:quality(75):no_upscale()/imgs/2019/08/13/13/3515247/3d8071dc86532a650e3f0b457b02f5ef4ef18f5d.jpg'),
    ];

    temp.forEach((element) {
      elements.add(ElementCard(element: element));
      _key.currentState.insertItem(elements.length - 1);
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1250),
      vsync: this,
    );
    _controller.forward();
    _offsetAnimationToLeft = Tween<Offset>(
      begin: Offset(1, 0),
      end: const Offset(0, 0), //easeInOut
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticInOut));
    _offsetAnimationToRight = Tween<Offset>(
      begin: const Offset(-1, 0),
      end: Offset(0, 0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticInOut));
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _addElements();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AnimatedList(
        key: _key,
        shrinkWrap: true,
        itemBuilder: (context, index, animation) {
          return SlideTransition(
            position: index % 2 == 0
                ? _offsetAnimationToLeft
                : _offsetAnimationToRight,
            child: elements[index],
          );
        },
        initialItemCount: elements.length,
      ),
    );
  }
}
