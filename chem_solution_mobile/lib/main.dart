import 'package:flutter/material.dart';
import 'package:community_material_icon/community_material_icon.dart';

void main() {
  runApp(ChemApp());
}

class ChemApp extends StatelessWidget {
  const ChemApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChemSolution',
      home: ChemSolutionWidget(),
      theme: ThemeData(        //fontFamily: 'Century Gothic',
        fontFamily: 'CenturyGothic',
      ),
    );
  }
}

class ChemSolutionWidget extends StatefulWidget {
  ChemSolutionWidget({Key key}) : super(key: key);

  @override
  _ChemSolutionWidgetState createState() => _ChemSolutionWidgetState();
}

class _ChemSolutionWidgetState extends State<ChemSolutionWidget> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Elements'),    
    Text('Blog'),
    Text('Information'),
    Text('Profile'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEBFAFF),      
      appBar: AppBar(
        backgroundColor: Color(0xff2F455C),
        title: ListTile(                  
          leading: Image.asset('assets/images/logo2.png',
          width: 40.0,
          height: 40.0,), 
          title: Text('ChemSolution',
          style: TextStyle(color: Color(0xffEBFAFF),
          fontWeight: FontWeight.bold,
          fontSize: 24.0),
          ),
        ),
      ),
      body: Container(
         child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Color(0xff2F455C)
        ),
              child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(CommunityMaterialIcons.atom),
              label: 'Елементи'),
            BottomNavigationBarItem(
              icon: Icon(CommunityMaterialIcons.newspaper),
              label: 'Новини'),
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
    );
  }
}
