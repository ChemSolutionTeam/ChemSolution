import 'package:chem_solution_mobile/assets/toasts.dart';
import 'package:chem_solution_mobile/models/BlogPost.dart';
import 'package:chem_solution_mobile/widgets/post_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:chem_solution_mobile/assets/alerts.dart';
import 'package:chem_solution_mobile/main.dart';
import 'package:chem_solution_mobile/assets/colors.dart';

class BlogCard extends StatefulWidget {
  final BlogPost post;
  BlogCard({Key key, @required this.post}) : super(key: key);

  @override
  _BlogCardState createState() => _BlogCardState(post: post);
}

class _BlogCardState extends State<BlogCard> {
  BlogPost post;
  bool liked;
  _BlogCardState({this.post});

  Color _colorLocked = Colors.blueGrey;
  Color _colorNonLocked = themeBlue;
  Color _colorCard = Colors.white;
  Color _colorLike = themeGreen;

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
    return Container(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: GestureDetector(
        onLongPressStart: (_) {
          setState(() {
            _colorNonLocked = themeDark;
            _colorCard = themeBlue;
            _colorLike = themeDark;
          });
        },
        onLongPressEnd: (_) {
          setState(() {
            _colorNonLocked = themeBlue;
            _colorCard = Colors.white;
            _colorLike = themeGreen;
          });
        },
        onTapDown: (details) {
          setState(() {
            _colorNonLocked = Color(0xff28acd1);
            _colorCard = themeGreen;
            _colorLike = Color(0xff28acd1);
          });
        },
        onTapUp: (details) {
          setState(() {
            _colorNonLocked = themeBlue;
            _colorCard = Colors.white;
            _colorLike = themeGreen;
          });
        },
        child: Card(
          elevation: 5,
          child: AnimatedContainer(
            decoration: BoxDecoration(
              color: _colorCard,
            ),
            duration: Duration(milliseconds: 500),
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Image.network(
                    post.image,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        '${post.title}',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: themeDark,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        child: Text(
                          'Детальніше...',
                          style: TextStyle(
                            color: !post.isLocked || autorised
                                ? _colorNonLocked
                                : _colorLocked,
                          ),
                        ),
                        onTapDown: (details) {
                          setState(() {
                            if (post.isLocked) {
                              _colorLocked = themeGreen;
                            } else {
                              _colorNonLocked = themeGreen;
                            }
                          });
                        },
                        onTapUp: (details) {
                          _colorCard = Colors.white;
                          setState(() {
                            if (post.isLocked) {
                              _colorLocked = Colors.blueGrey;
                            } else {
                              _colorNonLocked = themeBlue;
                            }
                          });
                        },
                        onTap: () {
                          if (post.isLocked && !autorised) {
                            return alertDialogShow(
                                context,
                                createDialog(
                                    context, 'детального перегляду інформації'),
                                200);
                          } else {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => PostInfo(
                                  post: post,
                                ),
                              ),
                            );
                          }
                        },
                      ),
                      GestureDetector(
                        child: Icon(
                          // post.liked(currentUser)
                          liked ? Icons.favorite : Icons.favorite_border,
                          color:
                              //post.liked(currentUser)
                              liked ? _colorLike : null,
                        ),
                        onTap: () async {
                          if (autorised) {
                            if (/*post.liked(currentUser)*/ liked) {
                              await post.removeFromLiked(currentUser);
                              showToast(
                                  'Видалено з обраних',
                                  Colors.redAccent,
                                  Color(0xff590000),
                                  CommunityMaterialIcons.close,
                                  fToast);
                            } else {
                              await post.addToLiked(currentUser);

                              showToast(
                                  'Додано до обраних',
                                  Colors.greenAccent,
                                  Color(0xff005c05),
                                  CommunityMaterialIcons.check,
                                  fToast);
                            }
                            setState(() {
                              liked = !liked;
                            });
                          } else {
                            return alertDialogShow(context,
                                createDialog(context, 'збереження поста'), 200);
                          }
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
