import 'package:flutter/cupertino.dart';

class TetroMinoes {
  List<List<int>> position;
  Color color;
  int index = 0;

  List<int> get attual => position[index];
  set setIndex(int i) => index = i;

  TetroMinoes({required this.position, required this.color});

  void moveDown() {
    cycle((int i, int j) => position[i][j] += 10);
  }

  void moveLeft() {
    cycle((int i, int j) {
      if (position[i][j] % 10 != 0) {
        position[i][j] -= 1;
      }
    });
  }

  void moveRight() {
    cycle((int i, int j) {
      if (!position[i][j].toString().endsWith("9")) {
        position[i][j] += 1;
      }
    });
  }

  void changeLeft() {
    index++;
    if (position.length - 1 < index) setIndex = 0;
  }

  void changeRight() {
    index--;
    if (index < 0) setIndex = position.length - 1;
  }

  void cycle(Function(int, int) event) {
    for (int i = 0; i < position.length; i++) {
      for (int j = 0; j < position.length; j++) {
        event(i, j);
      }
    }
  }
}
