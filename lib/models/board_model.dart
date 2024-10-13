import 'package:flutter_game_2048/models/tile_model.dart';
import 'dart:math';

import '../utils/storage_service.dart';


class BoardModel {
  List<List<TileModel>> _board = [];
  bool _gameOver = false;
  bool _gameWon = false;
  String _finalMessage = "";
  int _score = 0;
  int _finalScore = 0;
  void initBoard() async {
    _board = List.generate(4, (row) => List.generate(4, (col) => TileModel((row, col))));
    _gameOver = false;
    _gameWon = false;
    _finalMessage = "";
    _score = 0;
    _finalScore = await loadScore();
  }

  int get getScore => _score;
  set setScore(int score) {
    _score = score;
  }

  List<List<TileModel>> get getBoard => _board;

  bool get getGameOver => _gameOver;
  String get getFinalMessage => _finalMessage;
  bool get getGameWon => _gameWon;
  int get getFinalScore => _finalScore;

  TileModel getTile(int row, int col) => _board[row][col];

  void checkScore() {
    if (_score > _finalScore) {
      saveScore(_score);
    }
  }

  void generateInitialTile() {
    Random random = Random();
    int count = 0;
    while (count < 2) {
      int row = random.nextInt(4);
      int col = random.nextInt(4);
      if (_board[row][col].value == 0) {
        _board[row][col].value = 2;
        count++;
      }
    }
  }

  void generateRandomTile() {
    final emptyTiles = _board.expand((row) => row).where((tile) => tile.value == 0).toList();
    if (emptyTiles.isNotEmpty) {
      final randomTile = emptyTiles[Random().nextInt(emptyTiles.length)];
      if (Random().nextInt(101) <= 90) {
        randomTile.value = 2;
      } else {
        randomTile.value = 4;
      }
    }
  }

  void moveTilesUp() {
    var rotated = rotateMatrixAnti90(_board);
    for (int row = 0; row < 4; row++) {
      var rows = slide(rotated[row]);
      rows = combine(rows);
      rows = slide(rows);
      rotated[row] = rows;
    }
    var newMatrix = rotateMatrix90(rotated);
    generateRandomTile();
    checkWin(newMatrix);
    checkGameOver(newMatrix);
  }

  void moveTilesDown() {
    var rotated = rotateMatrix90(_board);
    for (int row = 0; row < 4; row++) {
      var rows = slide(rotated[row]);
      rows = combine(rows);
      rows = slide(rows);
      rotated[row] = rows;
    }
    var newMatrix = rotateMatrixAnti90(rotated);
    generateRandomTile();
    checkWin(newMatrix);
    checkGameOver(newMatrix);

  }

  void moveTilesRight() {
    var rotated = rotateMatrix180(_board);
    for (int row = 0; row < 4; row++) {
      var rows = slide(rotated[row]);
      rows = combine(rows);
      rows = slide(rows);
      rotated[row] = rows;
    }
    var newMatrix = rotateMatrix180(rotated);
    generateRandomTile();
    checkWin(newMatrix);
    checkGameOver(newMatrix);
  }

  void moveTilesLeft() {
    List<List<TileModel>> newMatrix = List.generate(4, (_) => List.filled(4, _board[0][0]));
    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 4; j++) {
        newMatrix[i][j] = _board[i][j];
      }
    }
    for (int row = 0; row < 4; row++) {
      var rows = slide(newMatrix[row]);
      rows = combine(rows);
      rows = slide(rows);
      newMatrix[row] = rows;
    }
    generateRandomTile();
    checkGameOver(newMatrix);
    checkWin(newMatrix);
  }

  void checkGameOver(List<List<TileModel>> newBoard) {
    for (var row in newBoard) {
      if (row.any((tile) => tile.value == 0)) {
        _board = newBoard;
        return;
      }
    }
    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 4; j++) {
        if (i < 3 && newBoard[i][j].value == newBoard[i + 1][j].value){
          _board = newBoard;
          return;
        }
        if (j < 3 && newBoard[i][j].value == newBoard[i][j + 1].value){
          _board = newBoard;
          return;
        }
      }
    }
    checkScore();
    _gameOver = true;
    _finalMessage = "GAME OVER :(";
  }

  void checkWin(List<List<TileModel>> newBoard) {
    for (var row in newBoard) {
      if (row.any((tile) => tile.value == 2048)) {
        checkScore();
        _gameWon = true;
        _finalMessage = "YOU WIN!";
        return;
      }
    }
  }


  List<TileModel> slide (List<TileModel> row) {
    List<TileModel> rows = [];
    List<TileModel> zeroRow = [];
    for (var tile in row) {
      if (tile.value != 0) {
        rows.add(tile);
      } else {
        zeroRow.add(tile);
      }
    }
    rows.addAll(zeroRow);
    return rows;
  }

  List<TileModel> combine (List<TileModel> row) {
    for (int i = 0; i < row.length - 1; i++) {
      if (row[i].value == row[i + 1].value && row[i].value != 0) {
        row[i].value *= 2;
        _score += row[i].value;
        row[i + 1].value = 0;
      }
    }
    return row;
  }

  List<List<TileModel>> rotateMatrix90(List<List<TileModel>> matrix) {
    List<List<TileModel>> rotatedMatrix = List.generate(4, (_) => List.filled(4, matrix[0][0]));
    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 4; j++) {
        rotatedMatrix[j][4 - i - 1] = matrix[i][j];
      }
    }
    return rotatedMatrix;
  }

  List<List<TileModel>> rotateMatrixAnti90(List<List<TileModel>> matrix) {
    List<List<TileModel>> rotatedMatrix = List.generate(4, (_) => List.filled(4, matrix[0][0]));
    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 4; j++) {
        rotatedMatrix[4 - j - 1][i] = matrix[i][j];
      }
    }
    return rotatedMatrix;
  }

  List<List<TileModel>> rotateMatrix180(List<List<TileModel>> matrix) {
    List<List<TileModel>> rotatedMatrix = List.generate(4, (_) => List.filled(4, matrix[0][0]));
    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 4; j++) {
        rotatedMatrix[4 - i - 1][4 - j - 1] = matrix[i][j];
      }
    }
    return rotatedMatrix;
  }
}
