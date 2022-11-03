import 'package:flutter/material.dart';
import 'package:tetris/utils/colors.dart';

class HomeLayout extends StatelessWidget {
  final Widget image;
  final Widget button;
  const HomeLayout({required this.image, required this.button, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.BACKGROUND,
      body: Center(
        child: FractionallySizedBox(
          heightFactor: 0.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(flex: 80, child: image),
              Expanded(flex: 20, child: button),
            ],
          ),
        ),
      ),
    );
  }
}
