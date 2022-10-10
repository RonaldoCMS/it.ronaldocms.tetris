import 'package:flutter/material.dart';
import 'package:tetris/app/layout/game/game_grid_layout.dart';
import 'package:tetris/app/layout/game/game_panel_layout.dart';
import 'package:tetris/utils/colors.dart';

class GameLayout extends StatelessWidget {
  final Widget grid;
  const GameLayout({required this.grid, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.BACKGROUND,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
              Expanded(flex: 90, child: GameGridLayout(content: grid)),
            ],
          ),
        ),
      ),
    );
  }
}
