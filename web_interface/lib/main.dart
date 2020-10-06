import 'package:flutter/material.dart';
import 'package:web_interface/screens/login.dart';
import 'package:web_interface/themes/custom_theme.dart';
import 'package:web_interface/themes/my_themes.dart';

void main() =>
    runApp(CustomTheme(initialThemeKey: MyThemeKeys.DEFAULT, child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Controle Receitas',
        theme: CustomTheme.of(context),
        home: Login());
  }
}
