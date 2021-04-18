import 'dart:core';
import 'package:chem_solution_mobile/models/BlogPost.dart';
import 'package:chem_solution_mobile/widgets/post_card.dart';
import 'package:flutter/material.dart';

class LikedPosts extends StatefulWidget {
  LikedPosts({Key key}) : super(key: key);

  @override
  _LikedPostsState createState() => _LikedPostsState();
}

List<BlogPost> posts = [
  new BlogPost(
    idPost: 1,
    title: 'post1',
    category: 'News',
    img:
        "https://www.innovationnewsnetwork.com/wp-content/uploads/2019/12/ST27-McGillU1-image-%C2%A9-iStock-Garsya.jpg",
    information:
        'information1\ninformation1\ninformation1\ninformation1\ninformation1\ninformation1\n',
    isLocked: true,
    liked: true,
  ),
  new BlogPost(
      idPost: 2,
      title: 'post2',
      category: 'News',
      img:
          'https://res.cloudinary.com/grand-canyon-university/image/fetch/w_750,h_564,c_fill,g_faces/https://www.gcu.edu/sites/default/files/media/images/Blog/engineering-and-technology/chemistry-materials.jpg',
      information: '''
information2\ninformation2\ninformation2information2information2
information2information2information2information2information2
information2information2information2information2information2
information2information2information2information2information2
information2information2information2
information2\ninformation2\ninformation2\ninformation2\n''',
      isLocked: false,
      liked: true),
  new BlogPost(
      idPost: 3,
      title: 'post3',
      category: 'News',
      img:
          'https://images.newscientist.com/wp-content/uploads/2021/02/23162716/chemistry.jpg',
      information:
          'information3\ninformation3\ninformation3\ninformation3\ninformation3\ninformation3\n',
      isLocked: false,
      liked: true),
  new BlogPost(
      idPost: 4,
      title: 'post4',
      category: 'News',
      img:
          'https://zamtutor.com/wp-content/uploads/2020/10/shutterstock_127915121.jpg',
      information:
          'information4\ninformation4\ninformation4\ninformation4\ninformation4\ninformation4\n',
      isLocked: false,
      liked: true),
];

class _LikedPostsState extends State<LikedPosts> {
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
          backgroundColor: Color(0xff2F455C),
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text('Збережене',
                style: TextStyle(
                    color: Color(0xff21D0B2),
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0)),
          ),
        ),
        body: Container(
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return BlogCard(post: posts[index]);
            },
            itemCount: posts.length,
          ),
        ),
      ),
    );
  }
}
