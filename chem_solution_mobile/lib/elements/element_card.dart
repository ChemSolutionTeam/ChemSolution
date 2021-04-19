import 'package:chem_solution_mobile/elements/element_info.dart';
import 'package:chem_solution_mobile/main.dart';
import 'package:chem_solution_mobile/models/ChemElement.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
  AnimationController _controller;
  Animation _myAnimation;
  _ElementCardState(this.element);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1200),
    );
    _myAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _rowInfo(String name, String value) {
    return Container(
      child: FadeTransition(
              opacity: _myAnimation,
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
