import 'package:evite_queimadas/models/denuncia_model.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
// import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class DenunciasRealizadas extends StatefulWidget {
  // const DenunciasRealizadas({super.key, required this.title});
  // final String title;
  // const DenunciasRealizadas({Key? key}) : super(key: key);

  @override
  _DenunciasRealizadasState createState() => _DenunciasRealizadasState();
}

class _DenunciasRealizadasState extends State<DenunciasRealizadas> {
  // int _counter = 0;
  List<dynamic> denuncias = [];

  final url = Uri.parse("https://leoferrarezi.com/queimada/Complaint/read.php");

  void addList() async {
    Response res = await get(url);
    final json = jsonDecode(res.body) as List;
    print('&&&&&&&&&&&&&&&&&&&&&&&');

    json.forEach((e) {
      DenunciaModel denuncia = DenunciaModel(
        int.parse(e['id']),
        e['date'],
        e['time'],
        e['description'],
        e['img'],
      );
      denuncias.add(denuncia);
      print('eeeeeeeeeeeee');
    });

    print(Image.memory(base64Decode(denuncias[2].img)));
    setState(() {});
  }

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  // void getApi() async {
  //   var url = Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': '{http}'});
  //   var response = await http.get(url);

  //   if (response.statusCode == 200) {
  //     var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
  //     var itemCount = jsonResponse['totalItems'];
  //     print('Number of books about http: $itemCount.');
  //   } else {
  //     print('Request failed with status: ${response.statusCode}.');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green[300],
        appBar: AppBar(
          backgroundColor: Colors.green[800],
          centerTitle: true,
          title: Text('Denúncias Realizadas', style: TextStyle(color: Colors.white)),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            ElevatedButton(
              onPressed: addList,
              child: Text('add'),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // const SizedBox(height: 36),

                      for (dynamic el in denuncias)
                        Container(
                          padding: EdgeInsets.all(10),
                          height: 90,
                          width: 340,
                          margin: EdgeInsets.only(bottom: 16),
                          decoration: BoxDecoration(color: Colors.white60, borderRadius: BorderRadius.circular(5)),
                          child: Column(
                            children: [
                              Text('${el.date} - ${el.time}', style: TextStyle(fontWeight: FontWeight.bold)),
                              Text(el.description),
                            ],
                          ),
                        ),

                      // Icon(Icons.star, color: Colors.green[500]),
                      // Text('$_counter', style: Theme.of(context).textTheme.headlineMedium),
                    ],
                  ),
                ),
              ),
            ),
            Image.asset('assets/images/logo.png', height: 70),
            // Image.memory(base64Decode(denuncias[3].img)),
          ],
        ));
  }
}
