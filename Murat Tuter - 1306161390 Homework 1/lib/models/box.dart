class Box{
  final int number;
  bool isFound;

  Box({this.number, this.isFound});

  void found() {
    isFound = true;
  }
}