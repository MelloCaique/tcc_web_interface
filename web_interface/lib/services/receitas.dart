import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:web_interface/api/api.dart';
import 'package:web_interface/data/data.dart';
import 'package:web_interface/widgets/card_dash.dart';

class Receitas extends StatefulWidget {
  @override
  _ReceitasState createState() => _ReceitasState();
}

class _ReceitasState extends State<Receitas> {
  Widget detalhesReceita = Center(
      child: Container(child: Center(child: Text("Selecione uma receita"))));

  // Gera a receita completa a partir do card selecionado
  showDetails(
      String idReceita,
      String data,
      String nomePaciente,
      String endPaciente,
      String nomeMedico,
      String crmMedico,
      String qrCode,
      String nomeMedicamento,
      String qteMedicamento,
      String formulaMedicamento,
      String doseUnidade,
      String posologia) {
    detalhesReceita = Card(
      elevation: 10,
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("ID Receita: ", style: textStyleTitulo()),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "$idReceita",
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
                        "$data",
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
                        "$nomePaciente",
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
                        "$endPaciente",
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
                        "$nomeMedico",
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
                        "$crmMedico",
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
                    data: qrCode,
                    version: QrVersions.auto,
                    size: MediaQuery.of(context).size.height * 0.15,
                  ),
                  Text("Nome medicamento: ", style: textStyleTitulo()),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      "$nomeMedicamento",
                      style: textStyleConteudo(),
                    ),
                  ),
                  Text("Quantidade do medicamento: ", style: textStyleTitulo()),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      "$qteMedicamento",
                      style: textStyleConteudo(),
                    ),
                  ),
                  Text("Formula do Medicamento: ", style: textStyleTitulo()),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      "$formulaMedicamento",
                      style: textStyleConteudo(),
                    ),
                  ),
                  Text("Dose por unidade: ", style: textStyleTitulo()),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      "$doseUnidade",
                      style: textStyleConteudo(),
                    ),
                  ),
                  Text("Posologia: ", style: textStyleTitulo()),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      "$posologia",
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
                        child: updateList(),
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

  //Faz a extração das informções da API e gera a lista de receitas
  Widget updateList() {
    return new FutureBuilder(
        future: ApiCollection.listaReceitas(host, port).getMyReceitas(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            var content = snapshot.data;
            var _counter = content.length;
            var index;
            return Scrollbar(
              child: ListView.builder(
                  physics: index,
                  itemCount: _counter,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        GestureDetector(
                          //Infomações dos cards da lista de receitas
                          child: CardDash(
                            //ID Receita
                            content[(_counter - 1) - index]["state"]["data"]
                                    ["iouReceita"]["receita"]["numeroReceita"]
                                .toString(),
                            //Data Emissão
                            content[(_counter - 1) - index]["state"]["data"]
                                    ["dataEmissao"]
                                .toString(),
                            //Nome Paciente
                            content[(_counter - 1) - index]["state"]["data"]
                                    ["iouReceita"]["receita"]["nomePaciente"]
                                .toString(),
                            //Nome Medicamento
                            content[(_counter - 1) - index]["state"]["data"]
                                    ["iouReceita"]["receita"]["nomeMedicamento"]
                                .toString(),
                            //QrCode Receita
                            content[(_counter - 1) - index]["state"]["data"]
                                    ["linearId"]["id"]
                                .toString(),
                          ),
                          //Informações da receita completa
                          onTap: () => showDetails(
                            //ID Receita
                            content[(_counter - 1) - index]["state"]["data"]
                                    ["iouReceita"]["receita"]["numeroReceita"]
                                .toString(),
                            //Data Emissão
                            content[(_counter - 1) - index]["state"]["data"]
                                    ["dataEmissao"]
                                .toString(),
                            //Nome Paciente
                            content[(_counter - 1) - index]["state"]["data"]
                                    ["iouReceita"]["receita"]["nomePaciente"]
                                .toString(),
                            //Endereço do Paciente
                            content[(_counter - 1) - index]["state"]["data"]
                                        ["iouReceita"]["receita"]
                                    ["enderecoPaciente"]
                                .toString(),
                            //Nome Médico
                            content[(_counter - 1) - index]["state"]["data"]
                                    ["iouReceita"]["receita"]["nomeMedico"]
                                .toString(),
                            //CRM Médico
                            content[(_counter - 1) - index]["state"]["data"]
                                    ["iouReceita"]["receita"]["crmMedico"]
                                .toString(),
                            //QrCode Receita
                            content[(_counter - 1) - index]["state"]["data"]
                                    ["linearId"]["id"]
                                .toString(),
                            //Nome Medicamento
                            content[(_counter - 1) - index]["state"]["data"]
                                    ["iouReceita"]["receita"]["nomeMedicamento"]
                                .toString(),
                            //Quantidade receitada do medicamento
                            content[(_counter - 1) - index]["state"]["data"]
                                        ["iouReceita"]["receita"]
                                    ["quantidadeMedicamento"]
                                .toString(),
                            //Formula do medicamento
                            content[(_counter - 1) - index]["state"]["data"]
                                        ["iouReceita"]["receita"]
                                    ["formulaMedicamento"]
                                .toString(),
                            //Dose por unidade
                            content[(_counter - 1) - index]["state"]["data"]
                                    ["iouReceita"]["receita"]["doseUnidade"]
                                .toString(),
                            //Posologia
                            content[(_counter - 1) - index]["state"]["data"]
                                    ["iouReceita"]["receita"]["posologia"]
                                .toString(),
                          ),
                        ),
                        Divider(),
                      ],
                    );
                  }),
            );
          } else {
            return CircularProgressIndicator(
              semanticsLabel: "Buscando Informações no ledger",
            );
          }
        });
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
