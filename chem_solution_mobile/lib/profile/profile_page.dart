import 'package:chem_solution_mobile/profile/liked_posts.dart';
import 'package:flutter/material.dart';
import 'package:chem_solution_mobile/main.dart';
import 'package:community_material_icon/community_material_icon.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Widget _card(double w, double h, Color color, String text, Icon icon) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Card(
        color: color,
        elevation: 5,
        child: Container(
          width: w,
          height: h,
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: TextStyle(color: Color(0xff2F455C), fontSize: 20),
              ),
              icon,
            ],
          ),
        ),
      ),
    );
  }

  void _signIn(BuildContext context) {
    String _email;
    String _password;
    final TextEditingController _emailEditingController =
        TextEditingController(text: _email);
    final TextEditingController _passwordEditingController =
        TextEditingController(text: _password);
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            backgroundColor: Colors.white,
            insetPadding: EdgeInsets.all(10),
            elevation: 24,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              //    padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
              child: Scaffold(
                appBar: AppBar(
                  title: Text(
                    'Авторизація',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xff21D0B2),
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  backgroundColor: Color(0xff2F455C),
                ),
                backgroundColor: Colors.white,
                body: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Form(
                    key: _formKey,
                    child: ListView(
                      children: [
                        ListTile(
                          leading: Text('Email     '),
                          title: TextFormField(
                              // initialValue: _title,
                              decoration:
                                  InputDecoration(hintText: "Уведіть email"),
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
                              // initialValue: _title,
                              decoration:
                                  InputDecoration(hintText: "Уведіть пароль"),
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
                              onPressed: () {},
                              child: Text(
                                'Увійти',
                                style: TextStyle(fontSize: 16),
                              ),
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all<
                                    EdgeInsetsGeometry>(
                                  EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 30),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color(0xff1DCDFE)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
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
                                padding: MaterialStateProperty.all<
                                    EdgeInsetsGeometry>(
                                  EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 30),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color(0xffEA4335)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
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
                                padding: MaterialStateProperty.all<
                                    EdgeInsetsGeometry>(
                                  EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 30),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color(0xff4064AC)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
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
                          onPressed: () {},
                          child: Text(
                            'Забули пароль?',
                            style: TextStyle(
                              color: Color(0xff2F455C),
                              fontSize: 16
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Створити акаунт',
                            style: TextStyle(
                              color: Color(0xff2F455C),
                              fontSize: 16
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        barrierDismissible: true);
  }

  @override
  Widget build(BuildContext context) {
    if (!autorised) {
      return Container(
        alignment: Alignment.center,
        child: Wrap(
          direction: Axis.vertical,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => LikedPosts(),
                  ),
                );
              },
              child: _card(
                MediaQuery.of(context).size.width * 0.9,
                MediaQuery.of(context).size.height * 0.1,
                Colors.white,
                'Збережене',
                Icon(
                  CommunityMaterialIcons.heart,
                  color: Colors.red,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                _signIn(context);
              },
              child: _card(
                MediaQuery.of(context).size.width * 0.9,
                MediaQuery.of(context).size.height * 0.1,
                Color(0xff1DCDFE),
                'Авторизуватися',
                Icon(
                  Icons.verified_user,
                  color: Color(0xff2F455C),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }
}
