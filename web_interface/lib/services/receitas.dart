import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:web_interface/widgets/card_dash.dart';

class Receitas extends StatefulWidget {
  @override
  _ReceitasState createState() => _ReceitasState();
}

class _ReceitasState extends State<Receitas> {
  Widget detalhesReceita = Center(child: Text("Selecione uma receita"));
  String qrCodeReceita = "a3843ffd-9e81-4b0c-b9aa-52fca8307198";

  showDetails(int index) {
    //detalhesReceita = Text("Receita show $index");
    detalhesReceita = Card(
      elevation: 10,
      child: Container(
        color: Colors.white,
        //ThemeData().primaryColorLight,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("ID Receita: ", style: textStyleTitulo()),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "$index",
                        style: textStyleConteudo(),
                      ),
                    ),
                    Text(
                      "Data: ",
                      style: textStyleTitulo(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "23/10/2020",
                        style: textStyleConteudo(),
                      ),
                    ),
                    Text(
                      "Nome Paciente: ",
                      style: textStyleTitulo(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "Caique",
                        style: textStyleConteudo(),
                      ),
                    ),
                    Text(
                      "Endereço do Paciente: ",
                      style: textStyleTitulo(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "Av. Júlio de Mesquita, 432, Centro",
                        style: textStyleConteudo(),
                      ),
                    ),
                    Text(
                      "Nome Médico",
                      style: textStyleTitulo(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "Rubens Neto",
                        style: textStyleConteudo(),
                      ),
                    ),
                    Text(
                      "CRM Médico:",
                      style: textStyleTitulo(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "84985733",
                        style: textStyleConteudo(),
                      ),
                    ),
                    Divider(),
                    Text(
                      "Dados do comprador:",
                      style: textStyleTitulo(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "Qte medicamendo vendida: 30 \n Comprador: Fernanda \n Endereço: Av. Carvalho, 123, jd. paulista \n RG: 985734758 \n Telefone: 74776884",
                        style: textStyleConteudo(),
                      ),
                    ),
                    Divider(),
                    Text(
                      "Dados do Vendedor",
                      style: textStyleTitulo(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "Vendedor: Pedro \n CNPJ: 129387584 \n Data: 23/10/2020",
                        style: textStyleConteudo(),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  QrImage(
                    data: qrCodeReceita,
                    version: QrVersions.auto,
                    size: MediaQuery.of(context).size.height * 0.15,
                  ),
                  Text("Nome medicamento: ", style: textStyleTitulo()),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      "Sibutramina",
                      style: textStyleConteudo(),
                    ),
                  ),
                  Text("Quantidade do medicamento: ", style: textStyleTitulo()),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      "60",
                      style: textStyleConteudo(),
                    ),
                  ),
                  Text("Formula do Medicamento: ", style: textStyleTitulo()),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      "Sibutramina",
                      style: textStyleConteudo(),
                    ),
                  ),
                  Text("Dose por unidade: ", style: textStyleTitulo()),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      "15mg p/ cp",
                      style: textStyleConteudo(),
                    ),
                  ),
                  Text("Posologia: ", style: textStyleTitulo()),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      "1 cp à noite",
                      style: textStyleConteudo(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
    setState(() {});
  }

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
          child: Row(
            children: [
              Flexible(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                        flex: 1,
                        child: Container(
                            width: MediaQuery.of(context).size.width * 1,
                            color: Colors.grey.shade300,
                            child: Text(
                              "Lista de receitas",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ))),
                    Flexible(
                      flex: 8,
                      child: Container(
                        child: ListView.builder(itemBuilder: (_, index) {
                          return GestureDetector(
                            //Tratar os dados e passar para a lista.
                            child: CardDash("$index", "12/10/2020", "Caique",
                                "Sibutramina"),
                            //Tratar os dados e passar para a receita completa.
                            onTap: () => showDetails(index),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                  flex: 2,
                  child: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.height * 1,
                      height: MediaQuery.of(context).size.width * 1,
                      //color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView(
                          scrollDirection: Axis.vertical,
                          children: [detalhesReceita],
                        ),
                      ),
                    ),
                  ))
            ],
          ),
        )
      ],
    );
  }

  textStyleTitulo() {
    return TextStyle(
        color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14);
  }

  textStyleConteudo() {
    return TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.grey,
        fontStyle: FontStyle.italic,
        fontSize: 14);
  }
}
