import 'dart:convert';

import 'package:chem_solution_mobile/main.dart';
import 'package:chem_solution_mobile/models/Category.dart';
import 'package:chem_solution_mobile/models/ElementMaterial.dart';
import 'package:chem_solution_mobile/models/Material.dart' as CS;
import 'package:flutter/material.dart';
import 'User.dart';
import 'Valence.dart';
import 'Model.dart';
import 'package:http/http.dart' as http;

class Element extends Model {
  int elementId;
  String symbol;
  String name;
  double atomicWeight;
  int neutronQuantity;
  int atomicRadius;
  dynamic electronegativity;
  int energyLevels;
  int meltingTemperature;
  int boilingTemperature;
  bool isLocked;
  String info;
  String imgSymbol;
  String imgAtom;
  int group;
  int categoryId;
  Category category;

  // List<User> users = [];
  // List<CS.Material> materials = [];
  List<Valence> valences = [];
  // List<ElementMaterial> elementMaterials = [];

  int get electronQuantity => elementId;
  int get protonQuantity => elementId;

  Element({
    this.elementId,
    this.symbol,
    this.name,
    this.atomicWeight,
    this.neutronQuantity,
    this.atomicRadius,
    this.electronegativity,
    this.category,
    this.energyLevels,
    this.meltingTemperature,
    this.boilingTemperature,
    this.isLocked,
    this.info,
    this.imgAtom,
    this.group,
    this.imgSymbol,
    this.categoryId,
    //  this.users,
    // this.materials,
    this.valences,
    //   this.elementMaterials,
  });

  String getValence() {
    String _valence = '';
    for (Valence val in valences) {
      String value;
      switch (val.valenceVal) {
        case 1:
          value = 'I';
          break;
        case 2:
          value = 'II';
          break;
        case 3:
          value = 'III';
          break;
        case 4:
          value = 'IV';
          break;
        case 5:
          value = 'V';
          break;
        case 6:
          value = 'VI';
          break;
        case 7:
          value = 'VII';
          break;
        case 8:
          value = 'VIII';
          break;
      }
      _valence += value + " ";
    }
    return _valence;
  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = new Map<String, dynamic>();
    map['elementId'] = elementId;
    map['symbol'] = symbol;
    map['name'] = name;
    map['atomicWeight'] = atomicWeight;
    map['neutronQuantity'] = neutronQuantity;
    map['atomicRadius'] = atomicRadius;
    map['electronegativity'] = electronegativity;
    map['category'] = category.toMap();
    map['categoryId'] = categoryId;
    map['energyLevels'] = energyLevels;
    map['meltingTemperature'] = meltingTemperature;
    map['boilingTemperature'] = boilingTemperature;
    map['isLocked'] = isLocked;
    map['info'] = info;
    map['imgAtom'] = imgAtom;
    map['group'] = group;
    map['imgSymbol'] = imgSymbol;
    /*   List<Map<String, dynamic>> usersMaps = [];
    users.forEach((element) {
      usersMaps.add(element.toMap());
    });
    map['users'] = usersMaps;
    List<Map<String, dynamic>> materialsMaps = [];
    materials.forEach((element) {
      materialsMaps.add(element.toMap());
    });
    map['materials'] = materialsMaps;

 List<Map<String, dynamic>> elementMaterialsMaps = [];
    elementMaterials.forEach((element) {
      elementMaterialsMaps.add(element.toMap());
    });
    map['elementMaterials'] = elementMaterials; */

    List<Map<String, dynamic>> valencesMaps = [];
    valences.forEach((element) {
      valencesMaps.add(element.toMap());
    });

    map['valences'] = valencesMaps;

    return map;
  }

  static Element fromObject(dynamic o) {
    Element e = new Element();
    e.elementId = o['elementId'];
    e.symbol = o['symbol'];
    e.name = o['name'];
    e.atomicWeight = o['atomicWeight'];
    e.neutronQuantity = o['neutronQuantity'];
    e.atomicRadius = o['atomicRadius'];
    e.electronegativity = o['electronegativity'];
    e.category = Category.fromObject(o['category']);
    e.categoryId = o['categoryId'];
    e.energyLevels = o['energyLevels'];
    e.meltingTemperature = o['meltingTemperature'];
    e.boilingTemperature = o['boilingTemperature'];
    e.isLocked = o['isLocked'];
    e.info = o['info'];
    e.imgAtom = o['imgAtom'];
    e.group = o['group'];
    e.imgSymbol = o['imgSymbol'];

    /*  o['users'].forEach((el) {
      e.users.add(User.fromObject(el));
    });

    o['materials'].forEach((el) async {
      e.materials.add(await CS.Material.fromObject(el));
    });
 o['elementMaterials'].forEach((el) {
      e.elementMaterials.add(ElementMaterial.fromObject(el));
    }); */

    List<Valence> v = [];
    o['valences'].forEach((el) {
      v.add(Valence.fromObject(el));
    });
    e.valences = v;
    print(e.valences.length);

    return e;
  }

  static Future<List<Element>> fetchObjects({@required String path}) async {
    final response = await http.get(Uri.http(chemURL, path));

    if (response.statusCode == 200) {
      List<Element> list = [];
      jsonDecode(response.body).forEach((e) {
        list.add(Element.fromObject(e));
      });
      return list;
    } else {
      throw Exception('Failed to load');
    }
  }
}
