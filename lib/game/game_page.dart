import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/board_widget.dart';
import '../widgets/high_score_widget.dart';
import '../widgets/restart_widget.dart';
import '../widgets/score_widget.dart';
import 'game_controller.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<GameController>(create: (_) => GameController()),
        ],
        child: Scaffold(
            appBar: AppBar(
              title: const Text("2048"),
              actions: [
                restartGame(),
              ],
              leading: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {},
              ),
            ),
            body: const SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 32),
                  ScoreWidget(),
                  BoardWidget(),
                  HighScoreWidget(),
                ],
              ),
            )));
  }
}
