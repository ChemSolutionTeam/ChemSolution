import 'package:chem_solution_mobile/assets/colors.dart';
import 'package:chem_solution_mobile/models/Achievement.dart';
import 'package:flutter/material.dart';

class AchivementCard extends StatelessWidget {
  Achievement achievement;
  AchivementCard({Key key, this.achievement}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 5,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListTile(
            leading: Image.network(achievement.imgAchievement),
            title: Text(
              achievement.heading,
              style: TextStyle(
                  color: themeDark, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              achievement.description,
              style: TextStyle(
                color: themeDark,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
