import 'package:flutter/material.dart';

import '../models/tile_model.dart';
import '../themes/app_theme.dart';

class TileWidget extends StatelessWidget {
  final TileModel tile;

  const TileWidget({super.key, required this.tile});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width - 30.0) / 4,
      height: (MediaQuery.of(context).size.height / 2.3) / 4,
      decoration: boxDecorationForTile(tile.value),
      child: Center(
        child: Text(
          tile.value != 0 ? '${tile.value}' : '',
          style: tileStyle(tile.value),
        )
      )
    );
  }
}
