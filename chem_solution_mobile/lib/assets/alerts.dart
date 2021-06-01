import 'package:chem_solution_mobile/widgets/auth_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'colors.dart';

Widget createAttention(BuildContext context) {
  return AlertDialog(
    elevation: 24,
    title: Text(
      'Увага!',
      style: TextStyle(
        color: themeDark,
        fontWeight: FontWeight.bold,
      ),
    ),
    content: Text(
      'Для перегляду інформації про елемент необхідно його придбати',
      style: TextStyle(
        color: themeDark,
      ),
    ),
    actions: [
      // ignore: deprecated_member_use
      FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'ОК',
            style: TextStyle(color: themeBlue),
          )),
      // ignore: deprecated_member_us
    ],
  );
}

Widget createDialog(BuildContext context, String value) {
  return AlertDialog(
    elevation: 24,
    title: Text(
      'Увага!',
      style: TextStyle(
        color: themeDark,
        fontWeight: FontWeight.bold,
      ),
    ),
    content: Text(
      'Для $value необхідно авторизуватися. Зробити це зараз?',
      style: TextStyle(
        color: themeDark,
      ),
    ),
    actions: [
      // ignore: deprecated_member_use
      FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'Ні',
            style: TextStyle(color: Colors.red),
          )),
      // ignore: deprecated_member_use
      FlatButton(
        onPressed: () {
          alertDialogShow(context, autorisation(() {
            Navigator.of(context).pop();
          }), 400);
        },
        child: Text(
          'Так',
          style: TextStyle(color: themeBlue, fontWeight: FontWeight.w700),
        ),
      ),
    ],
  );
}

Future<Widget> alertDialogShow(
    BuildContext context, Widget _alertDialog, int time) {
  return showGeneralDialog(
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(
            opacity: a1.value,
            child: _alertDialog,
          ),
        );
      },
      transitionDuration: Duration(milliseconds: time),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      // ignore: missing_return
      pageBuilder: (context, animation1, animation2) {});
}

Widget autorisation(Function() update) {
  return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0))),
      content: AuthWidget(
        update: update,
      ));
}

void toBrowser(BuildContext context, String link, String title) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => WebviewScaffold(
        url: link,
        appBar: new AppBar(
          backgroundColor: themeDark,
          title: new Text(
            title,
            style: TextStyle(
                color: themeGreen, fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    ),
  );
}
