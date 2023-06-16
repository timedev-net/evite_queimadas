import 'package:evite_queimadas/pages/cadastro.dart';
import 'package:evite_queimadas/pages/login.dart';
import 'package:evite_queimadas/pages/home.dart';
import 'package:evite_queimadas/pages/splash.dart';
// import 'package:evite_queimadas/pages/add_item.dart';
// import 'package:evite_queimadas/pages/list_items.dart';
import 'package:evite_queimadas/pages/denuncias_realizadas.dart';
import 'package:evite_queimadas/pages/detalhes_denuncia.dart';
import 'package:evite_queimadas/pages/meio_ambiente.dart';
import 'package:evite_queimadas/pages/denuncia.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Evite Queimadas',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.green,
          ),
          useMaterial3: true,
        ),
        home: Login(),
        routes: <String, WidgetBuilder>{
          '/login': (BuildContext context) => Login(),
          '/cadastro': (BuildContext context) => Cadastro(),
          '/home': (BuildContext context) => Home(),
          '/denuncia': (BuildContext context) => Denuncia(),
          '/denuncias_realizadas': (BuildContext context) => DenunciasRealizadas(),
          '/detalhes_denuncia': (BuildContext context) => DetalhesDenuncia(),
          '/meio_ambiente': (BuildContext context) => MeioAmbiente(),
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
