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
      child: Container(
          child: Center(
              child: Text(
    "Selecione uma receita",
    style: TextStyle(
        color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
  ))));

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
      String posologia,
      List compradorVendedor) {
    seperarComprador() {
      List data = compradorVendedor;
      String todosCompradores = "";
      if (data[0].toString() == "Medicamento não comprado") {
        return "Medicamento não comprado";
      } else {
        for (int i = 0; i < data.length; i++) {
          todosCompradores = todosCompradores +
              "Quantidade Vendida: " +
              data[i]["quantidadeMedVendida"].toString() +
              "\n" +
              "Nome: " +
              data[i]["comprador"].toString() +
              "\n" +
              "Endereço: " +
              data[i]["enderecoComprador"].toString() +
              "\n" +
              "RG: " +
              data[i]["rg"].toString() +
              "\n" +
              "Telefone: " +
              data[i]["telefone"].toString() +
              "\n" +
              "\n";
        }
        return todosCompradores;
      }
    }

    seperarVendedor() {
      List data = compradorVendedor;
      String todosCompradores = "";
      if (data[0].toString() == "Medicamento não comprado") {
        return "Medicamento não comprado";
      } else {
        for (int i = 0; i < data.length; i++) {
          todosCompradores = todosCompradores +
              "\n" +
              "Quantidade Vendida: " +
              data[i]["quantidadeMedVendida"].toString() +
              "\n" +
              "Nome: " +
              data[i]["nomeVendedor"].toString() +
              "\n" +
              "cnpj: " +
              data[i]["cnpj"].toString() +
              "\n" +
              "data: " +
              getLastData(data[i]["data"].toString()) +
              "\n";
        }
        return todosCompradores;
      }
    }

    detalhesReceita = Card(
      elevation: 10,
      child: Container(
        color: ThemeData().primaryColorLight,
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
                      child: SelectableText(
                        "$idReceita",
                        style: textStyleConteudo(),
                      ),
                    ),
                    SelectableText(
                      "Data: ",
                      style: textStyleTitulo(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SelectableText(
                        "$data",
                        style: textStyleConteudo(),
                      ),
                    ),
                    SelectableText(
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
                    SelectableText(
                      "Endereço do Paciente: ",
                      style: textStyleTitulo(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SelectableText(
                        "$endPaciente",
                        style: textStyleConteudo(),
                      ),
                    ),
                    SelectableText(
                      "Nome Médico",
                      style: textStyleTitulo(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SelectableText(
                        "$nomeMedico",
                        style: textStyleConteudo(),
                      ),
                    ),
                    SelectableText(
                      "CRM Médico:",
                      style: textStyleTitulo(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SelectableText(
                        "$crmMedico",
                        style: textStyleConteudo(),
                      ),
                    ),
                    Divider(),
                    SelectableText(
                      "Dados do comprador:",
                      style: textStyleTitulo(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SelectableText(
                        seperarComprador(),
                        style: textStyleConteudo(),
                      ),
                    ),
                    Divider(),
                    SelectableText(
                      "Dados do Vendedor",
                      style: textStyleTitulo(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SelectableText(
                        seperarVendedor(),
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
                  SelectableText(qrCode),
                  SelectableText("Nome medicamento: ",
                      style: textStyleTitulo()),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SelectableText(
                      "$nomeMedicamento",
                      style: textStyleConteudo(),
                    ),
                  ),
                  SelectableText("Quantidade do medicamento: ",
                      style: textStyleTitulo()),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SelectableText(
                      "$qteMedicamento",
                      style: textStyleConteudo(),
                    ),
                  ),
                  SelectableText("Formula do Medicamento: ",
                      style: textStyleTitulo()),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SelectableText(
                      "$formulaMedicamento",
                      style: textStyleConteudo(),
                    ),
                  ),
                  SelectableText("Dose por unidade: ",
                      style: textStyleTitulo()),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SelectableText(
                      "$doseUnidade",
                      style: textStyleConteudo(),
                    ),
                  ),
                  SelectableText("Posologia: ", style: textStyleTitulo()),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SelectableText(
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
              child: SelectableText(
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                        flex: 1,
                        child: Container(
                            width: MediaQuery.of(context).size.width * 1,
                            color: Colors.grey.shade300,
                            child: SelectableText(
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
        future: ApiCollection.listaReceitas(host, port).getAllReceitas(),
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
                    String dataAjustada = getLastData(
                        content[(_counter - 1) - index]["state"]["data"]
                                ["dataEmissao"]
                            .toString());
                    List compradoresVendedores =
                        (content[(_counter - 1) - index]["state"]["data"]
                                        ["iouVenda"]
                                    .toString() ==
                                "null")
                            ? ["Medicamento não comprado"]
                            : content[(_counter - 1) - index]["state"]["data"]
                                ["iouVenda"]["venda"];

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
                              dataAjustada,
                              //Nome Paciente
                              content[(_counter - 1) - index]["state"]["data"]
                                      ["iouReceita"]["receita"]["nomePaciente"]
                                  .toString(),
                              //Endereço do Paciente
                              content[(_counter - 1) - index]["state"]["data"]["iouReceita"]
                                      ["receita"]["enderecoPaciente"]
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
                              content[(_counter - 1) - index]["state"]["data"]["linearId"]["id"].toString(),
                              //Nome Medicamento
                              content[(_counter - 1) - index]["state"]["data"]["iouReceita"]["receita"]["nomeMedicamento"].toString(),
                              //Quantidade receitada do medicamento
                              content[(_counter - 1) - index]["state"]["data"]["iouReceita"]["receita"]["quantidadeMedicamento"].toString(),
                              //Formula do medicamento
                              content[(_counter - 1) - index]["state"]["data"]["iouReceita"]["receita"]["formulaMedicamento"].toString(),
                              //Dose por unidade
                              content[(_counter - 1) - index]["state"]["data"]["iouReceita"]["receita"]["doseUnidade"].toString(),
                              //Posologia
                              content[(_counter - 1) - index]["state"]["data"]["iouReceita"]["receita"]["posologia"].toString(),
                              compradoresVendedores),
                        ),
                        Divider(),
                      ],
                    );
                  }),
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    semanticsLabel: "Buscando Informações no ledger",
                  ),
                  SelectableText("Buscando Informações no ledger")
                ],
              ),
            );
          }
        });
  }

  ajustData(String data) {
    String dataString = "";
    List listData = data.split("-").toList();
    listData.reversed.toList().forEach((element) {
      dataString = listData.reversed.toList().join("/");
    });
    return dataString;
  }

  getLastData(String dataJson) {
    String data = dataJson;
    String dia = ajustData(data.substring(0, data.indexOf("T")));
    String hora = data.substring((data.indexOf("T") + 1), data.indexOf("."));
    return "$dia às $hora";
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
