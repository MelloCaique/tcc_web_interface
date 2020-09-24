import 'package:flutter/material.dart';

class Receitas extends StatefulWidget {
  @override
  _ReceitasState createState() => _ReceitasState();
}

class _ReceitasState extends State<Receitas> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          color: Colors.blue,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Banco de receita AZUL',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
        Flexible(
          fit: FlexFit.loose,
          child: Container(
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            child: Container(),
          ),
        )
      ],
    );
  }
}
