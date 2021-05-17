import 'package:chem_solution_mobile/widgets/request_card.dart';
import 'package:flutter/material.dart';
import 'package:chem_solution_mobile/assets/colors.dart';
import 'package:chem_solution_mobile/main.dart';
import 'package:chem_solution_mobile/models/Request.dart' as CS;

class RequestsPage extends StatefulWidget {
  RequestsPage({Key key}) : super(key: key);

  @override
  _RequestsPageState createState() => _RequestsPageState();
}

class _RequestsPageState extends State<RequestsPage>
    with SingleTickerProviderStateMixin {
  List<Widget> requests = [];
  final GlobalKey<AnimatedListState> _key = new GlobalKey<AnimatedListState>();

  AnimationController _controller;
  Animation<Offset> _offsetAnimationToLeft;
  Animation<Offset> _offsetAnimationToRight;

  void _addRequests() {
     currentUser.requests.forEach((element) {
      requests.add(RequestCard(request: element));
      _key.currentState.insertItem(requests.length - 1);
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
      _addRequests();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
        appBar: new AppBar(
          backgroundColor: themeDark,
          title: new Text(
            'Мої запити',
            style: TextStyle(
                color: themeGreen, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          child: AnimatedList(
            key: _key,
            shrinkWrap: true,
            itemBuilder: (context, index, animation) {
              return SlideTransition(
                position: index % 2 == 0
                    ? _offsetAnimationToLeft
                    : _offsetAnimationToRight,
                child: requests[index],
              );
            },
            initialItemCount: requests.length,
          ),
        ),
      ),
    );
  }
}
