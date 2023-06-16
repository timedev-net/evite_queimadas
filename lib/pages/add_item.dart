import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AddItem extends StatefulWidget {
  const AddItem({super.key});
  final String title = 'teste';

  // const AddItem({Key? key}) : super(key: key);

  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  int _counter = 0;
  List<Map> _array = [];

  void _add_item_array() {
    setState(() {
      _array = [
        {"teste": "teste"}
      ];
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
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('Adiciona Item'),
        ),
        body: Container(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('You have pushed the button this many times:'),
              Icon(Icons.star, color: Colors.green[500]),
              Text('$_counter', style: Theme.of(context).textTheme.headlineMedium),
            ],
          ),
        )));
  }
}
