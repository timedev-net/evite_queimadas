import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 300,
          child: Column(
            children: [
              Container(
                child: Image.asset('assets/images/logo.png'),
              ),
              const Text(
                style: TextStyle(fontSize: 24, color: Colors.white),
                'Evite Queimadas',
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.green[900],
    );
  }
}
