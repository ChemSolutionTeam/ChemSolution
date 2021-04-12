import 'package:flutter/material.dart';

class Blogs extends StatefulWidget {
  Blogs({Key key}) : super(key: key);

  @override
  _BlogsState createState() => _BlogsState();
}

class _BlogsState extends State<Blogs> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text('Blog'),
    );
  }
}