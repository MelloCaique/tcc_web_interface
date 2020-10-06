import 'package:flutter/material.dart';
import 'package:web_interface/data/data.dart';
import 'package:web_interface/screens/menu.dart';
import 'package:web_interface/themes/custom_theme.dart';
import 'package:web_interface/themes/my_themes.dart';
import 'package:web_interface/widgets/text_input.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = new TextEditingController();
  var dropDownValue;
  void _changeTheme(BuildContext buildContext, MyThemeKeys key) {
    CustomTheme.instanceOf(buildContext).changeTheme(key);
  }

  acesso() {
    instituicao = dropDownValue;
    if (instituicao == "Consultório A") {
      port = "10055";
      host = "191.232.160.49";
    }
    if (instituicao == "Farmácia A") {
      port = "10056";
      host = "52.177.205.133";
    }
    if (instituicao == "Farmácia B") {
      port = "10057";
      host = "52.177.206.117";
    }
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
                                    child: Container(
                                      child: (dropDownValue == null)
                                          ? Text(
                                              '',
                                            )
                                          : Text(
                                              "$dropDownValue",
                                              style: textStyle(),
                                            ),
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
                                      child: Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: new PhysicalModel(
                                            color: Colors.white,
                                            shadowColor: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            elevation: 0,
                                            child: DropdownButtonFormField(
                                              hint: Text('SELECIONE O BANCO'),
                                              value: dropDownValue,
                                              icon: Icon(Icons.arrow_downward),
                                              iconSize: 20,
                                              isExpanded: true,
                                              elevation: 5,
                                              items: <String>[
                                                'Consultório A',
                                                'Farmácia A',
                                                'Farmácia B',
                                              ].map<DropdownMenuItem<String>>(
                                                  (String value) {
                                                return DropdownMenuItem<String>(
                                                    value: value,
                                                    child: Text(value));
                                              }).toList(),
                                              validator: (value) => value ==
                                                      null
                                                  ? '    Inválido: Organização não preenchida'
                                                  : null,
                                              onChanged: (newValue) {
                                                if (newValue ==
                                                    'Consultório A') {
                                                  _changeTheme(
                                                      context,
                                                      MyThemeKeys
                                                          .CONSULTORIO_A);
                                                }
                                                if (newValue == 'Farmácia A') {
                                                  _changeTheme(context,
                                                      MyThemeKeys.FARMACIA_A);
                                                }
                                                if (newValue == 'Farmácia B') {
                                                  _changeTheme(context,
                                                      MyThemeKeys.FARMACIA_B);
                                                }
                                                setState(() {
                                                  dropDownValue = newValue;
                                                });
                                              },
                                            )),
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
