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

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
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


  AnimationController _controller;
  Animation<Offset> _offsetAnimationToLeft;
  Animation<Offset> _offsetAnimationToRight;



  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1250),
      vsync: this,
    );
    _controller.forward();
     _offsetAnimationToLeft = Tween<Offset>(
      begin: Offset(1, 0),
      end: const Offset(0, 0), //easeInOut
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticInOut)); 
    _offsetAnimationToRight = Tween<Offset>(
      begin: const Offset(-1, 0),
      end: Offset(0, 0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticInOut));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!autorised) {
      return Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SlideTransition(
              position: _offsetAnimationToLeft,
              child: GestureDetector(
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
            ),
            SlideTransition(
              position: _offsetAnimationToRight,
              child: GestureDetector(
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
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }
}
