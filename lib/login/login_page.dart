import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exercício de Montagem GUI"),
        backgroundColor: Colors.pinkAccent[100],
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              child: Text('Tela de Cadastro',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.pink[200],
                  fontWeight: FontWeight.bold,
                ),
              ),
              margin: EdgeInsets.fromLTRB(20, 30, 20, 30),
            ),
            Container(
              child: _formulario(),
            ),
            Container(
              child: _botoesFormulario(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _formulario() {
    return Container(
      height: 280.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _inputFormulario('Nome', Icons.person, 'Digite o seu nome'),
          Spacer(flex: 1),
          _inputFormulario('Endereço', Icons.house_siding, 'Digite o seu endereço'),
          Spacer(flex: 1),
          _inputFormulario('Email', Icons.email, 'Digite o seu email'),
        ],
      ),
    );
  }

  Widget _inputFormulario(String label, IconData icone, String hintText) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(label, style: TextStyle(color: Colors.pink[200], fontSize: 16)),
          TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(icone, color: Colors.pink[200]),
              labelText: hintText,
              hintStyle: TextStyle(color: Colors.black38),
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black38, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.pink, width: 1),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _botoesFormulario(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 20, 20, 0),
      child: Row(
        children: <Widget>[
          Spacer(flex: 6),
          _botao(context, 'Cancelar'),
          Spacer(flex: 1),
          _botao(context, 'Salvar'),
        ],
      ),
    );
  }

  Widget _botao(BuildContext context, String titulo) {
    return ElevatedButton(
      onPressed: () {
        _showDialog(context, titulo);
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.pinkAccent),
        padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
              (Set<MaterialState> states) {
            return EdgeInsets.fromLTRB(20, 10, 20, 10);
          },
        ),
      ),
      child: Text(
        titulo,
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }

  void _showDialog(BuildContext context, String buttonTitle) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Botão Clicado"),
          content: Text("Você clicou no botão '$buttonTitle'"),
          actions: <Widget>[
            TextButton(
              child: Text("Fechar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
