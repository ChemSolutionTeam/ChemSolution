import 'package:chem_solution_mobile/assets/colors.dart';
import 'package:chem_solution_mobile/models/Request.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

class RequestCard extends StatefulWidget {
  Request request;
  RequestCard({Key key, this.request}) : super(key: key);

  @override
  _RequestCardState createState() => _RequestCardState();
}

class _RequestCardState extends State<RequestCard> {
  Color colorText() {
    if (widget.request.statusId == 1) return themeDark;
    if (widget.request.statusId == 2) return themeDarkGreen;
    if (widget.request.statusId == 3) return themeDarkRed;
    return Colors.black;
  }

  Color colorBackground() {
    if (widget.request.statusId == 1) return themeBlue;
    if (widget.request.statusId == 2) return themeGreen;
    if (widget.request.statusId == 3) return themeRed;
    return Colors.white;
  }

  IconData requestIcon() {
    if (widget.request.statusId == 1) return CommunityMaterialIcons.chat_question;
    if (widget.request.statusId == 2) return CommunityMaterialIcons.check;
    if (widget.request.statusId == 3) return CommunityMaterialIcons.close;
    return Icons.error;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 5,
        child: AnimatedContainer(
          color: colorBackground(),
          duration: Duration(milliseconds: 500),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListTile(
            title: Text(
              '${widget.request.theme} (${widget.request.dateTimeSendeToString})',
              style: TextStyle(
                  color: colorText(),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              widget.request.text,
              style: TextStyle(
                color: colorText(),
                fontSize: 16,
              ),
            ),
            trailing: Icon(
              requestIcon(),
              color: colorText(),
            ),
          ),
        ),
      ),
    );
  }
}
