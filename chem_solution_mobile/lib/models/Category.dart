import 'package:chem_solution_mobile/models/Element.dart' as CS;
import 'package:chem_solution_mobile/models/Model.dart';

class Category extends Model {
  int categoryId;
  List<CS.Element> elements = [];
  String categoryName;

  Category({this.categoryId, this.categoryName, this.elements});

  @override
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['categoryId'] = categoryId;
    map['categoryName'] = categoryName;
    List<Map<String, dynamic>> el = [];
    elements.forEach((element) {
      el.add(element.toMap());
    });
    map['elements'] = el;
  }

  static Category fromObject(dynamic o) {
    Category c = new Category();
    c.categoryId = o['categoryId'];
    c.categoryName = o['categoryName'];
    List<CS.Element> el = [];
    o['elements'].forEach((elem) {
      el.add(CS.Element.fromObject(elem));
    });
    c.elements = el;
    return c;
  }
}
