import 'package:flutter/material.dart';

import '../themes/app_theme.dart';

class HighScoreWidget extends StatelessWidget {
  const HighScoreWidget ({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 190,
        height: 70,
        decoration: boxDecorationForScore(),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('HIGH SCORE', style: Theme.of(context).textTheme.headlineSmall,),
                Text('8848', style: scoreStyle()),
              ]
          ),
        )
    );
  }
}
