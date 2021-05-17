import 'package:flutter/material.dart';
import 'package:chem_solution_mobile/assets/colors.dart';

Widget rowInfo(String name, String value) {
  return Wrap(
    direction: Axis.horizontal,
    children: [
      Container(
        child: Text(
          name,
          style: TextStyle(color: themeDark, fontSize: 16),
        ),
      ),
      Container(
          child: Text(
        value,
        style: TextStyle(
            color: themeDark,
            fontSize: 16,
            fontWeight: FontWeight.bold),
      )),
    ],
  );
}

Widget cardElementMaterial(String image, Color colorCard, Column column, double h) {
  return Card(
    color: colorCard,
    clipBehavior: Clip.antiAlias,
    elevation: 5,
    child: AnimatedContainer(
      decoration: BoxDecoration(
              color: colorCard,
            ),
      duration: Duration(milliseconds: 500),
      height: h,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: Container(
              alignment: Alignment.centerLeft,
              child: Image.network(
                image,
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
              child: column,
            ),
          )
        ],
      ),
    ),
  );
}
