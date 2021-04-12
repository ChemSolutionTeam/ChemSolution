import 'Model.dart';

class BlogPost extends Model {
  String title;
  String category;
  String image;
  String information;
  bool isLocked;

  BlogPost({
    this.title,
    this.category,
    this.image,
    this.information,
    this.isLocked,
  });

  @override
  Map<String, dynamic> toMap() {
    // TODO: implement toMap
    throw UnimplementedError();
  }
}
