import 'package:chem_solution_mobile/models/BlogPost.dart';
import 'package:chem_solution_mobile/widgets/post_card.dart';
import 'package:flutter/material.dart';

class Blogs extends StatefulWidget {
  Blogs({Key key}) : super(key: key);

  @override
  _BlogsState createState() => _BlogsState();
}

class _BlogsState extends State<Blogs> {
  List<BlogPost> posts = [
    new BlogPost(
      title: 'post1',
      category: 'News',
      img: "https://www.innovationnewsnetwork.com/wp-content/uploads/2019/12/ST27-McGillU1-image-%C2%A9-iStock-Garsya.jpg",
      information: 'information1',
      isLocked: false,
    ),
    new BlogPost(
      title: 'post2',
      category: 'News',
      img: 'https://res.cloudinary.com/grand-canyon-university/image/fetch/w_750,h_564,c_fill,g_faces/https://www.gcu.edu/sites/default/files/media/images/Blog/engineering-and-technology/chemistry-materials.jpg',
      information: 'information2',
      isLocked: true,
    ),
    new BlogPost(
      title: 'post3',
      category: 'News',
      img: 'https://images.newscientist.com/wp-content/uploads/2021/02/23162716/chemistry.jpg',
      information: 'information3',
      isLocked: true,
    ),
    new BlogPost(
      title: 'post4',
      category: 'News',
      img: 'https://zamtutor.com/wp-content/uploads/2020/10/shutterstock_127915121.jpg',
      information: 'information4',
      isLocked: true,
    ),
  ];

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
