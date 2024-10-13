import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_game_2048/game/game_controller.dart';
import 'package:flutter_game_2048/themes/app_theme.dart';
import 'package:flutter_game_2048/widgets/tile_widget.dart';
import 'package:flutter_swipe_detector/flutter_swipe_detector.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../models/tile_model.dart';

class BoardWidget extends StatelessWidget {
  const BoardWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<GameController>(builder: (context, controller, child) {
      var board = controller.board;
      return Stack(
        alignment: AlignmentDirectional.center,
        children: [
          SwipeDetector(
            onSwipeUp: (offset) {
              controller.moveUp();
            },
            onSwipeDown: (offset) {
              controller.moveDown();
            },
            onSwipeLeft: (offset) {
              controller.moveLeft();
            },
            onSwipeRight: (offset) {
              controller.moveRight();
            },
            child: Container(
                margin: const EdgeInsets.only(
                    top: 24, left: 15, right: 15, bottom: 20),
                padding: const EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.3,
                decoration: boxDecorationForBoard(),
                child: GridView.builder(
                  physics: const ScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: 16,
                  itemBuilder: (context, index) {
                    TileModel value = board.getTile(index ~/ 4, index % 4);
                    return TileWidget(tile: value,);
                  },
                )),
          ),
          if (board.getGameOver || board.getGameWon)
            BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      child: Text(
                        board.getFinalMessage,
                        style: GoogleFonts.josefinSans(
                            color: textColor,
                            fontSize: 42,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              const Shadow(
                                  offset: Offset(-1.5, -1.5),
                                  color: Colors.black),
                              const Shadow(
                                  offset: Offset(1.5, -1.5),
                                  color: Colors.black),
                              const Shadow(
                                  offset: Offset(1.5, 1.5),
                                  color: Colors.black),
                              const Shadow(
                                  offset: Offset(-1.5, 1.5),
                                  color: Colors.black),
                            ]),
                      ),
                      onPressed: () {
                        controller.reloadGame();
                      },
                    ),
                  ],
                ))
        ],
      );
    });
  }
}
