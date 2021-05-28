import 'package:chem_solution_mobile/main.dart';
import 'package:chem_solution_mobile/models/Achievement.dart';
import 'package:chem_solution_mobile/widgets/achivement_card.dart';
import 'package:flutter/material.dart';
import 'package:chem_solution_mobile/assets/colors.dart';

class AchivementsPage extends StatefulWidget {
  AchivementsPage({Key key}) : super(key: key);

  @override
  _AchivementsPageState createState() => _AchivementsPageState();
}

class _AchivementsPageState extends State<AchivementsPage>
    with SingleTickerProviderStateMixin {
  List<Widget> achivements = [];
  final GlobalKey<AnimatedListState> _key = new GlobalKey<AnimatedListState>();

  AnimationController _controller;
  Animation<Offset> _offsetAnimationToLeft;
  Animation<Offset> _offsetAnimationToRight;

  void _addAchivements() {
    /*   List<Achievement> temp = [
      Achievement(
        imgAchievement:
            'http://files.school-collection.edu.ru/dlrstore/ac425a5f-377f-5f58-14f1-2aff690e960c/index.files/image002.jpg',
        heading: 'Перший луг',
        description: 'Було відкрито перший луг!!!',
      ),
      Achievement(
        imgAchievement:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9b/Salpetersaeure.jpg/181px-Salpetersaeure.jpg',
        heading: 'Перша кислота',
        description: 'Була відкрита перша кислота',
      ),
    ]; */

    List<Achievement> temp = currentUser.achievement;

    temp.forEach((element) {
      achivements.add(AchivementCard(achievement: element));
      _key.currentState.insertItem(achivements.length - 1);
    });
  }

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
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _addAchivements();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
        backgroundColor: themeLightBlue,
        appBar: new AppBar(
          backgroundColor: themeDark,
          title: new Text(
            'Мої досягнення',
            style: TextStyle(
                color: themeGreen, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          child: AnimatedList(
            key: _key,
            shrinkWrap: true,
            itemBuilder: (context, index, animation) {
              return SlideTransition(
                position: index % 2 == 0
                    ? _offsetAnimationToLeft
                    : _offsetAnimationToRight,
                child: achivements[index],
              );
            },
            initialItemCount: achivements.length,
          ),
        ),
      ),
    );
  }
}
