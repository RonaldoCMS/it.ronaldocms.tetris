import 'package:flutter/material.dart';
import 'package:tetris/app/layout/home/home_layout.dart';
import 'package:tetris/app/view/game/game_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeLayout(
      image: const Padding(
        padding: EdgeInsets.all(8.0),
        child: FittedBox(
          child: FlutterLogo(),
        ),
      ),
      button: MaterialButton(
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const GameView(),
        )),
        child: const SizedBox.expand(
          child: FittedBox(
            child: Text(
              "PLAY",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
