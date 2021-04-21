import 'package:chem_solution_mobile/models/Model.dart';
import 'User.dart';

class Request extends Model {
  String userEmail;
  DateTime dateTimeSended;
  String theme;
  String text;
  User user;

  Request({
    this.dateTimeSended,
    this.text,
    this.theme,
    this.user,
    this.userEmail,
  });

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = new Map<String, dynamic>();
    map['userEmail'] = userEmail;
    map['dateTimeSended'] = dateTimeSended;
    map['theme'] = theme;
    map['text'] = text;
    map['user'] = user.toMap();
    return map;
  }
}
