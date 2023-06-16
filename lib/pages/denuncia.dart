import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Denuncia extends StatefulWidget {
  // const Denuncia({super.key, required this.title});
  // final String title;

  // const Denuncia({Key? key}) : super(key: key);

  @override
  _DenunciaState createState() => _DenunciaState();
}

class _DenunciaState extends State<Denuncia> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void getApi() async {
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
                        onPressed: () => {Navigator.pop(context, '/')},
                        child: Text("Inserir Foto", style: TextStyle(color: Colors.white))),
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: const InputDecoration(
                        filled: true,
                        labelText: 'Escreva mais informações',
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
                    // Icon(Icons.star, color: Colors.green[500]),
                    // Text('$_counter', style: Theme.of(context).textTheme.headlineMedium),
                  ],
                ),
              )),
        ));
  }
}
