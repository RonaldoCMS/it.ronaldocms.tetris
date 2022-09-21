import 'package:flutter/material.dart';

class OptionButton {
  final Function() onPressed;
  final Widget widget;

  OptionButton({
    required this.onPressed,
    required this.widget,
  });
}
