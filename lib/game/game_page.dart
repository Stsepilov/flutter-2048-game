import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/board_widget.dart';
import '../widgets/high_score_widget.dart';
import '../widgets/score_widget.dart';
import 'game_controller.dart';


class GamePage extends StatelessWidget {
  GamePage({super.key});
  final GameController controller = GameController();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => controller,
      child: Scaffold(
          appBar: AppBar(
            title: Text("2048"),
            actions: [
              IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () {},
              )
            ],
            leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {},
            ),
          ),
          body: const SafeArea(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: 32),
                    ScoreWidget(),
                    BoardWidget(),
                    HighScoreWidget(),
                  ],
                ),
              )
          )
      )
    );
  }
}
