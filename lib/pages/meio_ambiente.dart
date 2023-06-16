import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MeioAmbiente extends StatefulWidget {
  // const MeioAmbiente({super.key, required this.title});
  // final String title;

  // const MeioAmbiente({Key? key}) : super(key: key);

  @override
  _MeioAmbienteState createState() => _MeioAmbienteState();
}

class _MeioAmbienteState extends State<MeioAmbiente> {
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
          title: Text('Meio Ambiente', style: TextStyle(color: Colors.white)),
        ),
        body: SingleChildScrollView(
          child: Container(
              margin: const EdgeInsets.only(left: 30, right: 30),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 20),
                    Text('Preserve o Meio Ambiente!', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white)),
                    const SizedBox(height: 20),
                    Image.asset('assets/images/logo.png', height: 100),
                    const SizedBox(height: 20),

                    Container(
                      padding: EdgeInsets.all(10),
                      width: 340,
                      margin: EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(color: Colors.green[700], borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        children: [
                          Text('Algum Título', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16)),
                          const SizedBox(height: 10),
                          Text(
                            """Lorem Ipsum has been the industrys standard dummy text ever since the 1500s Lorem
                              Ipsum has been the industrys standard dummy text ever since the 1500s Lorem Ipsum has
                              been the industrys standard dummy text ever since the 1500sLorem Ipsum has been the industrys
                              standard dummy text ever since the 1500sLorem Ipsum has been the industrys standard dummy text
                              ever since the 1500sLorem Ipsum has been the industrys standard dummy text ever since the 1500s
                              Lorem Ipsum has been the industrys standard dummy text ever since the 1500sLorem Ipsum has been
                              the industrys standard dummy text ever since the 1500s""",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),

                    // Icon(Icons.star, color: Colors.green[500]),
                    // Text('$_counter', style: Theme.of(context).textTheme.headlineMedium),
                  ],
                ),
              )),
        ));
  }
}
