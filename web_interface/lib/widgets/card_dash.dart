import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CardDash extends StatefulWidget {
  String idReceita;
  String data;
  String nomePaciente;
  String nomeMedicamento;
  String qrCode;

  CardDash(
      [this.idReceita,
      this.data,
      this.nomePaciente,
      this.nomeMedicamento,
      this.qrCode]);

  @override
  _CardDashState createState() => _CardDashState();
}

class _CardDashState extends State<CardDash> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        color: ThemeData().primaryColorLight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("ID Receita: ", style: textStyleTitulo()),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    "${widget.idReceita}",
                    style: textStyleConteudo(),
                  ),
                ),
                Text("Data: ", style: textStyleTitulo()),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    "${widget.data}",
                    style: textStyleConteudo(),
                  ),
                ),
                Text("Nome Paciente: ", style: textStyleTitulo()),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    "${widget.nomePaciente}",
                    style: textStyleConteudo(),
                  ),
                ),
                Text("Nome Paciente: ", style: textStyleTitulo()),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    "${widget.nomeMedicamento}",
                    style: textStyleConteudo(),
                  ),
                ),
              ],
            ),
            QrImage(
              data: widget.qrCode,
              version: QrVersions.auto,
              size: MediaQuery.of(context).size.height * 0.15,
            ),
          ],
        ),
      ),
    );
  }

  textStyleTitulo() {
    return TextStyle(
        color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12);
  }

  textStyleConteudo() {
    return TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.grey,
        fontStyle: FontStyle.italic,
        fontSize: 12);
  }
}
