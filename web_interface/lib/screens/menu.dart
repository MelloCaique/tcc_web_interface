import 'package:flutter/material.dart';
import 'package:web_interface/data/data.dart';
import 'package:web_interface/services/cadastro.dart';
import 'package:web_interface/services/receitas.dart';
import 'package:web_interface/widgets/receitas_buttom.dart';

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
                                child: ReceitasButtom("Amarela", Colors.yellow),
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
                                child: ReceitasButtom("Azul", Colors.blue),
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
                                child: ReceitasButtom(
                                    "Branca", Colors.grey.withOpacity(0.2)),
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
      bottomNavigationBar: (instituicao == "Consultório A")
          ?
          // Serviços para consultórios
          BottomNavigationBar(
              backgroundColor: Theme.of(context).primaryColor.withOpacity(0.9),
              unselectedItemColor: Colors.black,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.dashboard),
                  label: "Banco de Receitas",
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.app_registration), label: "Cadastro")
              ],
              currentIndex: _selectedIndex,
              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              selectedItemColor: Colors.white,
            )
          :
          // Serviços para farmácias
          Container(
              height: 60,
              color: Theme.of(context).primaryColor.withOpacity(0.9),
              child: InkWell(
                onTap: () => null,
                child: Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Column(
                    children: <Widget>[
                      Icon(Icons.dashboard),
                      Text(
                        'Banco de Receitas',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
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
