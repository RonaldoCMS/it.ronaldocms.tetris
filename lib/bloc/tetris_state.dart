part of 'tetris_bloc.dart';

abstract class TetrisState {
  final int COL = 10;
  Map<int, Color> box;
  late TetroMinoes tetro;
  int points;

  TetrisState({required this.box, required this.tetro, required this.points});
}

class TetrisInitState extends TetrisState {
  TetrisInitState({required super.box, required super.tetro, super.points = 0});
}

class TetrisGameState extends TetrisState {
  TetrisGameState({required super.box, required super.tetro, required super.points});
}

class TetrisEndState extends TetrisState {
  TetrisEndState({required super.box, required super.tetro, required super.points});
}
