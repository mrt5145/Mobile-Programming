import 'package:flutter/material.dart';
import 'package:hw1/screens/home_screen.dart';

class ResultScreen extends StatelessWidget {
  final timeResult;
  ResultScreen({this.timeResult});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Text('Tebrikler',
                  style: TextStyle(fontSize: 32, color: Colors.green))),
          SizedBox(
            height: 20,
          ),
          Center(
              child: Text('Tamamlama süreniz: ${timeResult.toStringAsFixed(1)}',
                  style: TextStyle(fontSize: 20, color: Colors.red))),
          SizedBox(
            height: 20,
          ),
          RaisedButton(
            child: Text('Ana ekrana dön'),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx) => HomeScreen()));
            },
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}
