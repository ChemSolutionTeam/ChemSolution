import 'package:chem_solution_mobile/models/Model.dart';

class Status extends Model {
  int statusId;
  String statusName;

  Status({this.statusId, this.statusName});

  @override
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['statusId'] = statusId;
    map['statusName'] = statusName;
    return map;
  }

  static Status fromObject(dynamic o) {
    Status s = new Status();
    s.statusId = o['statusId'];
    s.statusName = o['statusName'];
    return s;
  }
}
