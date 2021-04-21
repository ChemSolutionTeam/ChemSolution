import 'Model.dart';
import 'User.dart';

class BlogPost extends Model {
  int blogPostId;
  String title;
  String category;
  String information;
  bool isLocked;
  String image;
  List<User> users = [];

  BlogPost(
      {this.blogPostId,
      this.title,
      this.category,
      this.information,
      this.isLocked,
      this.image,
      this.users});

  bool liked(User user) {
    if (user == null) return false;
    return user.blogPosts.indexOf(this) > -1;
  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = new Map<String, dynamic>();
    map['blogPostId'] = blogPostId;
    map['title'] = title;
    map['category'] = category;
    map['information'] = information;
    map['isLocked'] = isLocked;
    map['image'] = image;
    List<Map<String, dynamic>> usersMaps = [];
    users.forEach((element) {
      usersMaps.add(element.toMap());
    });
    map['users'] = usersMaps;
    return map;
  }
}
