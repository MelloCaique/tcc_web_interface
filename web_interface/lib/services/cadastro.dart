import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:web_interface/api/api.dart';
import 'package:web_interface/data/data.dart';
import 'package:web_interface/widgets/text_input.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final _formKey = GlobalKey<FormState>();

  final _numeroReceitaController = new TextEditingController();
  final _nomePacienteController = new TextEditingController();
  final _enderecoPacienteController = new TextEditingController();
  final _nomeMedicoController = new TextEditingController();
  final _crmMedicoController = new TextEditingController();
  final _nomeMedicamentoController = new TextEditingController();
  final _quantidadeMedicamentoController = new TextEditingController();
  final _formulaMedicamentoController = new TextEditingController();
  final _doseUnidadeController = new TextEditingController();
  final _posologiaController = new TextEditingController();

  int numeroReceita;
  String nomePaciente;
  String enderecoPaciente;
  String nomeMedico;
  int crmMedico;
  String nomeMedicamento;
  int quantidadeMedicamento;
  String formulaMedicamento;
  int doseUnidade;
  String posologia;

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
            fit: FlexFit.loose,
            child: Row(
              children: [
                Flexible(
                  flex: 3,
                  child: Container(
                    color: Theme.of(context).primaryColor.withOpacity(0.1),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 150, right: 150),
                      child: SingleChildScrollView(
                        child: Column(children: [
                          InputText(
                              _numeroReceitaController,
                              "Número da receita",
                              "Ex.:12795832",
                              "Número inválido"),
                          SizedBox(height: 10),
                          InputText(_nomePacienteController, "Nome do paciente",
                              "Ex.:John Doe", "Nome inválido"),
                          SizedBox(height: 10),
                          InputText(
                              _enderecoPacienteController,
                              "Endereço do paciente",
                              "Ex.:Rua: rosa, 18, jardim das flores",
                              "endereço inválido"),
                          SizedBox(height: 10),
                          InputText(_nomeMedicoController, "Nome do médico",
                              "Ex.:Dr. John Doe", "Nome inválido"),
                          SizedBox(height: 10),
                          InputText(_crmMedicoController, "CRM médico",
                              "Ex.:433212", "CRM inválido"),
                          SizedBox(height: 10),
                          InputText(
                              _nomeMedicamentoController,
                              "Nome do medicamento",
                              "Ex.:Sibutramina",
                              "Medicamento inválido"),
                          SizedBox(height: 10),
                          InputText(
                              _quantidadeMedicamentoController,
                              "Quantidade de medicamento",
                              "Ex.: 60",
                              "Quantidade inválida"),
                          SizedBox(height: 10),
                          InputText(
                              _formulaMedicamentoController,
                              "Fórmula do medicamento",
                              "Ex.:Sbtr",
                              "Fórmula inválida"),
                          SizedBox(height: 10),
                          InputText(_doseUnidadeController, "Dose por unidade",
                              "Ex.:10", "Dose inválida"),
                          SizedBox(height: 10),
                          InputText(_posologiaController, "Posologia",
                              "Ex.:1 cp por dia", "Posologia inválida"),
                        ]),
                      ),
                    ),
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
                                borderRadius: BorderRadius.circular(5)),
                            color: Colors.red,
                            child: Text('Cadastrar',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13.5,
                                    fontWeight: FontWeight.bold)),
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                numeroReceita =
                                    int.parse(_numeroReceitaController.text);
                                nomePaciente = _nomePacienteController.text;
                                enderecoPaciente =
                                    _enderecoPacienteController.text;
                                nomeMedico = _nomeMedicoController.text;
                                crmMedico =
                                    int.parse(_crmMedicoController.text);
                                nomeMedicamento = _nomeMedicoController.text;
                                quantidadeMedicamento = int.parse(
                                    _quantidadeMedicamentoController.text);
                                formulaMedicamento =
                                    _formulaMedicamentoController.text;
                                doseUnidade =
                                    int.parse(_doseUnidadeController.text);
                                posologia = _posologiaController.text;
                                setState(() {
                                  cadastro();
                                });
                              }
                            },
                          ),
                          RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            color: Colors.red,
                            child: Text('Apagar dados',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13.5,
                                    fontWeight: FontWeight.bold)),
                            onPressed: () {
                              setState(() {
                                _numeroReceitaController.clear();
                                _nomePacienteController.clear();
                                _enderecoPacienteController.clear();
                                _nomeMedicoController.clear();
                                _crmMedicoController.clear();
                                _nomeMedicamentoController.clear();
                                _quantidadeMedicamentoController.clear();
                                _formulaMedicamentoController.clear();
                                _doseUnidadeController.clear();
                                _posologiaController.clear();
                              });
                            },
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }

  cadastro() {
    showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 3,
          backgroundColor: Colors.white,
          title: SelectableText("Cadastro de receita AZUL"),
          content: FutureBuilder(
              future: ApiCollection.cadastro(
                      host,
                      port,
                      numeroReceita,
                      nomePaciente,
                      enderecoPaciente,
                      nomeMedico,
                      crmMedico,
                      nomeMedicamento,
                      quantidadeMedicamento,
                      formulaMedicamento,
                      doseUnidade,
                      posologia)
                  .cadastroReceita(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasData) {
                  var data = snapshot.data;
                  if (data.toString().startsWith("Transaction")) {
                    List qrCode = data.toString().split(".");
                    return Container(
                      height: 350,
                      width: 650,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Receita cadastrada com sucesso!",
                            style: textStyleTitulo(),
                          ),
                          Center(child: Text("QRCode da receita")),
                          QrImage(
                            data: qrCode[1],
                            version: QrVersions.auto,
                            size: MediaQuery.of(context).size.height * 0.15,
                          ),
                          FlatButton(
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.1),
                              textColor: Colors.black,
                              child: Text('OK'),
                              onPressed: () {
                                _numeroReceitaController.clear();
                                _nomePacienteController.clear();
                                _enderecoPacienteController.clear();
                                _nomeMedicoController.clear();
                                _crmMedicoController.clear();
                                _nomeMedicamentoController.clear();
                                _quantidadeMedicamentoController.clear();
                                _formulaMedicamentoController.clear();
                                _doseUnidadeController.clear();
                                _posologiaController.clear();
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
                            "Erro no cadastro da receita",
                            style: textStyleTitulo(),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SelectableText(
                            "Erro: " + data.toString(),
                            textAlign: TextAlign.center,
                          ),
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
                            semanticsLabel: "Cadastrando receita. Aguarde.",
                          ),
                          SelectableText("Cadastrando receita. Aguarde.")
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
        color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20);
  }
}
