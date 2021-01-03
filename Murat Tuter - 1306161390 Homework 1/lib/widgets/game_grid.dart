import 'package:flutter/material.dart';
import 'package:hw1/screens/result_screen.dart';
import 'package:hw1/widgets/game_single_grid.dart';

class GameGrid extends StatefulWidget {
  final items;
  final time;
  GameGrid({this.items, this.time});

  @override
  _GameGridState createState() => _GameGridState();
}

class _GameGridState extends State<GameGrid> {
  int _current = 1;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(mq.width / 50),
      height: mq.height / 2.0,
      width: double.infinity,
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (ctx, index) {
          //tıklanabilmesi için
          return GestureDetector(
            onTap: () {
              setState(() {
                if(_current == widget.items[index].number){
                  // Eğer 23 ise oyunu bitirdin demek ve resultSCreen'e geçebilirsin.
                  if(_current == 25){
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (ctx)=> ResultScreen(timeResult: widget.time))
                    );
                  }
                  widget.items[index].found();
                  _current++;
                }
              });
            },
            child: SingleGrid(
              box: widget.items[index],
            ),
          );
        },
        itemCount: widget.items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
        ),
      ),
    );
  }
}
