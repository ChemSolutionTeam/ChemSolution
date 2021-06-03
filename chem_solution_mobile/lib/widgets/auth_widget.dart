import 'dart:async';

import 'package:chem_solution_mobile/assets/alerts.dart';
import 'package:chem_solution_mobile/assets/colors.dart';
import 'package:chem_solution_mobile/assets/toasts.dart';
import 'package:chem_solution_mobile/bloc/auth_bloc.dart';
import 'package:chem_solution_mobile/main.dart';
import 'package:chem_solution_mobile/models/Autorisation.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class AuthWidget extends StatefulWidget {
  Function() update;
  AuthWidget({Key key, Function() update}) : super(key: key);

  @override
  _AuthWidgetState createState() => _AuthWidgetState(update: update);
}

class _AuthWidgetState extends State<AuthWidget> {
  Function() update;
  StreamSubscription<User> loginStreamSubscription;

  _AuthWidgetState({Function() update});

  @override
  void initState() {
    var authBloc = Provider.of<AuthBloc>(context, listen: false);
    loginStreamSubscription = authBloc.currentUser.listen((fbUser) {
      if (fbUser != null) {
        //do smth
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    loginStreamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authBloc = context.read<AuthBloc>();
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
        Navigator.of(context).pop();
        update();
      } else {
        _passwordEditingController.text = '';
        _formKey.currentState.validate();
      }
    }

    return Container(
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
                  color: themeDark, fontWeight: FontWeight.bold, fontSize: 32),
            ),
            ListTile(
              leading: Text('Email     '),
              title: TextFormField(
                  decoration: InputDecoration(hintText: "Уведіть email"),
                  controller: _emailEditingController,
                  validator: (String inValue) {
                    if (inValue.length == 0) {
                      return "Перевірте дані про пошту";
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
                      return "Не знайдено такої комбінації логіна та паролю";
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
                    try {
                      Autorisation.signIn(email, password, getCorrect);
                    } catch (ex) {
                      showToast('Помилка підключення', themeRed, themeDarkRed,
                          Icons.error, FToast());
                    }
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
                        MaterialStateProperty.all<Color>(themeBlue),
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
              color: themeDark,
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
                  onPressed: () => authBloc.loginGoogle(),
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
              color: themeDark,
              thickness: 1,
              indent: MediaQuery.of(context).size.width * 0.05,
              endIndent: MediaQuery.of(context).size.width * 0.05,
            ),
            TextButton(
              onPressed: () {
                toBrowser(
                    context, '$chemWeb/mobileReset', 'Відновлення паролю');
              },
              child: Text(
                'Забули пароль?',
                style: TextStyle(color: themeDark, fontSize: 16),
              ),
            ),
            TextButton(
              onPressed: () {
                toBrowser(context, '$chemWeb/mobileRegister', 'Реєстрація');
              },
              child: Text(
                'Створити акаунт',
                style: TextStyle(color: themeDark, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
