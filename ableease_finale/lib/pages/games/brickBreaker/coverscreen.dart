import 'package:flutter/material.dart';

class CoverScreen extends StatelessWidget {
  final bool gameHasStarted;

  CoverScreen({required this.gameHasStarted});

  @override
  Widget build(BuildContext context) {
    return gameHasStarted
        ? Container()
        : Container(
            alignment: Alignment(0, -0.2),
            child: Text(
              "TAP TO PLAY",
              style: TextStyle(color: Colors.deepPurple[400]),
            ),
          );
  }
}
