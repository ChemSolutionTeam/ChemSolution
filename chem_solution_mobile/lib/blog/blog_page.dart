import 'package:chem_solution_mobile/models/BlogPost.dart';
import 'package:chem_solution_mobile/widgets/nothing_find.dart';
import 'package:chem_solution_mobile/widgets/post_card.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Blogs extends StatefulWidget {
  String search;
  Blogs({Key key, this.search}) : super(key: key);

  @override
  BlogsState createState() => BlogsState(search);
}

class BlogsState extends State<Blogs> with SingleTickerProviderStateMixin {
  String search;
  BlogsState(this.search);
  List<Widget> posts = [];
  List<BlogPost> allPosts = [];
  List<BlogPost> filterPosts = [];

  final GlobalKey<AnimatedListState> _key = new GlobalKey<AnimatedListState>();
  AnimationController _controller;
  Animation<Offset> _offsetAnimationToLeft;
  Animation<Offset> _offsetAnimationToRight;

  bool _condition(BlogPost post) => (post.title.indexOf(search) > -1 ||
      post.information.indexOf(search) > -1);

  void getSearch(String value) {
    setState(() {
      search = value;
      for (int i = 0; i < posts.length; i++) {
        _key.currentState.removeItem(0, (context, animation) => null);
      }
      filterPosts = [];
      posts = [];
      allPosts.forEach((post) {
        if (_condition(post)) filterPosts.add(post);
      });
      filterPosts = filterPosts.reversed.toList();
      for (int i = 0; i < filterPosts.length; i++) {
        posts.insert(0, BlogCard(post: filterPosts[i]));
        _key.currentState.insertItem(0);
      }
      ifEmptyPosts();
    });
  }

  void _addBlogPost() async {
    allPosts = await BlogPost.fetchObjects(path: 'BlogPosts');
    allPosts.removeWhere((post) => post.category != 'news');
    allPosts = allPosts.reversed.toList();
    allPosts.forEach((post) {
      if ((search != null || search != '') && _condition(post)) {
        posts.add(BlogCard(post: post));
        filterPosts.add(post);
        _key.currentState.insertItem(posts.length - 1);
      }
    });
    ifEmptyPosts();
  }

  void ifEmptyPosts() {
    if (posts == null || posts.length == 0) {
      posts.add(NothingFind());
      _key.currentState.insertItem(0);
    }
  }

  void getAnimation() {
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
  void initState() {
    super.initState();
    getAnimation();
  }

  Widget _buildItem(int index) {
    return SlideTransition(
      position:
          index % 2 == 0 ? _offsetAnimationToLeft : _offsetAnimationToRight,
      child: posts[index],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AnimatedList(
        key: _key,
        shrinkWrap: true,
        initialItemCount: posts.length.compareTo(0),
        itemBuilder: (context, index, animation) {
          return _buildItem(index);
        },
      ),
    );
  }
}
