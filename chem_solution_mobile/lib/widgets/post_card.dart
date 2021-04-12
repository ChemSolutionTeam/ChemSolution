import 'package:chem_solution_mobile/models/BlogPost.dart';
import 'package:flutter/material.dart';

class BlogCard extends StatefulWidget {
  final BlogPost post;
  BlogCard({Key key, @required this.post})
      : super(key: key);

  @override
  _BlogCardState createState() => _BlogCardState(post);
}

class _BlogCardState extends State<BlogCard> {
  BlogPost post;
  bool _liked = false;

  _BlogCardState(this.post);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Card(
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
                  Text(
                    '${post.title}',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Color(0xff2F455C),
                        fontWeight: FontWeight.w400),
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
                        style: TextStyle(color: Color(0xff1DCDFE)),
                      ),
                    ),
                    GestureDetector(
                      child: Icon(
                        _liked ? Icons.favorite : Icons.favorite_border,
                        color: _liked ? Colors.red : null,
                      ),
                      onTap: () {
                        setState(() {
                          _liked = !_liked;
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
