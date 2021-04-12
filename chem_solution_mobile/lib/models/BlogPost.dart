import 'Model.dart';

class BlogPost extends Model {
  String title;
  String category;
  String information;
  bool isLocked;
  String img;
  bool liked;

  BlogPost({
    this.title,
    this.category,
    this.information,
    this.isLocked,
    this.img,
    this.liked
  });

  @override
  Map<String, dynamic> toMap() {
    // TODO: implement toMap
    throw UnimplementedError();
  }
}
