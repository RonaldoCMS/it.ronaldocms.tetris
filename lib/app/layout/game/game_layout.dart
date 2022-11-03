import 'package:flutter/material.dart';
import 'package:tetris/app/layout/game/game_grid_layout.dart';
import 'package:tetris/app/layout/game/game_panel_layout.dart';
import 'package:tetris/utils/colors.dart';

class GameLayout extends StatelessWidget {
  final Widget grid;
  final Widget panel;
  final int points;
  const GameLayout({required this.points, required this.panel, required this.grid, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.BACKGROUND,
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Expanded(
                  flex: 10,
                  child: Padding(
                    padding: const  EdgeInsets.all(8.0),
                    child: FittedBox(
                      child: Text(
                        "$points points",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  )),
              Expanded(flex: 85, child: GameGridLayout(content: grid)),
              Expanded(
                flex: 10,
                child: GamePanelLayout(content: panel),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
