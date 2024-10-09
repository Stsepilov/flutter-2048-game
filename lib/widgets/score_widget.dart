import 'package:flutter/material.dart';

import '../themes/app_theme.dart';

class ScoreWidget extends StatelessWidget {
  const ScoreWidget({super.key});

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
            Text('SCORE', style: Theme.of(context).textTheme.headlineSmall,),
            Text('2048', style: scoreStyle()),
          ]
        ),
      )
    );
  }
}