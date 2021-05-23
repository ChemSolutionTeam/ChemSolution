import 'package:chem_solution_mobile/main.dart';
import 'package:chem_solution_mobile/models/Material.dart' as CS;
import 'package:chem_solution_mobile/models/MaterialGroup.dart';
import 'package:chem_solution_mobile/profile/material_card.dart';
import 'package:chem_solution_mobile/widgets/nothing_find.dart';
import 'package:chem_solution_mobile/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:chem_solution_mobile/assets/colors.dart';

class Materials extends StatefulWidget {
  Materials({Key key}) : super(key: key);

  @override
  _MaterialsState createState() => _MaterialsState();
}

class _MaterialsState extends State<Materials>
    with SingleTickerProviderStateMixin {
  String search = '';
  List<CS.Material> allMaterials = [];
  List<CS.Material> filterMaterials = [];
  List<Widget> materials = [];
  bool _isSearch = false;
  final GlobalKey<AnimatedListState> _key = new GlobalKey<AnimatedListState>();

  AnimationController _controller;
  Animation<Offset> _offsetAnimationToLeft;
  Animation<Offset> _offsetAnimationToRight;

  bool _condition(CS.Material material) {
    return material.name.toLowerCase().indexOf(search.toLowerCase()) > -1 ||
        material.formula.toLowerCase().indexOf(search.toLowerCase()) > -1 ||
        material.materialGroup.groupName
                .toLowerCase()
                .indexOf(search.toLowerCase()) >
            -1 ||
        material.info.toLowerCase().indexOf(search.toLowerCase()) > -1;
  }

  void ifEmptyMaterials() {
    if (materials == null || materials.length == 0) {
      materials.add(NothingFind());
      _key.currentState.insertItem(0);
    }
  }

  void getSearch(String value) {
    setState(() {
      search = value;
      for (int i = 0; i < materials.length; i++) {
        _key.currentState.removeItem(0, (context, animation) => null);
      }
      filterMaterials = [];
      materials = [];
      allMaterials.forEach((material) {
        if (_condition(material)) filterMaterials.add(material);
      });
      filterMaterials = filterMaterials.reversed.toList();
      for (int i = 0; i < filterMaterials.length; i++) {
        materials.insert(0, MaterialCard(material: filterMaterials[i]));
        _key.currentState.insertItem(0);
      }
      ifEmptyMaterials();
    });
  }

  Future<void> _addMaterials() {
    /*  allMaterials = [
      new CS.Material(
        id: 1,
        image:
            'https://img02.flagma.ua/photo/sernaya-kislota-40-sirchana-kislota-h2so4-16359806_big.jpg',
        formula: 'Ca(OH)2',
        name: 'Кальцій гідроксид',
        info: 'бла бла',
        materialGroup: MaterialGroup(groupName: 'Луги'),
      ),
      new CS.Material(
        id: 2,
        image:
            'https://img02.flagma.ua/photo/sernaya-kislota-40-sirchana-kislota-h2so4-16359806_big.jpg',
        formula: 'H2SO4',
        name: 'Сульфатна кислота',
        info: 'бла бла бла',
        materialGroup: MaterialGroup(groupName: 'Кислоти'),
      ),
      new CS.Material(
        id: 3,
        image: 'https://altenergy.in.ua/wp-content/uploads/2016/10/co2.jpg',
        formula: 'CO2',
        name: 'Карбон оксид',
        info: 'бла бла бла',
        materialGroup: MaterialGroup(groupName: 'Кислотні оксиди'),
      ),
    ];
*/

    allMaterials = currentUser.materials;

    allMaterials.forEach((element) {
      if ((search != null || search != '') && _condition(element)) {
        materials.add(MaterialCard(material: element));
        _key.currentState.insertItem(materials.length - 1);
        filterMaterials.add(element);
      }
    });

    ifEmptyMaterials();
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
      _addMaterials();
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
        backgroundColor: Color(0xffEBFAFF),
        appBar: new AppBar(
          backgroundColor: themeDark,
          title: ListTile(
            title: _isSearch
                ? TextField(
                    onSubmitted: (value) {
                      getSearch(value);
                    },
                    style: TextStyle(
                      color: themeBlue,
                    ),
                    decoration: searchDecor('Введіть речовину'),
                  )
                : Text(
                    'Відкриті речовини',
                    style: TextStyle(
                        color: themeGreen,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
            trailing: IconButton(
              onPressed: () {
                setState(() {
                  _isSearch = !_isSearch;
                  if (!_isSearch) {
                    getSearch('');
                  }
                });
              },
              icon: searchIcon(_isSearch),
            ),
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
                child: materials[index],
              );
            },
            initialItemCount: materials.length,
          ),
        ),
      ),
    );
  }
}
