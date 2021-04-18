
import 'package:chem_solution_mobile/blog/blog_page.dart';
import 'package:chem_solution_mobile/elements/elements_page.dart';
import 'package:chem_solution_mobile/info/informations_page.dart';
import 'package:chem_solution_mobile/profile/profile_page.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

class ChemSolutionWidget extends StatefulWidget {
  ChemSolutionWidget({Key key}) : super(key: key);

  @override
  _ChemSolutionWidgetState createState() => _ChemSolutionWidgetState();
}

class _ChemSolutionWidgetState extends State<ChemSolutionWidget> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Elements(),
    Blogs(),
    Informations(),
    Profile()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static AppBar _appBar = AppBar(
    backgroundColor: Color(0xff2F455C),
    title: ListTile(
      leading: Image.asset(
        'assets/images/logo2.png',
        width: 40.0,
        height: 40.0,
      ),
    
      title: Text(
        'ChemSolution',
        style: TextStyle(
            color: Color(0xff21D0B2),
            fontWeight: FontWeight.bold,
            fontSize: 24.0),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) {
        if (details.primaryVelocity > 0) {
          setState(() {
            if (_selectedIndex > 0) _selectedIndex -= 1;
          });
        } else if (details.primaryVelocity < 0) {
          setState(() {
            if (_selectedIndex < 3) _selectedIndex += 1;
          });
        }
      },
      child: Scaffold(
        backgroundColor: Color(0xffEBFAFF),
        appBar: _appBar,
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(canvasColor: Color(0xff2F455C)),
          child: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(CommunityMaterialIcons.atom), label: 'Елементи'),
              BottomNavigationBarItem(
                  icon: Icon(CommunityMaterialIcons.newspaper),
                  label: 'Новини та факти'),
              BottomNavigationBarItem(
                  icon: Icon(CommunityMaterialIcons.note_search),
                  label: 'Шпаргалки'),
              BottomNavigationBarItem(
                  icon: Icon(CommunityMaterialIcons.account),
                  label: 'Мій профіль'),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Color(0xff21D0B2),
            unselectedItemColor: Color(0xffEBFAFF),
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
