import 'package:chem_solution_mobile/blog/blog_page.dart';
import 'package:chem_solution_mobile/elements/elements_page.dart';
import 'package:chem_solution_mobile/info/informations_page.dart';
import 'package:chem_solution_mobile/profile/profile_page.dart';
import 'package:chem_solution_mobile/widgets/search_field.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:chem_solution_mobile/assets/colors.dart';

class ChemSolutionWidget extends StatefulWidget {
  ChemSolutionWidget({Key key}) : super(key: key);

  @override
  _ChemSolutionWidgetState createState() => _ChemSolutionWidgetState();
}

class _ChemSolutionWidgetState extends State<ChemSolutionWidget> {
  int _selectedIndex = 0;
  bool _isSearch = false;
  String searchValue = '';
  static List<Widget> _widgetOptions;
  final blogKey = GlobalKey<BlogsState>();
  final infoKey = GlobalKey<InformationsState>();
  final elementKey = GlobalKey<ElementsState>();

  void goSearch() {
    switch (_selectedIndex) {
      case 0:
        elementKey.currentState.getSearch(searchValue);
        break;
      case 1:
        blogKey.currentState.getSearch(searchValue);
        break;
      case 2:
        infoKey.currentState.getSearch(searchValue);
        break;
      default:
        break;
    }
  }

  void getOptions() {
    _widgetOptions = <Widget>[
      Elements(
        search: searchValue,
        key: elementKey,
      ),
      Blogs(
        search: searchValue,
        key: blogKey,
      ),
      Informations(
        search: searchValue,
        key: infoKey,
      ),
      Profile(),
    ];
  }

  @override
  void initState() {
    super.initState();
    getOptions();
  }

  static List<String> _searchItems = [
    'Введіть назву елемент',
    'Введіть факт чи новину',
    'Введіть шпаргалку',
  ];

  void _onItemTapped(int index) {
    setState(() {
      getOptions();
      _selectedIndex = index;
      _checkSearch();
    });
  }

  void _checkSearch() {
    if (_selectedIndex == 3) {
      _isSearch = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) {
        if (details.primaryVelocity > 0) {
          setState(() {
            if (_selectedIndex > 0) _selectedIndex -= 1;
            _checkSearch();
          });
        } else if (details.primaryVelocity < 0) {
          setState(() {
            if (_selectedIndex < 3) _selectedIndex += 1;
            _checkSearch();
          });
        }
      },
      child: Scaffold(
        backgroundColor: Color(0xffEBFAFF),
        appBar: AppBar(
          backgroundColor: themeDark,
          title: ListTile(
            leading: _isSearch
                ? null
                : Image.asset(
                    'assets/images/logo2.png',
                    width: 40.0,
                    height: 40.0,
                  ),
            title: !_isSearch
                ? Text(
                    'ChemSolution',
                    style: TextStyle(
                        color: themeGreen,
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0),
                  )
                : TextField(
                    onSubmitted: (value) {
                      setState(() {
                        searchValue = value;
                        goSearch();
                        getOptions();
                      });
                    },
                    style: TextStyle(
                      color: themeBlue,
                    ),
                    decoration: searchDecor(_searchItems[_selectedIndex]),
                  ),
            trailing: _selectedIndex == 3
                ? null
                : IconButton(
                    onPressed: () {
                      setState(() {
                        _isSearch = !_isSearch;
                        searchValue = '';
                        if (!_isSearch) {
                          goSearch();
                        }
                        getOptions();
                      });
                    },
                    icon: searchIcon(_isSearch),
                  ),
          ),
        ),
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(canvasColor: themeDark),
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
            selectedItemColor: themeGreen,
            unselectedItemColor: Color(0xffEBFAFF),
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
