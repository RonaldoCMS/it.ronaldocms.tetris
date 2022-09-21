import 'package:flutter/material.dart';
import 'package:tetris/model/option_button.dart';
import 'package:tetris/utils/colors.dart';

class ButtonPanel extends StatelessWidget {
  final OptionButton option;
  const ButtonPanel({required this.option, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: MyColors.BLOCK_EMPTY,
      ),
      onPressed: option.onPressed,
      child: FittedBox(child: option.widget),
    );
  }
}
