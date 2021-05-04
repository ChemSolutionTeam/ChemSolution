import 'package:chem_solution_mobile/models/Autorisation.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:chem_solution_mobile/main.dart';

Widget createDialog(BuildContext context, String value) {
  return AlertDialog(
    elevation: 24,
    title: Text(
      'Увага!',
      style: TextStyle(
        color: Color(0xff2F455C),
        fontWeight: FontWeight.bold,
      ),
    ),
    content: Text(
      'Для $value необхідно авторизуватися. Зробити це зараз?',
      style: TextStyle(
        color: Color(0xff2F455C),
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
          Navigator.of(context).pop();
        },
        child: Text(
          'Так',
          style:
              TextStyle(color: Color(0xff1DCDFE), fontWeight: FontWeight.w700),
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
      pageBuilder: (context, animation1, animation2) {});
}

Widget autorisation(BuildContext context, Function() update) {
  String _email;
  String _password;
  final TextEditingController _emailEditingController =
      TextEditingController(text: _email);
  final TextEditingController _passwordEditingController =
      TextEditingController(text: _password);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool visible = false;

  void getCorrect() {
    if (autorised) {
      update();
      Navigator.of(context).pop();
    } else {
      _emailEditingController.text = '';
      _passwordEditingController.text = '';
    }
  }

  return AlertDialog(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(32.0))),
    content: Container(
      height: MediaQuery.of(context).size.height * 0.725,
      width: MediaQuery.of(context).size.width * 0.95,
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            Text(
              'Авторизація',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xff2F455C),
                  fontWeight: FontWeight.bold,
                  fontSize: 32),
            ),
            ListTile(
              leading: Text('Email     '),
              title: TextFormField(
                  decoration: InputDecoration(hintText: "Уведіть email"),
                  controller: _emailEditingController,
                  validator: (String inValue) {
                    if (inValue.length == 0) {
                      return "Please enter a email";
                    } else if (inValue.lastIndexOf('@') == -1) {
                      return "Please enter a correct email";
                    }
                    _email = inValue;
                    return null;
                  }),
            ),
            Padding(padding: EdgeInsets.all(5)),
            ListTile(
              leading: Text('Пароль'),
              title: TextFormField(
                  obscureText: !visible,
                  decoration: InputDecoration(hintText: "Уведіть пароль"),
                  controller: _passwordEditingController,
                  validator: (String inValue) {
                    if (inValue.length == 0) {
                      return "Please enter a email";
                    } else if (inValue.lastIndexOf('@') == -1) {
                      return "Please enter a correct email";
                    }
                    _password = inValue;
                    return null;
                  }),
            ),
            Padding(padding: EdgeInsets.all(10)),
            Center(
              child: ConstrainedBox(
                constraints: BoxConstraints.tightFor(
                  width: MediaQuery.of(context).size.width * 0.8,
                ),
                child: ElevatedButton(
                  onPressed: () async {
                    var email = _emailEditingController.text;
                    var password = _passwordEditingController.text;
                    Autorisation.signIn(email, password, getCorrect);
                  },
                  child: Text(
                    'Увійти',
                    style: TextStyle(fontSize: 16),
                  ),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xff1DCDFE)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    )),
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 15)),
            Divider(
              color: Color(0xff2F455C),
              thickness: 1,
              indent: MediaQuery.of(context).size.width * 0.05,
              endIndent: MediaQuery.of(context).size.width * 0.05,
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            Center(
              child: ConstrainedBox(
                constraints: BoxConstraints.tightFor(
                  width: MediaQuery.of(context).size.width * 0.8,
                ),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(CommunityMaterialIcons.google),
                        Text(
                          ' Увійти з Google',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xffEA4335)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    )),
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            Center(
              child: ConstrainedBox(
                constraints: BoxConstraints.tightFor(
                  width: MediaQuery.of(context).size.width * 0.8,
                ),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(CommunityMaterialIcons.facebook),
                        Text(
                          ' Увійти з Facebook',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xff4064AC)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    )),
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 15)),
            Divider(
              color: Color(0xff2F455C),
              thickness: 1,
              indent: MediaQuery.of(context).size.width * 0.05,
              endIndent: MediaQuery.of(context).size.width * 0.05,
            ),
            TextButton(
              onPressed: () {
                toBrowser(
                    context, 'https://www.google.com', 'Відновлення паролю');
              },
              child: Text(
                'Забули пароль?',
                style: TextStyle(color: Color(0xff2F455C), fontSize: 16),
              ),
            ),
            TextButton(
              onPressed: () {
                toBrowser(context, 'https://www.google.com', 'Реєстрація');
              },
              child: Text(
                'Створити акаунт',
                style: TextStyle(color: Color(0xff2F455C), fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

void toBrowser(BuildContext context, String link, String title) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => WebviewScaffold(
        url: link,
        appBar: new AppBar(
          backgroundColor: Color(0xff2F455C),
          title: new Text(
            title,
            style: TextStyle(
                color: Color(0xff21D0B2),
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    ),
  );
}
