import 'package:chem_solution_mobile/assets/alerts.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  MyProfile({Key key}) : super(key: key);

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  Widget _tile(IconData data, String title, String subtitle) {
    return Container(
      padding: EdgeInsets.all(15),
      child: ListTile(
        leading: Icon(
          data,
          color: Color(0xff21D0B2),
        ),
        title: Text(
          title,
          style: TextStyle(
              color: Color(0xff2F455C),
              fontWeight: FontWeight.w700,
              fontSize: 20),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
              color: Color(0xff2F455C),
              fontWeight: FontWeight.w400,
              fontSize: 30),
        ),
      ),
    );
  }

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
        body: Container(
          alignment: Alignment.center,
          child: ListView(
            children: [
              _tile(CommunityMaterialIcons.face_profile, 'Логін', 'login'),
              _tile(Icons.mail, 'Електронна пошта', 'blabla@nure.ua'),
              _tile(Icons.cake, 'Дата народження', '18.12.2000'),
              //must add needed icons
              _tile(CommunityMaterialIcons.cash, 'Баланс', '2000'),
              _tile(CommunityMaterialIcons.scoreboard, 'Рейтинг', '2000'),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Color(0xff2F455C),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: Row(mainAxisAlignment: MainAxisAlignment.end,
            children: [
                 TextButton(
              onPressed: () {
                toBrowser(context, 'https://www.google.com', 'Редагування даних');
              },
              child: Text(
                'Редагувати',
                style: TextStyle(color: Color(0xff21D0B2), fontSize: 20),
              ),
            ),
            ],),
          ),
        ),
      ),
    );
  }
}
