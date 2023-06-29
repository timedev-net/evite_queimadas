import 'package:evite_queimadas/store/global.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mobx/mobx.dart';

class Denuncia extends StatefulWidget {
  @override
  _DenunciaState createState() => _DenunciaState();
}

class _DenunciaState extends State<Denuncia> {
  Global global = new Global();

  void handleCadastrar() async {
    var url = Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': '{http}'});
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      var itemCount = jsonResponse['totalItems'];
      print('Number of books about http: $itemCount.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green[300],
        appBar: AppBar(
          backgroundColor: Colors.green[800],
          centerTitle: true,
          title: Text('Denúncia', style: TextStyle(color: Colors.white)),
        ),
        body: SingleChildScrollView(
          child: Container(
              margin: const EdgeInsets.only(left: 30, right: 30),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 36),
                    Container(
                      padding: EdgeInsets.all(20),
                      height: 250,
                      width: 300,
                      decoration: BoxDecoration(color: Colors.white60, borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/logo.png', height: 100),
                              Image.asset('assets/images/logo.png', height: 100),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/logo.png', height: 100),
                              Image.asset('assets/images/logo.png', height: 100),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                        style: TextButton.styleFrom(backgroundColor: Colors.green[900], fixedSize: Size(300, 30)),
                        onPressed: () => {Navigator.pushNamed(context, '/my_camera')},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.camera_alt, color: Color(0xffffffff)),
                            const SizedBox(width: 10),
                            Text("Adicionar Foto", style: TextStyle(color: Colors.white)),
                          ],
                        )),
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: const InputDecoration(
                        filled: true,
                        labelText: 'Descrição da Denúncia',
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 32),
                    TextButton(
                        style: TextButton.styleFrom(backgroundColor: Colors.green[900], fixedSize: Size(300, 30)),
                        onPressed: () => {Navigator.pop(context, '/')},
                        child: Text("Enviar Denúncia", style: TextStyle(color: Colors.white))),
                    const SizedBox(height: 20),
                    Image.asset('assets/images/logo.png', height: 70),
                  ],
                ),
              )),
        ));
  }
}
