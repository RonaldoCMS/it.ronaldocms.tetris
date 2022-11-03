import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:tetris/bloc/tetris_bloc.dart';
import 'package:tetris/controller/game_interface.dart';
import 'package:tetris/model/tetrominoes.dart';
import 'package:tetris/utils/colors.dart';
import 'package:tetris/utils/constants.dart';
import 'package:tetris/utils/tetro_utils.dart';

class Game implements GameInterface {
  Timer? _movingSubscription;
  Timer? _start;

  late TetroMinoes tetro;
  Map<int, Color> box = {};

  final int col;
  final int row;
  final Duration speed;
  final Duration speedTetro;
  int get COUNTER => col * row;

  int points = 0;

  Game({
    this.speedTetro = const Duration(milliseconds: 800),
    this.speed = const Duration(milliseconds: 1200),
    this.col = 10,
    this.row = 15,
  }) {
    _generateNewTetro();
    _clearBox();
  }

  TetroMinoes _generateNewTetro() => tetro = TetroMinoes(
        position: TetroMatrix().tetro(),
        color: Constants.randomColorBlock,
      );

  Timer _startTimerGame(void Function(TetrisEvent) add) =>
      Timer.periodic(speed, (timer) => _startGame(timer, add));

  void _startGame(Timer timer, void Function(TetrisEvent) add) {
    if (_movingSubscription != null && _movingSubscription!.isActive) {
      //: when game is finish
    } else {
      _generateNewTetro();
      _movingGrid();
      _movingSubscription = _startTetro(add);
      points += 10;
      add(TetrisMovingDown());
      print(points);
    }
  }

  void _movingGrid() {
    for (int i = 1; i <= row - 1; i++) {
      int counter = _setCounter(i);
      if (_isLineColored(counter)) {
        for (int k = (i + 1) * col; k > col; k--) {
          box[_setBox(k)] = box[_setBox(k - col)]!;
        }
        points += 100;
      }
    }
  }

  int _setBox(int k) => (k >= COUNTER) ? COUNTER - 1 : k;

  bool _isLineColored(int counter) => counter == col;

  int _setCounter(int i) {
    int value = i * col;
    int max = i * col + col;
    int counter = 0;
    while (value < max) {
      if (box[value] != MyColors.BLOCK_EMPTY) {
        counter++;
      }
      value++;
    }
    return counter;
  }

  _startTetro(void Function(TetrisEvent) movingDown) {
    return Timer.periodic(speedTetro, (timer) {
      for (int i = 0; i < tetro.attual.length; i++) {
        if (_isCollapsed(i)) {
          timer.cancel();
          _setColorBox();
          return;
        }
      }
      if (tetro.attual[0] > COUNTER - col) {
        timer.cancel();
      } else {
        moveDown();
        movingDown(TetrisMovingDown());
      }
    });
  }

  bool _isCollapsed(int i) =>
      box[tetro.attual[i] + col] != MyColors.BLOCK_EMPTY;

  void _setColorBox() {
    for (int j = 0; j < tetro.attual.length; j++) {
      box[tetro.attual[j]] = tetro.color;
    }
  }

  void _clearBox() {
    for (int i = 0; i < COUNTER; i++) {
      box[i] = MyColors.BLOCK_EMPTY;
    }
  }

  @override
  void changeLeft() {
    tetro.changeLeft();
  }

  @override
  void changeRight() {
    bool iCan = true;

    for (var element in tetro.attual) {
      log(element.toString());

      if (box[element - 1] != MyColors.BLOCK_EMPTY) {
        iCan = false;
        break;
      }
      if (box[element + 1] != MyColors.BLOCK_EMPTY) {
        iCan = false;
        break;
      }

      if (box[element + 1] != MyColors.BLOCK_EMPTY) {
        iCan = false;
        break;
      }

      if (element.toString().endsWith("9")) {
        iCan = false;
        break;
      }
    }
    if (iCan) tetro.changeRight();
  }

  @override
  void moveLeft() {
    bool iCan = true;

    for (var element in tetro.attual) {
      log(element.toString());
      if (box[element - 1] != MyColors.BLOCK_EMPTY) {
        iCan = false;
        break;
      }

      if (element % 10 == 0) {
        iCan = false;
        break;
      }
    }
    if (iCan) tetro.moveLeft();
  }

  @override
  void moveRight() {
    bool iCan = true;

    for (var element in tetro.attual) {
      log(element.toString());
      if (box[element + 1] != MyColors.BLOCK_EMPTY) {
        iCan = false;
        break;
      }

      if (element.toString().endsWith("9")) {
        iCan = false;
        break;
      }
    }
    if (iCan) tetro.moveRight();
  }

  @override
  void moveDown() => tetro.moveDown();

  @override
  void play(void Function(TetrisEvent) event) {
    _start = _startTimerGame(event);
  }

  @override
  void stop() {
    _start?.cancel();
    _movingSubscription?.cancel();
  }
}
