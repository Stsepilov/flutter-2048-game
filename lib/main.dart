import 'package:flutter/material.dart';
import 'package:flutter_game_2048/themes/app_theme.dart';

import 'game/game_page.dart';



void main() {
  runApp(const Game2048());
}

class Game2048 extends StatelessWidget {
  const Game2048({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      home: GamePage(),
    );
  }
}
