import 'Model.dart';

class BlogPost extends Model {
  int idPost;
  String title;
  String category;
  String information;
  bool isLocked;
  String img;
  bool liked;

  BlogPost({
    this.idPost,
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
