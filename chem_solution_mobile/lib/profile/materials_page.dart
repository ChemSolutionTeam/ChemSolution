import 'package:chem_solution_mobile/models/Molecule.dart';
import 'package:chem_solution_mobile/profile/material_card.dart';
import 'package:chem_solution_mobile/widgets/search_field.dart';
import 'package:flutter/material.dart';

class Materials extends StatefulWidget {
  Materials({Key key}) : super(key: key);

  @override
  _MaterialsState createState() => _MaterialsState();
}

class _MaterialsState extends State<Materials>
    with SingleTickerProviderStateMixin {
  List<Widget> _materials = [];
  bool _isSearch = false;
  final GlobalKey<AnimatedListState> _key = new GlobalKey<AnimatedListState>();

  AnimationController _controller;
  Animation<Offset> _offsetAnimationToLeft;
  Animation<Offset> _offsetAnimationToRight;

  void _addMaterials() {
    List<Molecule> temp = [
      new Molecule(
        idMaterial: 1,
        image:
            'https://lh3.googleusercontent.com/proxy/mo5YkbgOTkcb-5VOl3iYSchHP8JijvWSznG7OItQOdjTg5cpm0THdCSYXq-aRipP_ozX9kTKhSgTqk6E_65abunjlraDDUA2X6z7_uT1YvrkcoZTrdrSVYdFIH6xO2YNkFTVaTWvxMTenee2jjNH0_LOOqBR98ac0rPEY6_15y5CG2osC2Q4',
        formula: 'Ca(OH)2',
        name: 'Кальцій гідроксид',
        info: 'бла бла',
        materialGroup: 'Луги',
      ),
      new Molecule(
        idMaterial: 2,
        image:
            'https://img02.flagma.ua/photo/sernaya-kislota-40-sirchana-kislota-h2so4-16359806_big.jpg',
        formula: 'H2SO4',
        name: 'Сульфатна кислота',
        info: 'бла бла бла',
        materialGroup: 'Кислоти',
      ),
      new Molecule(
        idMaterial: 3,
        image: 'https://altenergy.in.ua/wp-content/uploads/2016/10/co2.jpg',
        formula: 'CO2',
        name: 'Карбон оксид',
        info: 'бла бла бла',
        materialGroup: 'Кислотні оксиди',
      ),
    ];

    temp.forEach((element) {
      _materials.add(MaterialCard(material: element));
      _key.currentState.insertItem(_materials.length - 1);
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
          backgroundColor: Color(0xff2F455C),
          title: ListTile(
            title: _isSearch
                ? TextField(
                    style: TextStyle(
                      color: Color(0xff1dcdfe),
                    ),
                    decoration: searchDecor('Введіть речовину'),
                  )
                : Text(
                    'Відкриті речовини',
                    style: TextStyle(
                        color: Color(0xff21D0B2),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
            trailing: IconButton(
              onPressed: () {
                setState(() {
                  _isSearch = !_isSearch;
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
                child: _materials[index],
              );
            },
            initialItemCount: _materials.length,
          ),
        ),
      ),
    );
  }
}
