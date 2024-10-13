import 'package:flutter/material.dart';

import '../models/board_model.dart';
import '../utils/storage_service.dart';

class GameController extends ChangeNotifier{
  BoardModel boardModel;

  GameController() : boardModel = BoardModel() {
    loadScore();
    reloadGame();
  }

  get board => boardModel;

  void reloadGame() {
    boardModel.initBoard();
    boardModel.generateInitialTile();
    notifyListeners();
  }

  void moveUp() {
    boardModel.moveTilesUp();
    notifyListeners();
  }

  void moveDown() {
    boardModel.moveTilesDown();
    notifyListeners();
  }

  void moveRight() {
    boardModel.moveTilesRight();
    notifyListeners();
  }

  void moveLeft() {
    boardModel.moveTilesLeft();
    notifyListeners();
  }
}