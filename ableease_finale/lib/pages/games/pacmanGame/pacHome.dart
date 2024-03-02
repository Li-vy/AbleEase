import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class PacmanHome extends StatefulWidget {
  const PacmanHome({super.key});

  @override
  State<PacmanHome> createState() => _PacmanHomeState();
}

class _PacmanHomeState extends State<PacmanHome> {
  static int numberInRow = 11;
  int numberOfSquares = numberInRow * 16;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        elevation: 0,
      ),
      backgroundColor: Colors.grey[800],
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: numberOfSquares,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: numberInRow),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
                        color: Colors.grey,
                      ),
                    );
                  }),
            ),
          ),
          Expanded(
              child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Score: ",
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
                Text(
                  "P L A Y",
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
