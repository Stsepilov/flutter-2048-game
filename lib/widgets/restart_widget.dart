import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../game/game_controller.dart';
import '../utils/storage_service.dart';

Consumer<GameController> restartGame() {
  return Consumer<GameController>(
    builder: (context, controller, child) {
      return IconButton(
        icon: Icon(Icons.refresh),
        onPressed: () {
          controller.board.checkScore();
          controller.reloadGame();
        },
      );
    }
  );
}