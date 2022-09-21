import 'package:tetris/bloc/tetris_bloc.dart';

abstract class GameInterface {
  void moveLeft();
  void moveRight();
  void changeLeft();
  void changeRight();
  void moveDown();
  void play(void Function(TetrisEvent) event);
  void stop();
}
