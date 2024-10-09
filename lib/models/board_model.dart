import 'package:flutter_game_2048/models/tile_model.dart';
import 'dart:math';


class BoardModel {
  List<List<TileModel>> _board = [];
  void initBoard() {
    _board = List.generate(4, (row) => List.generate(4, (col) => TileModel((row, col))));
  }

  List<List<TileModel>> get getBoard => _board;

  TileModel getTile(int row, int col) => _board[row][col];

  void generateInitialTile() {
    Random random = Random();
    for (int i = 0; i < 2; i++) {
      int row = random.nextInt(4);
      int col = random.nextInt(4);
      if (random.nextInt(101) <= 90) {
        _board[row][col].value = 2;
      } else {
        _board[row][col].value = 4;
      }
    }
  }
}
