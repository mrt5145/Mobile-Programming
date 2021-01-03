import 'package:flutter/material.dart';

class SingleGrid extends StatelessWidget {
  final box;
  SingleGrid({this.box});

  @override
  Widget build(BuildContext context) {
    return box.isFound ? Text('') : Container(
      margin: EdgeInsets.all(2.0),
      child: Center(
        child: Text('${box.number}'),
      ),
      color: Colors.green,
    );
  }
}
