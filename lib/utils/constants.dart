import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tetris/utils/colors.dart';

class Constants {
  static Color get randomColorBlock {
    List<Color> colors = [
      MyColors.BLOCK_COLOR_1,
      MyColors.BLOCK_COLOR_2,
      MyColors.BLOCK_COLOR_3,
      MyColors.BLOCK_COLOR_4,
      MyColors.BLOCK_COLOR_5
    ];

    return colors[Random().nextInt(colors.length - 1)];
  }
}
