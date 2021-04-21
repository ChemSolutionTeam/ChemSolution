import 'package:chem_solution_mobile/models/BlogPost.dart';
import 'package:chem_solution_mobile/widgets/post_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:chem_solution_mobile/assets/alerts.dart';

class BlogCard extends StatefulWidget {
  final BlogPost post;
  BlogCard({Key key, @required this.post}) : super(key: key);

  @override
  _BlogCardState createState() => _BlogCardState(post);
}

class _BlogCardState extends State<BlogCard> {
  BlogPost post;
  Color _colorLocked = Colors.blueGrey;
  Color _colorNonLocked = Color(0xff1dcdfe);
  Color _colorCard = Colors.white;
  Color _colorLike = Color(0xff21D0B2);

  FToast fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  _showToast(String msg, Color back, Color text, IconData icon) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: back,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: text,
          ),
          SizedBox(
            width: 12.0,
          ),
          Text(
            msg,
            style: TextStyle(color: text),
          ),
        ],
      ),
    );

    // Custom Toast Position
    fToast.showToast(
        child: toast,
        toastDuration: Duration(milliseconds: 700),
        positionedToastBuilder: (context, child) {
          return Positioned(
            child: child,
            bottom: MediaQuery.of(context).size.height * 0.1,
            left: MediaQuery.of(context).size.width * 0.2,
          );
        });
  }

  _BlogCardState(this.post);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: GestureDetector(
        onLongPressStart: (_) {
          setState(() {
            _colorNonLocked = Color(0xff2F455C);
            _colorCard = Color(0xff1dcdfe);
            _colorLike = Color(0xff2F455C);
          });
        },
        onLongPressEnd: (_) {
          setState(() {
            _colorNonLocked = Color(0xff1dcdfe);
            _colorCard = Colors.white;
            _colorLike = Color(0xff21D0B2);
          });
        },
        onTapDown: (details) {
          setState(() {
            _colorNonLocked = Color(0xff28acd1);
            _colorCard = Color(0xff21D0B2);
            _colorLike = Color(0xff28acd1);
          });
        },
        onTapUp: (details) {
          setState(() {
            _colorNonLocked = Color(0xff1dcdfe);
            _colorCard = Colors.white;
            _colorLike = Color(0xff21D0B2);
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
                    post.img,
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
                            color: Color(0xff2F455C),
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
                          //'${post.liked.toString()}',
                          style: TextStyle(
                            color:
                                !post.isLocked ? _colorNonLocked : _colorLocked,
                          ),
                        ),
                        onTapDown: (details) {
                          setState(() {
                            if (post.isLocked) {
                              _colorLocked = Color(0xff21D0B2);
                            } else {
                              _colorNonLocked = Color(0xff21D0B2);
                            }
                          });
                        },
                        onTapUp: (details) {
                          _colorCard = Colors.white;
                          setState(() {
                            if (post.isLocked) {
                              _colorLocked = Colors.blueGrey;
                            } else {
                              _colorNonLocked = Color(0xff1dcdfe);
                            }
                          });
                        },
                        onTap: () {
                          if (post.isLocked) {
                            return alertDialogShow(
                                context, createDialog(context), 200);
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
                          post.liked ? Icons.favorite : Icons.favorite_border,
                          color: post.liked ? _colorLike : null,
                        ),
                        onTap: () {
                          setState(() {
                            post.liked = !post.liked;
                          });
                          if (post.liked) {
                            _showToast(
                                'Додано до обраних',
                                Colors.greenAccent,
                                Color(0xff005c05),
                                CommunityMaterialIcons.check);
                          } else {
                            _showToast(
                                'Видалено з обраних',
                                Colors.redAccent,
                                Color(0xff590000),
                                CommunityMaterialIcons.close);
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
