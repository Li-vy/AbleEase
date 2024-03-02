import 'dart:async';
import 'dart:math';

import 'package:ableeasefinale/pages/games/brickBreaker/ball.dart';
import 'package:ableeasefinale/pages/games/brickBreaker/brick.dart';
import 'package:ableeasefinale/pages/games/brickBreaker/coverscreen.dart';
import 'package:ableeasefinale/pages/games/brickBreaker/gameOverScreen.dart';
import 'package:ableeasefinale/pages/games/brickBreaker/player.dart';
import 'package:flutter/material.dart';

class BrickHome extends StatefulWidget {
  const BrickHome({super.key});

  @override
  State<BrickHome> createState() => _BrickHomeState();
}

enum direction { UP, DOWN, LEFT, RIGHT }

class _BrickHomeState extends State<BrickHome> {
  int score = 0;
  double ballX = 0;
  double ballY = 0;
  double ballXIncrements = Random().nextDouble() * 0.03;
  double ballYIncrements = 0.005;
  var ballYDirection = direction.DOWN;
  var ballXDirection = direction.RIGHT;

  double playerX = -0.2;
  double playerWidth = 0.4;

  static double firstBrickX = -1 + wallGap;
  static double firstBrickY = -0.8;
  static double brickWidth = 0.4;
  static double brickHeight = 0.05;
  static double brickGap = 0.01;
  static int numberOfBricksInRow = 4;
  static double wallGap = 0.5 *
      (2 -
          numberOfBricksInRow * brickWidth -
          (numberOfBricksInRow - 1) * brickGap);

  List MyBricks = [
    [firstBrickX + 0 * (brickWidth + brickGap), firstBrickY, false],
    [firstBrickX + 1 * (brickWidth + brickGap), firstBrickY, false],
    [firstBrickX + 2 * (brickWidth + brickGap), firstBrickY, false],
    [firstBrickX + 3 * (brickWidth + brickGap), firstBrickY, false],

    // Second row of bricks
    [
      firstBrickX + 0 * (brickWidth + brickGap),
      firstBrickY + brickHeight + brickGap,
      false
    ],
    [
      firstBrickX + 1 * (brickWidth + brickGap),
      firstBrickY + brickHeight + brickGap,
      false
    ],
    [
      firstBrickX + 2 * (brickWidth + brickGap),
      firstBrickY + brickHeight + brickGap,
      false
    ],
    [
      firstBrickX + 3 * (brickWidth + brickGap),
      firstBrickY + brickHeight + brickGap,
      false
    ],
  ];

  bool gameHasStarted = false;
  bool isGameOver = false;
  // bool brickBroken = false;

  void startGame() {
    gameHasStarted = true;
    Timer.periodic(Duration(milliseconds: 10), (timer) {
      updateDirection();

      moveBall();

      if (isPlayerDied()) {
        timer.cancel();
        isGameOver = true;
      }

      checkForBrokenBricks();
    });
  }

  void checkForBrokenBricks() {
    for (int i = 0; i < MyBricks.length; i++) {
      if (ballX >= MyBricks[i][0] &&
          ballX <= MyBricks[i][0] + brickWidth &&
          ballY <= MyBricks[i][1] + brickHeight &&
          MyBricks[i][2] == false) {
        setState(() {
          MyBricks[i][2] = true;
          score++;

          double leftSideDist = (MyBricks[i][0] - ballX).abs();
          double rightSideDist = (MyBricks[i][0] + brickWidth - ballX).abs();
          double topSideDist = (MyBricks[i][1] - ballY).abs();
          double bottomSideDist = (MyBricks[i][1] + brickHeight - ballY).abs();

          String min =
              findMin(leftSideDist, rightSideDist, topSideDist, bottomSideDist);

          switch (min) {
            case 'left':
              ballXDirection = direction.LEFT;
              break;
            case 'right':
              ballXDirection = direction.RIGHT;
              break;
            case 'up':
              ballYDirection = direction.UP;
              break;
            case 'bottom':
              ballYDirection = direction.DOWN;
              break;
          }
        });
      }
    }
  }

  // returns the smallest side
  String findMin(double a, double b, double c, double d) {
    List<double> myList = [
      a,
      b,
      c,
      d,
    ];

    double currentMin = a;
    for (int i = 0; i < myList.length; i++) {
      if (myList[i] < currentMin) {
        currentMin = myList[i];
      }
    }
    if ((currentMin - a).abs() < 0.01) {
      return 'left';
    } else if ((currentMin - b).abs() < 0.01) {
      return 'right';
    } else if ((currentMin - c).abs() < 0.01) {
      return 'top';
    } else if ((currentMin - d).abs() < 0.01) {
      return 'bottom';
    }
    return ' ';
  }

  bool isPlayerDied() {
    if (ballY >= 0.9) {
      return true;
    }

    return false;
  }

