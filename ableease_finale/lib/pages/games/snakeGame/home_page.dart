import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

import 'blank_pixel.dart';
import 'food_pixel.dart';
import 'snake_pixel.dart';

class SnakeGame extends StatefulWidget {
  const SnakeGame({Key? key}) : super(key: key);

  @override
  State<SnakeGame> createState() => _SnakeGameState();
}

enum Snake_Direction { UP, DOWN, LEFT, RIGHT }

class _SnakeGameState extends State<SnakeGame> {
  //grid dimesions
  int rowSize = 10;
  int totalNumebrOfSquares = 100;

  bool gameHasStarted = false;

  //user score
  int currentScore = 0;

  //snake position
  List<int> snakePos = [
    0,
    1,
    2,
  ];

  //snake direction initially
  var currentDirection = Snake_Direction.RIGHT;

  // food position
  int foodPos = 53;

  // start game
  void startGame() {
    gameHasStarted = false;
    Timer.periodic(Duration(milliseconds: 200), (timer) {
      setState(() {
        //keep the snake moving
        movesnake();

        // check if game is over
        if (gameOver()) {
          timer.cancel();

          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return AlertDialog(
                  title: Text('Game Over'),
                  content: Column(
                    children: [
                      Text('Your score is:' + currentScore.toString()),
                      TextField(
                        decoration: InputDecoration(hintText: 'Enter name'),
                      )
                    ],
                  ),
                  actions: [
                    MaterialButton(
                      onPressed: () {
                        submitScore();
                        Navigator.pop(context);
                        submitScore();
                        newGame();
                      },
                      child: Text('submit'),
                      color: Colors.pink,
                    )
                  ],
                );
              });
        }
      });
    });
  }

  void newGame() {
    setState(() {
      snakePos = [
        0,
        1,
        2,
      ];
      foodPos = 55;
      currentDirection = Snake_Direction.RIGHT;
      gameHasStarted = false;
      currentScore = 0;
    });
  }

  void submitScore() {}

  void eatFood() {
    currentScore++;
    // making sure new food is not where snake currently is
    while (snakePos.contains(foodPos)) {
      foodPos = Random().nextInt(totalNumebrOfSquares);
    }
  }

  void movesnake() {
    switch (currentDirection) {
      case Snake_Direction.RIGHT:
        {
          // add a head
          // if snake is at the right wall, re-adjust
          if (snakePos.last % rowSize == 9) {
            snakePos.add(snakePos.last + 1 - rowSize);
          } else {
            snakePos.add(snakePos.last + 1);
          }
        }

        break;

      case Snake_Direction.LEFT:
        {
          // add a head
          // if snake is at the right wall, re-adjust
          if (snakePos.last % rowSize == 0) {
            snakePos.add(snakePos.last - 1 + rowSize);
          } else {
            snakePos.add(snakePos.last - 1);
          }
        }

        break;

      case Snake_Direction.UP:
        {
          // add a head
          if (snakePos.last < rowSize) {
            snakePos.add(snakePos.last - rowSize + totalNumebrOfSquares);
          } else {
            snakePos.add(snakePos.last - rowSize);
          }
        }

        break;

      case Snake_Direction.DOWN:
        {
          // add a head
          if (snakePos.last + rowSize > totalNumebrOfSquares) {
            snakePos.add(snakePos.last + rowSize - totalNumebrOfSquares);
          } else {
            snakePos.add(snakePos.last + rowSize);
          }
        }

        break;
      default:
    }

    // snake is eating food
    if (snakePos.last == foodPos) {
      eatFood();
    } else {
      // remove tail
      snakePos.removeAt(0);
    }
  }

  // game over
  bool gameOver() {
    List<int> bodySnake = snakePos.sublist(0, snakePos.length - 1);

    if (bodySnake.contains(snakePos.last)) {
      return true;
    }
    return false;
  }

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
      backgroundColor: Colors.black,
      body: Column(children: [
        // high score
        Expanded(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //user score
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Current score'),
                Text(
                  currentScore.toString(),
                  style: TextStyle(fontSize: 36),
                ),
              ],
            ),
          ],
        )),

        // game grid
        Expanded(
            flex: 3,
            child: GestureDetector(
              onVerticalDragUpdate: (details) {
                if (details.delta.dy > 0 &&
                    currentDirection != Snake_Direction.UP) {
                  currentDirection = Snake_Direction.DOWN;
                } else if (details.delta.dy < 0 &&
                    currentDirection != Snake_Direction.DOWN) {
                  currentDirection = Snake_Direction.UP;
                }
              },
              onHorizontalDragUpdate: (details) {
                if (details.delta.dx > 0 &&
                    currentDirection != Snake_Direction.LEFT) {
                  currentDirection = Snake_Direction.RIGHT;
                } else if (details.delta.dx < 0 &&
                    currentDirection != Snake_Direction.RIGHT) {
                  currentDirection = Snake_Direction.LEFT;
                }
              },
              child: GridView.builder(
                  itemCount: totalNumebrOfSquares,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: rowSize),
                  itemBuilder: (count, index) {
                    if (snakePos.contains(index)) {
                      return const SnakePixel();
                    } else if (foodPos == index) {
                      return const FoodPixel();
                    } else {
                      return const BlankPixel();
                    }
                  }),
            )),

        //play button
        Expanded(
          child: Container(
            child: Center(
              child: MaterialButton(
                child: Text('PLAY'),
                color: gameHasStarted ? Colors.grey : Colors.pink,
                onPressed: gameHasStarted ? () {} : startGame,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
