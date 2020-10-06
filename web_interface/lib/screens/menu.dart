import 'package:flutter/material.dart';
import 'package:web_interface/data/data.dart';
import 'package:web_interface/services/cadastro.dart';
import 'package:web_interface/services/receitas.dart';

import 'login.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int _selectedIndex = 0;

  static List<Widget> tabWidgetsDI = <Widget>[Receitas(), Cadastro()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Receituário Eletrônico",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Login()));
            }),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        child: Center(
            child: Column(
          children: [
            Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                      flex: 1,
                      child: Container(
                          width: MediaQuery.of(context).size.width * 1,
                          height: MediaQuery.of(context).size.height * 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                "$instituicao",
                                style: textStyle(),
                              ),
                            ),
                          ))),
                  Flexible(
                    flex: 1,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 1,
                      height: MediaQuery.of(context).size.height * 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Flexible(
                              flex: 1,
                              child: GestureDetector(
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 1,
                                  height:
                                      MediaQuery.of(context).size.height * 1,
                                  decoration: BoxDecoration(
                                    color: Colors.yellow,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        topRight: Radius.circular(30)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Center(
                                      child: Text(
                                        "Amarela",
                                        style: textStyleCards(),
                                      ),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  // botão receituário
                                },
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Flexible(
                              flex: 1,
                              child: GestureDetector(
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 1,
                                  height:
                                      MediaQuery.of(context).size.height * 1,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        topRight: Radius.circular(30)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Center(
                                        child: Text(
                                      "Azul",
                                      style: textStyleCards(),
                                    )),
                                  ),
                                ),
                                onTap: () {
                                  // Botão Rceituário
                                },
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Flexible(
                              flex: 1,
                              child: GestureDetector(
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 1,
                                  height:
                                      MediaQuery.of(context).size.height * 1,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.2),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        topRight: Radius.circular(30)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Center(
                                        child: Text(
                                      "Branca",
                                      style: textStyleCards(),
                                    )),
                                  ),
                                ),
                                onTap: () {
                                  // Botão Rceituário
                                },
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
            Flexible(
              flex: 8,
              child: tabWidgetsDI.elementAt(_selectedIndex),
            )
          ],
        )),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.9),
        unselectedItemColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            title: Text(
              'Banco de Receitas',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.app_registration),
            title: Text(
              'Cadastro',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          )
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedItemColor: Colors.white,
      ),
    );
  }

  textStyle() {
    return TextStyle(
        fontStyle: FontStyle.italic, fontWeight: FontWeight.w600, fontSize: 30);
  }

  textStyleCards() {
    return TextStyle(
        fontStyle: FontStyle.normal, fontWeight: FontWeight.w600, fontSize: 20);
  }
}
