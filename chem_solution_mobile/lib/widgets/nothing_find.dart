import 'package:chem_solution_mobile/assets/colors.dart';
import 'package:flutter/material.dart';

class NothingFind extends StatelessWidget {
  const NothingFind({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(40),
        child: Text(
          'Нічого не знайдено :(',
          style: TextStyle(
            color: themeDark,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
