import 'package:flutter/material.dart';

import '../models/board_model.dart';

class GameController extends ChangeNotifier{
  BoardModel boardModel;

  GameController() : boardModel = BoardModel(){
    boardModel.initBoard();
    boardModel.generateInitialTile();
    notifyListeners();
  }

  get board => boardModel;
}