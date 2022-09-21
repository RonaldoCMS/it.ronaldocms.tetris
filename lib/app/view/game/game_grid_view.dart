import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tetris/app/layout/game/game_grid_layout.dart';
import 'package:tetris/bloc/tetris_bloc.dart';

class GameGridView extends StatelessWidget {
  const GameGridView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TetrisBloc, TetrisState>(
      builder: (context, state) {
        return GameGridLayout(
          content: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: state.COL,
            ),
            itemBuilder: (_, index) => grid(state, index),
            itemCount: state.box.length,
          ),
        );
      },
    );
  }

  Widget grid(TetrisState state, int index) {
    for (int i = 0; i < state.tetro.attual.length; i++) {
      int value = state.tetro.attual[i];
      if (value == index) {
        return block(index, state.tetro.color);
      }
    }
    return block(index, state.box[index]!);
  }

  Widget block(int value, Color color) {
    return Padding(
      padding: const EdgeInsets.all(0.6),
      child: Container(
        color: color,
        // child: Center(
        //   child: Text(
        //     value.toString(),
        //     style: const TextStyle(color: Colors.white),
        //   ),
        // ),
      ),
    );
  }
}
