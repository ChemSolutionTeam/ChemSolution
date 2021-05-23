import 'package:chem_solution_mobile/models/BlogPost.dart';
import 'package:flutter/material.dart';
import 'package:chem_solution_mobile/assets/colors.dart';

class PostInfo extends StatelessWidget {
  final BlogPost post;
  const PostInfo({Key key, @required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) {
        if (details.primaryVelocity > 0) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        backgroundColor: Color(0xffEBFAFF),
        appBar: AppBar(
          backgroundColor: themeDark,
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(post.title,
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
                    post.image,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Flexible(
                    child: Text(
                      post.information,
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
