import 'package:flutter/material.dart';
import 'login/login_page.dart';

void main() => runApp(GUI());

class GUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "Exercício de Montagem GUI",
      home: LoginPage(),
      );
  }
}
