import 'package:flutter/material.dart';
import 'package:tetris/app/layout/game/game_grid_layout.dart';
import 'package:tetris/app/layout/game/game_panel_layout.dart';
import 'package:tetris/utils/colors.dart';

class GameLayout extends StatelessWidget {
  final Widget grid;
  final Widget panel;
  const GameLayout({required this.panel, required this.grid, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.BACKGROUND,
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              const Expanded(
                flex: 10,
                child: Center(
                  child: Text(
                    "WORK IN PROGRESS...",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
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
