import 'Model.dart';

class BlogPost extends Model {
  String title;
  String category;
  String information;
  bool isLocked;
  String img;

  BlogPost({
    this.title,
    this.category,
    this.information,
    this.isLocked,
    this.img,
  });

  @override
  Map<String, dynamic> toMap() {
    // TODO: implement toMap
    throw UnimplementedError();
  }
}
