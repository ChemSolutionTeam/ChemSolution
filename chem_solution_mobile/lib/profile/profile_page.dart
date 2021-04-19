import 'package:chem_solution_mobile/profile/liked_posts.dart';
import 'package:flutter/material.dart';
import 'package:chem_solution_mobile/main.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:chem_solution_mobile/assets/alerts.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Widget _card(double w, double h, Color color, String text, Icon icon) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Card(
        color: color,
        elevation: 5,
        child: Container(
          width: w,
          height: h,
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: TextStyle(color: Color(0xff2F455C), fontSize: 20),
              ),
              icon,
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!autorised) {
      return Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => LikedPosts(),
                  ),
                );
              },
              child: _card(
                MediaQuery.of(context).size.width * 0.9,
                MediaQuery.of(context).size.height * 0.1,
                Colors.white,
                'Збережене',
                Icon(
                  CommunityMaterialIcons.heart,
                  color: Colors.red,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                return alertDialogShow(context, autorisation(context), 400);
              },
              child: _card(
                MediaQuery.of(context).size.width * 0.9,
                MediaQuery.of(context).size.height * 0.1,
                Color(0xff1DCDFE),
                'Авторизуватися',
                Icon(
                  Icons.verified_user,
                  color: Color(0xff2F455C),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }
}
