import 'package:chem_solution_mobile/models/BlogPost.dart';
import 'package:chem_solution_mobile/widgets/post_card.dart';
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
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return BlogCard(post: posts[index]);
        },
        itemCount: posts.length,
      ),
    );
  }
}

List<BlogPost> posts = [
  new BlogPost(
    title: 'post1',
    category: 'News',
    image: '',
    information: 'information1',
    isLocked: false,
  ),
  new BlogPost(
    title: 'post2',
    category: 'News',
    image: '',
    information: 'information2',
    isLocked: true,
  ),
  new BlogPost(
    title: 'post3',
    category: 'News',
    image: '',
    information: 'information3',
    isLocked: true,
  ),
  new BlogPost(
    title: 'post4',
    category: 'News',
    image: '',
    information: 'information4',
    isLocked: true,
  ),
];
