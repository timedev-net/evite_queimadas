import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailField = TextEditingController();
  final TextEditingController senhaField = TextEditingController();

  void login() {
    if (emailField.text == "admin" && senhaField.text == "admin") {
      emailField.clear();
      senhaField.clear();
      Navigator.popAndPushNamed(context, '/home');
    }
    Navigator.popAndPushNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green[300],
        body: Container(
            margin: const EdgeInsets.only(left: 30, right: 30),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset('assets/images/logo.png'),
                  // TextField(),
                  const SizedBox(height: 10),
                  const Text(
                    'Login',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: emailField,
                    decoration: const InputDecoration(
                      filled: true,
                      labelText: 'E-mail',
                      hintText: 'exemplo@mail.com',
                      errorText: null,
                      border: UnderlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: senhaField,
                    obscureText: true,
                    decoration: const InputDecoration(
                      filled: true,
                      labelText: 'Senha',
                      errorText: null,
                      border: UnderlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: login,
                    child: const Text('Entrar'),
                  ),
                  ElevatedButton(
                    onPressed: () => {},
                    child: const Text('Denúncia Anônima'),
                  ),

                  // Icon(Icons.star, color: Colors.green[500]),
                ],
              ),
            )));
  }
}
