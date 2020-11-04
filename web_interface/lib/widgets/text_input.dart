import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputText extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final String errorText;
  final bool obscureText;

  InputText(this.controller, this.labelText, this.hintText, this.errorText,
      [this.obscureText]);

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.white,
      shadowColor: Colors.black,
      borderRadius: BorderRadius.circular(10),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: TextFormField(
          controller: controller,
          validator: (value) {
            if (value.isEmpty) {
              return "   $errorText";
            }
            if (labelText == "Número da receita" &&
                int.tryParse(value) == null) {
              return "$labelText Inválido: Digite apenas números";
            }
            if (labelText == "Nome do paciente" &&
                int.tryParse(value) != null) {
              return "$labelText Inválido: Digite o nome da rua/av e depois o número";
            }
            if (labelText == "Endereço do paciente" &&
                int.tryParse(value) != null) {
              return "$labelText Inválido: Digite apenas letras";
            }
            if (labelText == "Nome do médico" && int.tryParse(value) != null) {
              return "$labelText Inválido: Digite apenas letras";
            }
            if (labelText == "CRM médico" && int.tryParse(value) == null) {
              return "$labelText Inválido: Digite apenas números";
            }
            if (labelText == "Nome do medicamento" &&
                int.tryParse(value) != null) {
              return "$labelText Inválido: Digite apenas letras";
            }
            if (labelText == "Fórmula do medicamento" &&
                int.tryParse(value) != null) {
              return "$labelText Inválido";
            }
            if (labelText == "Posologia" && int.tryParse(value) != null) {
              return "$labelText Inválido";
            }
            if (labelText == "Quantidade de medicamento" &&
                int.tryParse(value) == null) {
              return "$labelText Inválido: Digite apenas números";
            } else if (labelText == "Quantidade de medicamento" &&
                int.tryParse(value) <= 0) {
              return "$labelText Inválido: O número deve ser MAIOR QUE ZERO";
            } else if (labelText == "Quantidade de medicamento" &&
                int.tryParse(value) > 60) {
              return "$labelText Inválido: A quantia deve ser menor que 60";
            }
            if (labelText == "Dose por unidade" &&
                int.tryParse(value) == null) {
              return "$labelText Inválido: Digite apenas números";
            } else if (labelText == "Dose por unidade" &&
                int.tryParse(value) <= 0) {
              return "$labelText Inválido: O número deve ser MAIOR QUE ZERO";
            } else if (labelText == "Dose por unidade" &&
                int.tryParse(value) > 15) {
              return "$labelText Inválido: A quantia deve ser menor que 15";
            }
          },
          obscureText: (obscureText == null) ? false : true,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            labelText: " $labelText ",
            hintText: " \"$hintText\"",
          ),
        ),
      ),
    );
  }
}
