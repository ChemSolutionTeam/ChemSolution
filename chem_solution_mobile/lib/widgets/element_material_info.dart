import 'package:flutter/material.dart';
import 'package:chem_solution_mobile/assets/colors.dart';

Widget scaffoldInfo(BuildContext context, String title, Column column) {
  return GestureDetector(
    onHorizontalDragEnd: (DragEndDetails details) {
      if (details.primaryVelocity > 0) {
        Navigator.of(context).pop();
      }
    },
    child: Scaffold(
      backgroundColor: Color(0xffEBFAFF),
      appBar: AppBar(
        backgroundColor: themeDark,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(title,
              style: TextStyle(
                  color: themeGreen,
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0)),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: column,
        ),
      ),
    ),
  );
}

Widget info(String title, String info) {
  return Container(
    alignment: Alignment.centerLeft,
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    child: Flexible(
      child: Wrap(
        children: [
          Text(
            title,
            style: TextStyle(
                color: themeDark, fontSize: 16.0, fontWeight: FontWeight.w700),
          ),
          Text(
            info,
            style: TextStyle(
              color: themeDark,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget img(String img) {
  return Container(
    alignment: Alignment.center,
    padding: EdgeInsets.all(20.0),
    child: Image.network(
      img,
      fit: BoxFit.fitWidth,
    ),
  );
}
