import 'package:flutter/material.dart';

class GamePanelLayout extends StatelessWidget {
  final Widget content;
  const GamePanelLayout({required this.content, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: content,
    );
  }
}
