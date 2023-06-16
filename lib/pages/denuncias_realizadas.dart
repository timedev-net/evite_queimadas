import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DenunciasRealizadas extends StatefulWidget {
  // const DenunciasRealizadas({super.key, required this.title});
  // final String title;

  // const DenunciasRealizadas({Key? key}) : super(key: key);

  @override
  _DenunciasRealizadasState createState() => _DenunciasRealizadasState();
}

class _DenunciasRealizadasState extends State<DenunciasRealizadas> {
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
          title: Text('Denúncias Realizadas', style: TextStyle(color: Colors.white)),
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
                      padding: EdgeInsets.all(10),
                      height: 90,
                      width: 340,
                      margin: EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(color: Colors.white60, borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        children: [Text('12/08/2022 - 14:27', style: TextStyle(fontWeight: FontWeight.bold)), Text('Lorem Ipsum has been the industrys standard dummy text ever since the 1500s')],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      height: 90,
                      width: 340,
                      margin: EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(color: Colors.white60, borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        children: [Text('12/08/2022 - 14:27', style: TextStyle(fontWeight: FontWeight.bold)), Text('Lorem Ipsum has been the industrys standard dummy text ever since the 1500s')],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      height: 90,
                      width: 340,
                      margin: EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(color: Colors.white60, borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        children: [Text('12/08/2022 - 14:27', style: TextStyle(fontWeight: FontWeight.bold)), Text('Lorem Ipsum has been the industrys standard dummy text ever since the 1500s')],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      height: 90,
                      width: 340,
                      margin: EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(color: Colors.white60, borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        children: [Text('12/08/2022 - 14:27', style: TextStyle(fontWeight: FontWeight.bold)), Text('Lorem Ipsum has been the industrys standard dummy text ever since the 1500s')],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      height: 90,
                      width: 340,
                      margin: EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(color: Colors.white60, borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        children: [Text('12/08/2022 - 14:27', style: TextStyle(fontWeight: FontWeight.bold)), Text('Lorem Ipsum has been the industrys standard dummy text ever since the 1500s')],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      height: 90,
                      width: 340,
                      margin: EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(color: Colors.white60, borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        children: [Text('12/08/2022 - 14:27', style: TextStyle(fontWeight: FontWeight.bold)), Text('Lorem Ipsum has been the industrys standard dummy text ever since the 1500s')],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      height: 90,
                      width: 340,
                      margin: EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(color: Colors.white60, borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        children: [Text('12/08/2022 - 14:27', style: TextStyle(fontWeight: FontWeight.bold)), Text('Lorem Ipsum has been the industrys standard dummy text ever since the 1500s')],
                      ),
                    ),

                    Image.asset('assets/images/logo.png', height: 70),
                    // Icon(Icons.star, color: Colors.green[500]),
                    // Text('$_counter', style: Theme.of(context).textTheme.headlineMedium),
                  ],
                ),
              )),
        ));
  }
}