import 'package:chem_solution_mobile/assets/toasts.dart';
import 'package:chem_solution_mobile/main.dart';
import 'package:chem_solution_mobile/models/BlogPost.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:chem_solution_mobile/assets/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PostInfo extends StatefulWidget {
  final BlogPost post;
  final Function(bool) like;
  const PostInfo({Key key, @required this.post, this.like}) : super(key: key);

  @override
  _PostInfoState createState() => _PostInfoState(post: post, like: like);
}

class _PostInfoState extends State<PostInfo> {
  BlogPost post;
  Function(bool) like;
  _PostInfoState({this.post, this.like});
  bool liked;
  FToast fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
    liked = post.like(currentUser);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) {
        if (details.primaryVelocity > 0) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        floatingActionButton: autorised
            ? FloatingActionButton(
                backgroundColor: themeBlue,
                child: Icon(
                  // post.liked(currentUser)
                  liked ? Icons.favorite : Icons.favorite_border,
                  color:
                      //post.liked(currentUser)
                      liked ? themeDarkGreen : null,
                ),
                onPressed: () async {
                  if (liked) {
                    await post.removeFromLiked(currentUser);
                    showToast('Видалено з обраних', themeRed, themeDarkRed,
                        CommunityMaterialIcons.close, fToast);
                  } else {
                    await post.addToLiked(currentUser);

                    showToast('Додано до обраних', Colors.greenAccent,
                        themeDarkGreen, CommunityMaterialIcons.check, fToast);
                  }
                  setState(() {
                    liked = !liked;
                  });
                  like(liked);
                },
              )
            : null,
        backgroundColor: themeLightBlue,
        appBar: AppBar(
          backgroundColor: themeDark,
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(widget.post.title,
                style: TextStyle(
                    color: themeGreen,
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0)),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: Image.network(
                    widget.post.image,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Flexible(
                    child: Text(
                      widget.post.information,
                      style: TextStyle(
                        color: themeDark,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