  void updateDirection() {
    setState(() {
      if (ballY >= 0.8 && ballX >= playerX && ballX <= playerX + playerWidth) {
        ballYDirection = direction.UP;
      } else if (ballY <= -0.9) {
        ballYDirection = direction.DOWN;
      }
      if (ballX >= 1) {
        ballXDirection = direction.LEFT;
      } else if (ballX <= -1) {
        ballXDirection = direction.RIGHT;
      }
    });
  }

  void moveBall() {
    setState(() {
      if (ballXDirection == direction.LEFT) {
        ballX -= ballXIncrements;
      } else if (ballXDirection == direction.RIGHT) {
        ballX += ballXIncrements;
      }

      if (ballYDirection == direction.DOWN) {
        ballY += ballYIncrements;
      } else if (ballYDirection == direction.UP) {
        ballY -= ballYIncrements;
      }
    });
  }

  void moveLeft() {
    setState(() {
      if (!(playerX - 0.2 < -1)) {
        playerX -= 0.2;
      }
    });
  }

  void moveRight() {
    setState(() {
      if (!(playerX + playerWidth > 1)) {
        playerX += 0.2;
      }
    });
  }

  // reset game back to initial values when user hits play again
  void resetGame() {
    setState(() {
      playerX = -0.2;
      ballX = 0;
      ballY = 0;
      isGameOver = false;
      gameHasStarted = false;
      MyBricks = [
        // [x, y, broken = true/false]
        [firstBrickX + 0 * (brickWidth + brickGap), firstBrickY, false],
        [firstBrickX + 1 * (brickWidth + brickGap), firstBrickY, false],
        [firstBrickX + 2 * (brickWidth + brickGap), firstBrickY, false],
        [firstBrickX + 3 * (brickWidth + brickGap), firstBrickY, false],

        [
          firstBrickX + 0 * (brickWidth + brickGap),
          firstBrickY + brickHeight + brickGap,
          false
        ],
        [
          firstBrickX + 1 * (brickWidth + brickGap),
          firstBrickY + brickHeight + brickGap,
          false
        ],
        [
          firstBrickX + 2 * (brickWidth + brickGap),
          firstBrickY + brickHeight + brickGap,
          false
        ],
        [
          firstBrickX + 3 * (brickWidth + brickGap),
          firstBrickY + brickHeight + brickGap,
          false
        ],
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        startGame();
      },
      child: Scaffold(
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
        backgroundColor: Colors.deepPurple[100],
        body: Center(
          child: Stack(
            children: [
              //Tap to Play
              CoverScreen(gameHasStarted: gameHasStarted),

              //End Screen
              GameOverScreen(
                  isGameOver: isGameOver, function: resetGame, score: score),

              //Ball Code
              MyBall(
                ballX: ballX,
                ballY: ballY,
              ),

              //Player Code
              MyPlayer(
                playerX: playerX,
                playerWidth: playerWidth,
              ),

              MyBrick(
                brickHeight: brickHeight,
                brickWidth: brickWidth,
                brickX: MyBricks[0][0],
                brickY: MyBricks[0][1],
                brickBroken: MyBricks[0][2],
              ),
              MyBrick(
                brickHeight: brickHeight,
                brickWidth: brickWidth,
                brickX: MyBricks[1][0],
                brickY: MyBricks[1][1],
                brickBroken: MyBricks[1][2],
              ),
              MyBrick(
                brickHeight: brickHeight,
                brickWidth: brickWidth,
                brickX: MyBricks[2][0],
                brickY: MyBricks[2][1],
                brickBroken: MyBricks[2][2],
              ),
              MyBrick(
                brickHeight: brickHeight,
                brickWidth: brickWidth,
                brickX: MyBricks[3][0],
                brickY: MyBricks[3][1],
                brickBroken: MyBricks[3][2],
              ),

              // 2nd Row

              MyBrick(
                brickHeight: brickHeight,
                brickWidth: brickWidth,
                brickX: MyBricks[4][0],
                brickY: MyBricks[4][1],
                brickBroken: MyBricks[4][2],
              ),

              MyBrick(
                brickHeight: brickHeight,
                brickWidth: brickWidth,
                brickX: MyBricks[5][0],
                brickY: MyBricks[5][1],
                brickBroken: MyBricks[5][2],
              ),
              MyBrick(
                brickHeight: brickHeight,
                brickWidth: brickWidth,
                brickX: MyBricks[6][0],
                brickY: MyBricks[6][1],
                brickBroken: MyBricks[6][2],
              ),

              MyBrick(
                brickHeight: brickHeight,
                brickWidth: brickWidth,
                brickX: MyBricks[7][0],
                brickY: MyBricks[7][1],
                brickBroken: MyBricks[7][2],
              ),

              //Movement Buttons
              Container(
                alignment: Alignment(1, 1),
                margin: EdgeInsets.only(bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                        ),
                        onPressed: moveLeft,
                        child: Icon(
                          Icons.arrow_circle_left_rounded,
                          size: 50,
                        )),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                        ),
                        onPressed: moveRight,
                        child: Icon(
                          Icons.arrow_circle_right_rounded,
                          size: 50,
                        )),
                  ],
                ),
              ),

              //brick Code
            ],
          ),
        ),
      ),
    );
  }
}
