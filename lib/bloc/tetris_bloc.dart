import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:tetris/controller/game.dart';
import 'package:tetris/model/tetrominoes.dart';
import 'package:tetris/utils/constants.dart';
import 'package:tetris/utils/tetro_utils.dart';

part 'tetris_event.dart';
part 'tetris_state.dart';

class TetrisBloc extends Bloc<TetrisEvent, TetrisState> {
  TetrisBloc()
      : super(TetrisInitState(
            box: {},
            tetro: TetroMinoes(
                position: TetroMatrix().tetro(),
                color: Constants.randomColorBlock))) {
    _onStart();
  }

  late Game game;

  void _onStart() {
    return on<TetrisEvent>((event, emit) {
      if (event is TetrisMoveLeft) {
        game.moveLeft();
        emit(TetrisGameState(box: game.box, tetro: game.tetro, points: game.points));
      } else if (event is TetrisMoveRight) {
        game.moveRight();
        emit(TetrisGameState(box: game.box, tetro: game.tetro, points: game.points));
      } else if (event is TetrisRotate) {
        game.changeRight();
        emit(TetrisGameState(box: game.box, tetro: game.tetro, points: game.points));
      } else if (event is TetrisMovingDown) {
        emit(TetrisGameState(box: game.box, tetro: game.tetro, points: game.points));
      } else if (event is TetrisGo) {
        game = Game(col: 10, row: 15);
        game.play(add);
        emit(TetrisInitState(box: game.box, tetro: game.tetro));
      } else {
        emit(TetrisEndState(box: game.box, tetro: game.tetro, points: game.points));
      }
    });
  }
}
