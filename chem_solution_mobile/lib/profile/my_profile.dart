import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  MyProfile({Key key}) : super(key: key);

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) {
        if (details.primaryVelocity > 0) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        backgroundColor: Color(0xffEBFAFF),
        appBar: new AppBar(
          backgroundColor: Color(0xff2F455C),
          title: new Text(
            'Мій профіль',
            style: TextStyle(
                color: Color(0xff21D0B2),
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(),
      ),
    );
  }
}
