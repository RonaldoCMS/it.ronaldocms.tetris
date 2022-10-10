import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:tetris/app/component/button_panel.dart';
import 'package:tetris/app/layout/game/game_layout.dart';
import 'package:tetris/app/view/game/game_grid_view.dart';
import 'package:tetris/app/view/game/game_panel_view.dart';
import 'package:tetris/bloc/tetris_bloc.dart';
import 'package:tetris/model/option_button.dart';

class GameView extends StatelessWidget {
  const GameView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<TetrisBloc>().add(TetrisGo());
    return GameLayout(
      grid: GestureDetector(
        onTapUp: (details) => onTap(context, details),
        onPanUpdate: (details) => onPanUpdate(context, details),
        child: const GameGridView(),
      ),
    );
  }

  void onPanUpdate(BuildContext context, DragUpdateDetails details) {
    if (details.delta.dx > 0) {
      context.read<TetrisBloc>().add(TetrisMoveRight());
    }

    if (details.delta.dx < 0) {
      context.read<TetrisBloc>().add(TetrisMoveLeft());
    }
  }

  void onTap(BuildContext context, TapUpDetails details) {
    var width = MediaQuery.of(context).size.width;
    var firstBlock = width / 3;
    var secondBlock = width / 2;
    var clickPosition = details.localPosition.dx;
    if (clickPosition > firstBlock && clickPosition < width - firstBlock) {
      context.read<TetrisBloc>().add(TetrisRotate());
    } else if (clickPosition < firstBlock) {
      context.read<TetrisBloc>().add(TetrisMoveLeft());
    } else {
      context.read<TetrisBloc>().add(TetrisMoveRight());
    }
  }
}
