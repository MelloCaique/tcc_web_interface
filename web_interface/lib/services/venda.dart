import 'package:flutter/material.dart';
import 'package:web_interface/api/api.dart';
import 'package:web_interface/data/data.dart';
import 'package:web_interface/widgets/text_input.dart';

class Venda extends StatefulWidget {
  @override
  _VendaState createState() => _VendaState();
}

class _VendaState extends State<Venda> {
  final _formKey = GlobalKey<FormState>();

  final _linearIdController = new TextEditingController();
  final _quantidadeMedVendidaController = new TextEditingController();
  final _compradorController = new TextEditingController();
  final _enderecoCompradorController = new TextEditingController();
  final _rgController = new TextEditingController();
  final _telefoneController = new TextEditingController();
  final _nomeVendedorController = new TextEditingController();
  final _cnpjController = new TextEditingController();

  String linearId;
  int quantidadeMedVendida;
  String comprador;
  String enderecoComprador;
  int rg;
  int telefone;
  String nomeVendedor;
  int cnpj;

  bool statusVenda = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            color: Colors.blue,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Cadastro de receita AZUL',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  flex: 3,
                  child: InputText(
                      _linearIdController,
                      "Código de indentificação do QRCode",
                      "Ex.:1b2c74a3-4c4d-45dc-8514-b32dfa38fd64",
                      "Código inválido"),
                ),
                Flexible(
                    flex: 1,
                    child: (statusVenda == false)
                        ? RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            color: Colors.red,
                            child: Text('Pesquisar',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13.5,
                                    fontWeight: FontWeight.bold)),
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                linearId = _linearIdController.text;
                                setState(() {
                                  checkReceita();
                                });
                              }
                            },
                          )
                        : Container())
              ],
            )),
          ),
          Flexible(
              flex: 5,
              child: (statusVenda == true)
                  ? Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Flexible(
                              flex: 3,
                              child: SingleChildScrollView(
                                child: Column(children: [
                                  InputText(
                                      _quantidadeMedVendidaController,
                                      "Quantidade de venda do medicamento",
                                      "Ex.:30",
                                      "Número inválido"),
                                  SizedBox(height: 10),
                                  InputText(
                                      _compradorController,
                                      "Nome do comprador",
                                      "Ex.:John Doe",
                                      "Nome inválido"),
                                  SizedBox(height: 10),
                                  InputText(
                                      _enderecoCompradorController,
                                      "Endereço do comprador",
                                      "Ex.:Rua: rosa, 18, jardim das flores",
                                      "endereço inválido"),
                                  SizedBox(height: 10),
                                  InputText(_rgController, "RG do comprador",
                                      "Ex.:590958735", "RG inválido"),
                                  SizedBox(height: 10),
                                  InputText(
                                      _telefoneController,
                                      "Telefone comprador",
                                      "Ex.:11885773275",
                                      "Telefone inválido"),
                                  SizedBox(height: 10),
                                  InputText(
                                      _nomeVendedorController,
                                      "Nome do vendedor",
                                      "Ex.:John Doe",
                                      "Nome inválido"),
                                  SizedBox(height: 10),
                                  InputText(_cnpjController, "CNPJ Vendedor",
                                      "Ex.:15873895905", "CNPJ inválido"),
                                ]),
                              ),
                            ),
                            Flexible(
                                flex: 1,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      RaisedButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        color: Colors.red,
                                        child: Text('Cadastrar venda',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13.5,
                                                fontWeight: FontWeight.bold)),
                                        onPressed: () async {
                                          if (_formKey.currentState
                                              .validate()) {
                                            linearId = _linearIdController.text;
                                            quantidadeMedVendida = int.parse(
                                                _quantidadeMedVendidaController
                                                    .text);
                                            comprador =
                                                _compradorController.text;
                                            rg = int.parse(_rgController.text);
                                            enderecoComprador =
                                                _enderecoCompradorController
                                                    .text;
                                            telefone = int.parse(
                                                _telefoneController.text);
                                            nomeVendedor =
                                                _nomeVendedorController.text;
                                            cnpj =
                                                int.parse(_cnpjController.text);
                                            setState(() {
                                              venda();
                                            });
                                          }
                                        },
                                      ),
                                      RaisedButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        color: Colors.red,
                                        child: Text('Apagar dados',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13.5,
                                                fontWeight: FontWeight.bold)),
                                        onPressed: () {
                                          setState(() {
                                            _linearIdController.clear();
                                            _quantidadeMedVendidaController
                                                .clear();
                                            _compradorController.clear();
                                            _enderecoCompradorController
                                                .clear();
                                            _rgController.clear();
                                            _telefoneController.clear();
                                            _nomeVendedorController.clear();
                                            _cnpjController.clear();
                                            statusVenda = false;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      ),
                    )
                  : Container(
                      child: Center(
                        child: Text("Insira o código (QRCode) da receita"),
                      ),
                    ))
        ],
      ),
    );
  }

  checkReceita() {
    showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 3,
          backgroundColor: Colors.white,
          title: SelectableText("Verificação de receita"),
          content: FutureBuilder(
              future: ApiCollection.checkReceita(
                host,
                port,
                linearId,
              ).checkQRCode(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasData) {
                  var data = snapshot.data;
                  if (data.toString().startsWith("Receita")) {
                    return Container(
                      height: 350,
                      width: 650,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Pesquisa receita",
                            style: textStyleTitulo(),
                          ),
                          Text(
                            data.toString(),
                          ),
                          FlatButton(
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.1),
                              textColor: Colors.black,
                              child: Text('OK'),
                              onPressed: () {
                                setState(() {
                                  statusVenda = true;
                                });
                                Navigator.of(context).pop();
                              })
                        ],
                      ),
                    );
                  } else if (data.toString().startsWith("Erro:")) {
                    return Container(
                      height: 350,
                      width: 650,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SelectableText(
                            "Pesquisa de receita",
                            style: textStyleTitulo(),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SelectableText(data.toString()),
                          SizedBox(
                            height: 10,
                          ),
                          FlatButton(
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.1),
                              textColor: Colors.black,
                              child: Text('OK'),
                              onPressed: () {
                                setState(() {
                                  statusVenda = false;
                                });
                                Navigator.of(context).pop();
                              })
                        ],
                      ),
                    );
                  } else {
                    return Container(
                      height: 350,
                      width: 650,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SelectableText(
                            "Pesquisa de receita",
                            style: textStyleTitulo(),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SelectableText(
                              "Erro no código de validação. O mesmo deve seguir o padrão 36-char." +
                                  "\n Ex.: 1b2c74a3-4c4d-45dc-8514-b32dfa38fd64"),
                          SizedBox(
                            height: 10,
                          ),
                          FlatButton(
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.1),
                              textColor: Colors.black,
                              child: Text('OK'),
                              onPressed: () {
                                setState(() {
                                  statusVenda = false;
                                });
                                Navigator.of(context).pop();
                              })
                        ],
                      ),
                    );
                  }
                } else {
                  return Container(
                      height: 120,
                      width: 650,
                      child: Center(
                          child: Column(
                        children: [
                          CircularProgressIndicator(
                            semanticsLabel: "Pesquisando receita. Aguarde.",
                          ),
                          SelectableText("Pesquisando receita. Aguarde."),
                        ],
                      )));
                }
              }),
        );
      },
    );
  }

  venda() {
    showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 3,
          backgroundColor: Colors.white,
          title: SelectableText("Cadastro de venda de receita B2"),
          content: FutureBuilder(
              future: ApiCollection.vendaReceita(
                      host,
                      port,
                      linearId,
                      quantidadeMedVendida,
                      comprador,
                      enderecoComprador,
                      rg,
                      telefone,
                      nomeVendedor,
                      cnpj)
                  .vendaReceita(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasData) {
                  var data = snapshot.data;
                  if (data.toString().startsWith("Transaction")) {
                    return Container(
                      height: 350,
                      width: 650,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Venda cadastrada com sucesso",
                            style: textStyleTitulo(),
                          ),
                          Text(
                            data.toString(),
                          ),
                          FlatButton(
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.1),
                              textColor: Colors.black,
                              child: Text('OK'),
                              onPressed: () {
                                setState(() {
                                  _linearIdController.clear();
                                  _quantidadeMedVendidaController.clear();
                                  _compradorController.clear();
                                  _enderecoCompradorController.clear();
                                  _rgController.clear();
                                  _telefoneController.clear();
                                  _nomeVendedorController.clear();
                                  _cnpjController.clear();
                                  statusVenda = false;
                                });
                                Navigator.of(context).pop();
                              })
                        ],
                      ),
                    );
                  } else {
                    return Container(
                      height: 350,
                      width: 650,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SelectableText(
                            "Erro ao cadastrar a venda",
                            style: textStyleTitulo(),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SelectableText(data.toString()),
                          SizedBox(
                            height: 10,
                          ),
                          FlatButton(
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.1),
                              textColor: Colors.black,
                              child: Text('OK'),
                              onPressed: () {
                                setState(() {
                                  statusVenda = true;
                                });
                                Navigator.of(context).pop();
                              })
                        ],
                      ),
                    );
                  }
                } else {
                  return Container(
                      height: 120,
                      width: 650,
                      child: Center(
                          child: Column(
                        children: [
                          CircularProgressIndicator(
                            semanticsLabel:
                                "Cadastrando venda da receita. Aguarde.",
                          ),
                          SelectableText(
                              "Cadastrando venda da receita. Aguarde.")
                        ],
                      )));
                }
              }),
        );
      },
    );
  }

  textStyleTitulo() {
    return TextStyle(
        color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12);
  }
}
