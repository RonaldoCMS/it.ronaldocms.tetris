import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tetris/app/view/game/game_view.dart';
import 'package:tetris/bloc/tetris_bloc.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TetrisBloc(),
      child: MaterialApp(
        title: 'Tetris Game',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const GameView(),
      ),
    );
  }
}
