import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  // const Home({super.key, required this.title});
  // final String title;

  // const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
        backgroundColor: Colors.green[200],
        appBar: AppBar(
          backgroundColor: Colors.green[900],
          title: Text("Evite Queimadas", style: TextStyle(color: Colors.white)),
        ),
        body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.only(top: 80),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/logo.png',
                      height: 100,
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                        style: TextButton.styleFrom(backgroundColor: Colors.green[900], fixedSize: Size(300, 30)),
                        onPressed: () => {Navigator.pushNamed(context, '/cadastro')},
                        child: Text("Faça sua Denúncia", style: TextStyle(color: Colors.white))),
                    const SizedBox(height: 16),
                    TextButton(
                        style: TextButton.styleFrom(backgroundColor: Colors.green[900], fixedSize: Size(300, 30)),
                        onPressed: () => {Navigator.pushNamed(context, '/cadastro')},
                        child: Text("Veja suas Denúncias", style: TextStyle(color: Colors.white))),
                    // Text('You have pushed the button this many times:'),
                    Container(
                      margin: EdgeInsets.only(top: 50),
                      padding: EdgeInsets.all(20),
                      height: 200,
                      width: 300,
                      decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(5)),
                      child: const Column(children: [
                        Text(
                          'A importânia da Denúncia',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: 16),
                        // Container(decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/logo.png')))),
                        Row(
                          children: [
                            Expanded(
                              child: Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. ', style: TextStyle(color: Colors.white, fontSize: 10)),
                            ),
                            // Image.asset('assets/images/logo.png'),
                            Icon(Icons.star),

                            // BoxDecoration(image: 'assets/images/logo.png'),
                            Icon(Icons.star),
                          ],
                        ),
                        SizedBox(height: 16),
                        Text(
                          "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.",
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ]),
                    )

                    // Text('$_counter', style: Theme.of(context).textTheme.headlineMedium),
                    // ElevatedButton(onPressed: () => {Navigator.pushNamed(context, '/cadastro')}, child: Text("cadastro")),
                  ],
                ),
              )),
        ));
  }
}
