import 'package:flutter/material.dart';
import 'package:web_interface/screens/menu.dart';
import 'package:web_interface/widgets/text_input.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = new TextEditingController();
  acesso() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Menu()));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Form(
        key: _formKey,
        child: Stack(
          children: <Widget>[
            Image.asset(
              'assets/images/login.jpg',
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 1,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Receituário Eletrônico",
                  style: textStyle(),
                ),
              ),
            ),
            Container(
              child: Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Divider(thickness: 2, color: Colors.white),
                                Center(
                                    child: Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Container(
                                    child: Text(
                                      "Consultório A",
                                      style: textStyle(),
                                    ),
                                  ),
                                )),
                                Divider(
                                  thickness: 2,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Flexible(
                                      flex: 3,
                                      child: Container(
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Flexible(
                                          flex: 3,
                                          child: InputText(
                                              _passwordController,
                                              "Password",
                                              "12345",
                                              "Inválido: Password não preenchido",
                                              true)),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    RaisedButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      color: Colors.red,
                                      child: Text('Login',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13.5,
                                              fontWeight: FontWeight.bold)),
                                      onPressed: () {
                                        setState(() {
                                          if (_formKey.currentState
                                              .validate()) {
                                            acesso();
                                          }
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  textStyle() {
    return TextStyle(
        fontStyle: FontStyle.italic, fontWeight: FontWeight.w600, fontSize: 30);
  }
}
