import 'package:chem_solution_mobile/models/BlogPost.dart';
import 'package:chem_solution_mobile/widgets/post_card.dart';
import 'package:flutter/material.dart';

class Informations extends StatefulWidget {
  String search;
  Informations({Key key, this.search}) : super(key: key);

  @override
  _InformationsState createState() => _InformationsState(search);
}

class _InformationsState extends State<Informations>
    with SingleTickerProviderStateMixin {
  String search;

  _InformationsState(this.search);

  List<Widget> posts = [];
  final GlobalKey<AnimatedListState> _key = new GlobalKey<AnimatedListState>();
  AnimationController _controller;
  Animation<Offset> _offsetAnimationToLeft;
  Animation<Offset> _offsetAnimationToRight;

  Future<void> _addBlogPost() async {
    List<BlogPost> allPosts = await BlogPost.fetchObjects(path: 'BlogPosts');
    allPosts = allPosts.reversed.toList();
    allPosts.forEach((post) {
      if (post.category == 'facts') {
        if ((search != null || search != '') &&
            (post.title.indexOf(search) > -1 ||
                post.information.indexOf(search) > -1)) {
          posts.add(BlogCard(post: post));
          _key.currentState.insertItem(posts.length - 1);
        }
      }
    });
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
  void dispose() {
    _controller.dispose();
    super.dispose();
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
