import 'package:chem_solution_mobile/models/Model.dart';
import 'package:chem_solution_mobile/models/Status.dart';
import 'User.dart';

class Request extends Model {
  String userEmail;
  String dateTimeSended;
  String theme;
  String text;
  User user;
  int statusId;
  Status status;



  Request({
    this.dateTimeSended,
    this.text,
    this.theme,
    this.user,
    this.userEmail,
    this.statusId,
    this.status,
  });


    DateTime get dateTimeSendedDT {
    RegExp regex = new RegExp(r'(\d{4})-(\d{2})-(\d{2})');
    Match match = regex.firstMatch(dateTimeSended);
    return DateTime(
      int.parse(match.group(1)),
      int.parse(match.group(2)),
      int.parse(match.group(3)),
    );
  }

  String get dateTimeSendeToString {
    String day = '${dateTimeSendedDT.day}'.padLeft(2, '0');
    String month = '${dateTimeSendedDT.month}'.padLeft(2, '0');
    return '$day:$month:${dateTimeSendedDT.year}';
  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = new Map<String, dynamic>();
    map['userEmail'] = userEmail;
    map['dateTimeSended'] = dateTimeSended;
    map['theme'] = theme;
    map['text'] = text;
    map['user'] = user.toMap();
    map['statusId'] = statusId;
    map['status'] = status.toMap();
    return map;
  }

  static Request fromObject(dynamic o) {
    Request r = new Request();
    r.dateTimeSended = o['dateTimeSended'];
    r.text = o['text'];
    r.theme = o['theme'];
  //  r.user = User.fromObject(o['user']);
    r.userEmail = o['userEmail'];
    r.statusId = o['statusId'];
    r.status = Status.fromObject(o['status']);
    return r;
  }
}
