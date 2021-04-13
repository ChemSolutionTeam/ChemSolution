import 'package:chem_solution_mobile/models/ChemElement.dart';
import 'package:flutter/material.dart';

class ElementInfo extends StatelessWidget {
  final ChemElement element;
  const ElementInfo({Key key, @required this.element}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) {
        if (details.primaryVelocity > 0) {
          Navigator.of(context).pop();
        }
      },
    );
  }
}
