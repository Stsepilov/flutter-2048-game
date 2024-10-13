import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../game/game_controller.dart';
import '../themes/app_theme.dart';

class ScoreWidget extends StatelessWidget {
  const ScoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GameController>(
      builder: (context, controller, child) {
        var board = controller.board;
        return Container(
            width: 190,
            height: 70,
            decoration: boxDecorationForScore(),
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('SCORE', style: Theme.of(context).textTheme.headlineSmall,),
                    Text(board.getScore.toString(), style: scoreStyle()),
                  ]
              ),
            )
        );
      }
    );
  }
}