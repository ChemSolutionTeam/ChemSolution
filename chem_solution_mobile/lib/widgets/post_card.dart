import 'package:chem_solution_mobile/models/BlogPost.dart';
import 'package:chem_solution_mobile/widgets/post_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlogCard extends StatefulWidget {
  final BlogPost post;
  BlogCard({Key key, @required this.post}) : super(key: key);

  @override
  _BlogCardState createState() => _BlogCardState(post);
}

class _BlogCardState extends State<BlogCard> {
  BlogPost post;

  _BlogCardState(this.post);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Card(
        elevation: 5,
        child: Padding(
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
                          color: post.isLocked
                              ? Color(0xff1DCDFE)
                              : Colors.blueGrey,
                        ),
                      ),
                      onTap: () {
                        if (!post.isLocked) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  elevation: 24,
                                  title: Text(
                                    'Увага!',
                                    style: TextStyle(
                                      color: Color(0xff2F455C),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  content: Text(
                                    'Для детального перегляду інформації необхідно авторизуватися. Зробити це зараз?',
                                    style: TextStyle(
                                      color: Color(0xff2F455C),
                                    ),
                                  ),
                                  actions: [
                                    // ignore: deprecated_member_use
                                    FlatButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text(
                                          'Ні',
                                          style: TextStyle(color: Colors.red),
                                        )),
                                    // ignore: deprecated_member_use
                                    FlatButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text(
                                        'Так',
                                        style: TextStyle(
                                            color: Color(0xff1DCDFE),
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ],
                                );
                              },
                              barrierDismissible: true);
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
                        color: post.liked ? Colors.red : null,
                      ),
                      onTap: () {
                        setState(() {
                          post.liked = !post.liked;
                        });
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
