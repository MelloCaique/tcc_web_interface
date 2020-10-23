import 'package:flutter/material.dart';

class ReceitasButtom extends StatelessWidget {
  String label;
  Color color;
  ReceitasButtom([this.label, this.color]);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 1,
      height: MediaQuery.of(context).size.height * 1,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Center(
            child: Text(
          label,
          style: textStyleCards(),
        )),
      ),
    );
  }

  textStyleCards() {
    return TextStyle(
        fontStyle: FontStyle.normal, fontWeight: FontWeight.w600, fontSize: 20);
  }
}
