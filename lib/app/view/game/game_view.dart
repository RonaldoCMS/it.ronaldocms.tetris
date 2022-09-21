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
      grid: const GameGridView(),
      panel: GamePanelView(
        buttons: [
          ButtonPanel(
            option: OptionButton(
              onPressed: () => context.read<TetrisBloc>().add(TetrisMoveLeft()),
              widget: const Icon(Ionicons.chevron_back),
            ),
          ),
          ButtonPanel(
            option: OptionButton(
              onPressed: () => context.read<TetrisBloc>().add(TetrisRotate()),
              widget: const Icon(Ionicons.sync_outline),
            ),
          ),
          ButtonPanel(
            option: OptionButton(
              onPressed: () =>
                  context.read<TetrisBloc>().add(TetrisMoveRight()),
              widget: const Icon(Ionicons.chevron_forward),
            ),
          ),
        ],
      ),
    );
  }
}
