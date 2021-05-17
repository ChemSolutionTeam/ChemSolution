import 'package:chem_solution_mobile/models/Model.dart';
import 'package:chem_solution_mobile/models/Request.dart';

class Status extends Model {
  int statusId;
  List<Request> requests = [];
  String statusName;

  Status({this.requests, this.statusId, this.statusName});

  @override
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['statusId'] = statusId;
    List<Map<String, dynamic>> r = [];
    requests.forEach((element) {
      r.add(element.toMap());
    });
    map['requests'] = r;
    map['statusName'] = statusName;
    return map;
  }

  static Status fromObject(dynamic o) {
    Status s = new Status();
    s.statusId = o['statusId'];
    s.statusName = o['statusName'];

    List<Request> r = [];
    o['requests'].forEach((el) {
      r.add(Request.fromObject(el));
    });
    s.requests = r;
    return s;
  }
}
