import 'package:hw1/models/box.dart';

class Boxes{
  static List<Box> _items = [];


  static List<Box> createShuffledItems() {
    _items.clear();
    for(int i = 1; i <= 25; i++) {
      _items.add(Box(number: i, isFound: false));
    }
    _shuffleItems();
    //return copy of items.
    return [..._items];
  }

  //private method
  static void _shuffleItems() {
    _items.shuffle();
  }

}