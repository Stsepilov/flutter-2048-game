import 'package:flutter/material.dart';
import 'package:flutter_game_2048/game/game_controller.dart';
import 'package:flutter_game_2048/models/board_model.dart';
import 'package:flutter_game_2048/themes/app_theme.dart';
import 'package:flutter_game_2048/widgets/tile_widget.dart';
import 'package:provider/provider.dart';

import '../models/tile_model.dart';

class BoardWidget extends StatefulWidget {
  const BoardWidget({super.key});

  @override
  State<BoardWidget> createState() => _BoardWidgetState();
}


class _BoardWidgetState extends State<BoardWidget> {
  @override
  Widget build(BuildContext context) {
    String swipeDirection = '';
    Offset _startPosition = Offset(0, 0);

    return Consumer<GameController>(
      builder: (context, controller, child) {
        final board = controller.board;
        return GestureDetector(
          onPanStart: (details) {
            _startPosition = details.globalPosition;
          },
          onPanEnd: (details) {
            setState(() {
              swipeDirection = '';
            });
          },
          onPanUpdate: (details) {
            final deltaX = details.globalPosition.dx - _startPosition.dx;
            final deltaY = details.globalPosition.dy - _startPosition.dy;

            if (deltaX.abs() > deltaY.abs()) {
              if (deltaX > 10) {
                setState(() {
                  swipeDirection = 'Swipe Right';
                });
              } else if (deltaX < -10) {
                setState(() {
                  swipeDirection = 'Swipe Left';
                });
              }
            } else {

              if (deltaY > 10) {
                setState(() {
                  swipeDirection = 'Swipe Down';
                });
              } else if (deltaY < -10) {
                setState(() {
                  swipeDirection = 'Swipe Up';
                });
              }
            }
          },
          child:
          Container(
              margin: const EdgeInsets.only(top: 24, left: 15, right: 15, bottom: 20),
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.3,
              decoration: boxDecorationForBoard(),
              child: GridView.builder(
                physics: ScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: 16,
                itemBuilder: (context, index) {
                  final value = board.getTile(index ~/ 4, index % 4);
                  return TileWidget(tile: value);
                },
              )
          ),
        );
      }
    );
  }
}
