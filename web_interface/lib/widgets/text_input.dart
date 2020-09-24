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
            if (labelText == "ID" && int.tryParse(value) == null) {
              return "$labelText Inválido: Digite apenas números";
            }
            if (labelText == "CNPJ Importador" && int.tryParse(value) == null) {
              return "$labelText Inválido: Digite apenas números";
            }
            if (labelText == "VMLD Canônico" &&
                double.tryParse(value) == null) {
              return "$labelText Inválido: Digite um número real. Utilizar (.) para centavos";
            }
            if (labelText == "Porcentagem" && double.tryParse(value) == null) {
              return "$labelText Inválido: Digite um número real. Utilizar (.) para decimais";
            } else if (labelText == "Porcentagem" &&
                double.tryParse(value) <= 0) {
              return "$labelText Inválido: O número deve ser MAIOR QUE ZERO";
            } else if (labelText == "Porcentagem" &&
                double.tryParse(value) > 100.0) {
              return "$labelText Inválido: A porcentagem total deve ser menor que 100%, verifique a DI atual";
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
