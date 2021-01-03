import 'package:flutter/material.dart';
import 'package:hw1/models/box.dart';
import 'package:hw1/models/boxes.dart';
import 'package:hw1/screens/game_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String name = '';

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    var heading = Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset('assets/images/iuc.png'),
    );
    var getName = Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Adınızı giriniz'),
          Container(
            width: mq.width / 1.7,
            child: TextField(
              onChanged: (val) {
                name = val;
                if (name == '') name = 'Adsız';
              },
            ),
          ),
        ],
      ),
    );


    return Scaffold(
      appBar: AppBar(
        title: Text('İstanbul Üniversitesi-Cerrahpaşa'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            heading,
            getName,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RaisedButton(
                    child: Text('Oyuna Başla'),
                    onPressed: () {
                      List<Box> myItems = [];
                      myItems = Boxes.createShuffledItems();
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (ctx) => GameScreen(
                            name: name,
                            items: myItems,
                          ),
                        ),
                      );
                    },
                    color: Colors.green,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
