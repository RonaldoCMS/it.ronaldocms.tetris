import 'package:flutter/material.dart';
import 'package:tetris/app/component/button_panel.dart';
import 'package:tetris/app/layout/game/game_panel_layout.dart';

class GamePanelView extends StatelessWidget {
  final List<ButtonPanel> buttons;

  const GamePanelView({
    required this.buttons,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GamePanelLayout(content: convertObjToWidget());
  }

  Row convertObjToWidget() => Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: buttons
            .map(
              (e) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: e,
                ),
              ),
            )
            .toList(),
      );
}
