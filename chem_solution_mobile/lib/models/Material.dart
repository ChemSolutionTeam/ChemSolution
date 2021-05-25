import 'dart:convert';

import 'package:chem_solution_mobile/assets/colors.dart';
import 'package:chem_solution_mobile/assets/images.dart';
import 'package:chem_solution_mobile/assets/toasts.dart';
import 'package:chem_solution_mobile/main.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'Model.dart';
import 'MaterialGroup.dart';
import 'package:http/http.dart' as http;

class Material extends Model {
  int id;
  String image;
  String formula;
  String name;
  String info;

  // List<CS.Element> elements = [];
  // List<User> users = [];
  // List<ElementMaterial> elementMaterials = [];
  // List<ResearchHistory> researchHistories = [];
  MaterialGroup materialGroup;
  int materialGroupId;

  Material({
    this.id,
    this.image,
    this.formula,
    this.name,
    this.info,
    this.materialGroup,
    // this.elementMaterials,
    // this.elements,
    this.materialGroupId,
    // this.researchHistories,
    //this.users
  });

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = new Map<String, dynamic>();
    map['id'] = id;
    map['image'] = image;
    map['formula'] = formula;
    map['name'] = name;
    map['info'] = info;
    /* List<Map<String, dynamic>> elementsMaps = [];
    elements.forEach((element) {
      elementsMaps.add(element.toMap());
    });
    map['elements'] = elementsMaps;
    List<Map<String, dynamic>> usersMaps = [];
    users.forEach((element) {
      usersMaps.add(element.toMap());
    });
    map['users'] = usersMaps;
    List<Map<String, dynamic>> elementMaterialsMaps = [];
    elementMaterials.forEach((element) {
      elementMaterialsMaps.add(element.toMap());
    });
    map['elementMaterials'] = elementMaterialsMaps;
    List<Map<String, dynamic>> researchHistoriesMaps = [];
    researchHistories.forEach((element) {
      researchHistoriesMaps.add(element.toMap());
    });
    map['researchHistories'] = researchHistoriesMaps; */
    map['materialGroup'] = materialGroup.toMap();
    map['materialGroupId'] = materialGroupId;
    return map;
  }

  static Material fromObject(dynamic o) {
    Material m = new Material();
    m.id = o['id'];
    m.image = o['image']?? notFound;
    m.formula = o['formula'];
    m.name = o['name'];
    m.info = o['info'];
    m.materialGroupId = o['materialGroupId'];

    //  m.materialGroup = MaterialGroup.fromObject(o['materialGroup']);

    m.materialGroup =
        MaterialGroup(materialGroupId: m.materialGroupId, groupName: '1');
    /*  
    o['elementMaterials'].forEach((e) {
      m.elementMaterials.add(ElementMaterial.fromObject(e));
    });
    o['elements'].forEach((e) {
      m.elements.add(CS.Element.fromObject(e));
    });
    o['researchHistories'].forEach((e) {
      m.researchHistories.add(ResearchHistory.fromObject(e));
    });
    o['users'].forEach((e) {
      m.users.add(User.fromObject(e));
    });
*/
    return m;
  }

  static Future<List<Material>> fetchObjects({@required String path}) async {
    final response = await http.get(Uri.http(chemURL, path));

    if (response.statusCode == 200) {
      List<Material> list = [];
      jsonDecode(response.body).forEach((e) {
        list.add(Material.fromObject(e));
      });
      return list;
    } else {
      throw Exception('Failed to load');
    }
  }

   // ignore: missing_return
  static Future<Material> fetchObject({@required String path}) async {
    try {
      final response = await http.get(Uri.http(chemURL, 'Materials/$path'));
      if (response.statusCode == 200) {
        return Material.fromObject(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load');
      }
    } catch (ex) {
      showToast('Помилка підключення', themeRed, themeDarkRed,
          Icons.error, FToast());
    }
  }
}
