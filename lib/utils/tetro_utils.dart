import 'dart:math';

class TetroMatrix {
  List<List<int>> block = [
    [5, 6, 15, 16],
    [5, 6, 15, 16],
    [5, 6, 15, 16],
    [5, 6, 15, 16],
  ];

  List<List<int>> t_shaped = [
    [4, 5, 6, 15],
    [4, 14, 15, 24],
    [4, 13, 14, 15],
    [4, 13, 14, 24],
  ];

  List<List<int>> l_shaped = [
    [4, 14, 24, 25],
    [4, 5, 6, 14],
    [4, 5, 15, 25],
    [5, 13, 14, 15],
  ];

  List<List<int>> l_shaped_inverse = [
    [4, 14, 24, 23],
    [4, 14, 15, 16],
    [4, 5, 14, 24],
    [4, 5, 6, 16],
  ];

  List<List<int>> straigth = [
    [4, 14, 24, 34],
    [4, 5, 6, 7],
    [4, 14, 24, 34],
    [1, 2, 3, 4],
  ];

  List<List<int>> left_zigzag = [
    [4, 5, 15, 16],
    [4, 15, 14, 24],
    [3, 4, 14, 15],
    [5, 15, 14, 24],
  ];

  List<List<int>> right_zigzag = [
    [4, 5, 13, 14],
    [3, 13, 14, 24],
    [4, 5, 13, 14],
    [3, 13, 14, 24],
  ];

  List<List<int>> tetro() {
    List<List<List<int>>> list = [
      ...[block],
      ...[t_shaped],
      ...[l_shaped],
      ...[l_shaped_inverse],
      ...[straigth],
      ...[left_zigzag],
      ...[right_zigzag],
    ];
    List<List<int>> toReturn = list[Random().nextInt(list.length)];
    return toReturn.map((element) => element).toList();
  }
}
