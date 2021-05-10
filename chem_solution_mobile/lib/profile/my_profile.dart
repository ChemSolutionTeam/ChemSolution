import 'package:chem_solution_mobile/assets/alerts.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:chem_solution_mobile/main.dart';

class MyProfile extends StatefulWidget {
  MyProfile({Key key}) : super(key: key);

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  Widget _tile(Widget icon, String title, String subtitle) {
    return Container(
      padding: EdgeInsets.all(15),
      child: ListTile(
        leading:
            icon,
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
              fontSize: 25),
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
              _tile(
                  Icon(
                    CommunityMaterialIcons.face_profile,
                    color: Color(0xff21D0B2),
                  ),
                  'Логін',
                  currentUser.userName),
              _tile(
                  Icon(
                    Icons.mail,
                    color: Color(0xff21D0B2),
                  ),
                  'Електронна пошта',
                  currentUser.userEmail),
              _tile(
                  Icon(
                    Icons.cake,
                    color: Color(0xff21D0B2),
                  ),
                  'Дата народження',
                  currentUser.birthdayToString),
              //must add needed icons
              _tile(
                  Image.asset(
                    'assets/images/AtomCoinGreen.png',
                    width: 30.0,
                    height: 30.0,
                  ),
                  'Баланс',
                  '${currentUser.balance}'),
              _tile(
                  Image.asset(
                    'assets/images/Trophy.png',
                    width: 30.0,
                    height: 30.0,
                  ),
                  'Рейтинг',
                  '${currentUser.rating}'),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Color(0xff2F455C),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    toBrowser(
                        context, 'https://www.google.com', 'Редагування даних');
                  },
                  child: Text(
                    'Редагувати',
                    style: TextStyle(color: Color(0xff21D0B2), fontSize: 20),
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
