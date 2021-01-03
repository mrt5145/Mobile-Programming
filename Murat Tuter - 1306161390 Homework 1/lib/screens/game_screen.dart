import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hw1/models/box.dart';
import 'package:hw1/screens/home_screen.dart';
import 'package:hw1/widgets/game_grid.dart';

class GameScreen extends StatefulWidget {
  final name;
  final List<Box> items;
  GameScreen({this.name, this.items});
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  Timer _timer;
  double _start = 0.0;

  // I have utilized from stackoverflow for adding this timer logic.
  void startTimer() {
    const pointOneSec = const Duration(milliseconds: 100);
    _timer = new Timer.periodic(pointOneSec, (Timer timer) {
      setState(() {
        _start = _start + 0.1;
      });
    });
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    var welcome = Text(
      'HOŞGELDİN ${widget.name.toUpperCase()}',
      style: TextStyle(fontSize: 20, color: Colors.orange),
    );
    var my_timer = Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.all(8.0),
      child: Text(
        '${_start.toStringAsFixed(1)}',
        style: TextStyle(fontSize: 22, color: Colors.red),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Classic Light',
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        children: [
          my_timer,
          welcome,
          SizedBox(height: mq.height / 10),
          GameGrid(
            items: widget.items,
            time: _start,
          ),
          RaisedButton(
            color: Colors.orange,
            child: Text('Ana Ekrana Geri Dön'),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => HomeScreen(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
