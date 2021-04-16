import 'package:chem_solution_mobile/models/BlogPost.dart';
import 'package:chem_solution_mobile/widgets/post_card.dart';
import 'package:flutter/material.dart';

class Informations extends StatefulWidget {
  Informations({Key key}) : super(key: key);

  @override
  _InformationsState createState() => _InformationsState();
}

class _InformationsState extends State<Informations> {
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
      liked: false,
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
        liked: false),
    new BlogPost(
        idPost: 3,
        title: 'post3',
        category: 'News',
        img:
            'https://images.newscientist.com/wp-content/uploads/2021/02/23162716/chemistry.jpg',
        information:
            'information3\ninformation3\ninformation3\ninformation3\ninformation3\ninformation3\n',
        isLocked: false,
        liked: false),
    new BlogPost(
        idPost: 4,
        title: 'post4',
        category: 'News',
        img:
            'https://zamtutor.com/wp-content/uploads/2020/10/shutterstock_127915121.jpg',
        information:
            'information4\ninformation4\ninformation4\ninformation4\ninformation4\ninformation4\n',
        isLocked: false,
        liked: false),
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
