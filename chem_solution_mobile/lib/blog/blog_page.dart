import 'package:chem_solution_mobile/models/BlogPost.dart';
import 'package:chem_solution_mobile/widgets/post_card.dart';
import 'package:flutter/material.dart';

class Blogs extends StatefulWidget {
  Blogs({Key key}) : super(key: key);

  @override
  _BlogsState createState() => _BlogsState();
}

class _BlogsState extends State<Blogs> with SingleTickerProviderStateMixin {
  List<Widget> posts = [];

  final GlobalKey<AnimatedListState> _key = new GlobalKey<AnimatedListState>();
  AnimationController _controller;
  Animation<Offset> _offsetAnimationToLeft;
  Animation<Offset> _offsetAnimationToRight;

  void _addBlogPost() async {
    List<BlogPost> allPosts = await BlogPost.fetchObjects(path: 'BlogPosts');
    allPosts = allPosts.reversed.toList();
    allPosts.forEach((post) {
      if (post.category == 'news') {
        posts.add(BlogCard(post: post));
        _key.currentState.insertItem(posts.length - 1);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1250),
      vsync: this,
    );
    _controller.forward();
    _offsetAnimationToLeft = Tween<Offset>(
      begin: Offset(1, 0),
      end: const Offset(0, 0), //easeInOut
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticInOut));
    _offsetAnimationToRight = Tween<Offset>(
      begin: const Offset(-1, 0),
      end: Offset(0, 0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticInOut));
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _addBlogPost();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AnimatedList(
        key: _key,
        shrinkWrap: true,
        itemBuilder: (context, index, animation) {
          return SlideTransition(
            position: index % 2 == 0
                ? _offsetAnimationToLeft
                : _offsetAnimationToRight,
            child: posts[index],
          );
        },
        initialItemCount: posts.length,
      ),
    );
  }
}

/*

 List<Widget> posts = [];

  final GlobalKey<AnimatedListState> _key = new GlobalKey<AnimatedListState>();
  AnimationController _controller;
  Animation<Offset> _offsetAnimationToLeft;
  Animation<Offset> _offsetAnimationToRight;

  void _addBlogPost() {
    List<BlogPost> temp = [
      new BlogPost(
        blogPostId: 1,
        title: 'post1',
        category: 'News',
        image:
            "https://www.innovationnewsnetwork.com/wp-content/uploads/2019/12/ST27-McGillU1-image-%C2%A9-iStock-Garsya.jpg",
        information:
            'information1\ninformation1\ninformation1\ninformation1\ninformation1\ninformation1\n',
        isLocked: true,
      ),
      new BlogPost(
        blogPostId: 2,
        title: 'post2',
        category: 'News',
        image:
            'https://res.cloudinary.com/grand-canyon-university/image/fetch/w_750,h_564,c_fill,g_faces/https://www.gcu.edu/sites/default/files/media/images/Blog/engineering-and-technology/chemistry-materials.jpg',
        information: '''
information2\ninformation2\ninformation2information2information2
information2information2information2information2information2
information2information2information2information2information2
information2information2information2information2information2
information2information2information2
information2\ninformation2\ninformation2\ninformation2\n''',
        isLocked: false,
      ),
      new BlogPost(
        blogPostId: 3,
        title: 'post3',
        category: 'News',
        image:
            'https://images.newscientist.com/wp-content/uploads/2021/02/23162716/chemistry.jpg',
        information:
            'information3\ninformation3\ninformation3\ninformation3\ninformation3\ninformation3\n',
        isLocked: false,
      ),
      new BlogPost(
        blogPostId: 4,
        title: 'post4',
        category: 'News',
        image:
            'https://zamtutor.com/wp-content/uploads/2020/10/shutterstock_127915121.jpg',
        information:
            'information4\ninformation4\ninformation4\ninformation4\ninformation4\ninformation4\n',
        isLocked: false,
      ),
    ];

    temp.forEach((post) {
      posts.add(BlogCard(post: post));
        _key.currentState.insertItem(posts.length - 1);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {

    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1250),
      vsync: this,
    );
    _controller.forward();
    _offsetAnimationToLeft = Tween<Offset>(
      begin: Offset(1, 0),
      end: const Offset(0, 0), //easeInOut
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticInOut));
    _offsetAnimationToRight = Tween<Offset>(
      begin: const Offset(-1, 0),
      end: Offset(0, 0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticInOut));
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _addBlogPost();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: 
       AnimatedList(
        key: _key,
        shrinkWrap: true,
        itemBuilder: (context, index, animation) {
          return SlideTransition(
            position: index % 2 == 0
                 _offsetAnimationToLeft
                : _offsetAnimationToRight,
            child: posts[index],
          );
        },
        initialItemCount: posts.length,
      ), 
    );
  }


*/

/*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemBuilder: (BuildContext context, int i) {
            return FutureBuilder<List<BlogPost>>(
              future: allPosts,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return BlogCard(
                    post: snapshot.data[i],
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return CircularProgressIndicator();
              },
            );
          },
        ),
      ),
    );
  } */
