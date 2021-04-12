import 'package:chem_solution_mobile/models/BlogPost.dart';
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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () {
              print('Card tapped.');
            },
            child: Text(post.title),
          ),
        ),
      ),
    );
  }
}
