part of 'tetris_bloc.dart';

@immutable
abstract class TetrisEvent {}

class TetrisMoveLeft extends TetrisEvent {}

class TetrisMoveRight extends TetrisEvent {}

class TetrisRotate extends TetrisEvent {}

class TetrisMovingDown extends TetrisEvent {}

class TetrisStop extends TetrisEvent {}

class TetrisGo extends TetrisEvent {}

class TetrisGameOver extends TetrisEvent {}