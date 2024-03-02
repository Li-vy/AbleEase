import 'dart:async';
import 'dart:math';

import 'package:ableeasefinale/pages/games/Testris%20Game/piece.dart';
import 'package:ableeasefinale/pages/games/Testris%20Game/pixel.dart';
import 'package:ableeasefinale/pages/games/Testris%20Game/values.dart';
import 'package:flutter/material.dart';

// create game board
List<List<Tetromino?>> gameBoard = List.generate(
  colLength,
  (i) => List.generate(
    rowLength,
    (j) => null,
  ),
);

class GameBoard extends StatefulWidget {
  const GameBoard({super.key});

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  // current tetris piece
  Piece currentPiece = Piece(type: Tetromino.L);

  int currentScore = 0;

  bool _isButtonDisabled = false;

  bool gameOver = false;
  void handleButtonTap() {
    setState(() {
      _isButtonDisabled = true;
    });
  }

  @override
  void initState() {
    super.initState();

    // startGame();
  }

  void startGame() {
    currentPiece.initializePiece();

    //Frame refresh rate
    Duration frameRate = const Duration(milliseconds: 400);
    gameLoop(frameRate);
  }

  void gameLoop(Duration frameRate) {
    Timer.periodic(frameRate, (timer) {
      setState(() {
        //clear lines
        clearLines();

        //check landing
        checkLanding();

        //check is game is over
        if (gameOver == true) {
          timer.cancel();
          showGameOverDialog();
        }

        //move current piece down
        currentPiece.movePiece(Direction.down);
      });
    });
  }

  void showGameOverDialog() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Game Over'),
              content: Text("Your Score is : $currentScore"),
              actions: [
                TextButton(
                    onPressed: () {
                      resetGame();
                      Navigator.pop(context);
                    },
                    child: Text("Play Again"))
              ],
            ));
  }

  void resetGame() {
    gameBoard = List.generate(
        colLength,
        (i) => List.generate(
              rowLength,
              (j) => null,
            ));

    gameOver = false;
    currentScore = 0;

    createNewPiece();
    startGame();
  }

  // check for collision in a future position

  bool checkCollision(Direction direction) {
    //loop through each position of current piece
    for (int i = 0; i < currentPiece.position.length; i++) {
      //calculate row and col of current position
      int row = (currentPiece.position[i] / rowLength).floor();
      int col = currentPiece.position[i] % rowLength;

      // check if the piece is out of bound
      if (direction == Direction.left) {
        col -= 1;
      } else if (direction == Direction.right) {
        col += 1;
      } else if (direction == Direction.down) {
        row += 1;
      }

      if (row >= colLength || col < 0 || col >= rowLength) {
        return true;
      } else if (col > 0 && row > 0 && gameBoard[row][col] != null) {
        return true;
      }
    }
    return false;
  }

  void checkLanding() {
    // if going down in opccupied

    if (checkCollision(Direction.down)) {
      for (int i = 0; i < currentPiece.position.length; i++) {
        int row = (currentPiece.position[i] / rowLength).floor();
        int col = currentPiece.position[i] % rowLength;

        if (row >= 0 && col >= 0) {
          gameBoard[row][col] = currentPiece.type;
        }
      }

      // once landed, create new piece
      createNewPiece();
    }
  }

  void createNewPiece() {
    //create  a random object top generate random piece
    Random rand = Random();

    //Create new random piece
    Tetromino randomType =
        Tetromino.values[rand.nextInt(Tetromino.values.length)];
    currentPiece = Piece(type: randomType);
    currentPiece.initializePiece();

    if (isGameOver()) {
      gameOver = true;
    }
  }

  //move left

  void moveLeft() {
    //check if move is valid before moving there
    if (!checkCollision(Direction.left)) {
      setState(() {
        currentPiece.movePiece(Direction.left);
      });
    }
  }

  //move Right
  void moveRight() {
    //check if move is valid before moving there
    if (!checkCollision(Direction.left)) {
      setState(() {
        currentPiece.movePiece(Direction.right);
      });
    }
  }

  //Roatate Piece
  void rotatePiece() {
    setState(() {
      currentPiece.rotatePiece();
    });
  }

  //Clear Lines
  void clearLines() {
    for (int row = colLength - 1; row >= 0; row--) {
      bool rowIsFull = true;
      for (int col = 0; col < rowLength; col++) {
        if (gameBoard[row][col] == null) {
          rowIsFull = false;
          break;
        }
      }

      if (rowIsFull) {
        for (int r = row; r > 0; r--) {
          gameBoard[r] = List.from(gameBoard[r - 1]);
        }
        gameBoard[0] = List.generate(row, (index) => null);

        currentScore++;
      }
    }
  }

  //Game Over method
  bool isGameOver() {
    for (int col = 0; col < rowLength; col++) {
      if (gameBoard[0][col] != null) {
        return true;
      }
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            resetGame();
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 96.0),
          child: Text("Score: $currentScore"),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
                itemCount: rowLength * colLength,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: rowLength),
                itemBuilder: (context, index) {
                  int row = (index / rowLength).floor();
                  int col = index % rowLength;

                  // current piece
                  if (currentPiece.position.contains(index)) {
                    return Pixel(
                      color: currentPiece.color,
                      child: '',
                    );
                  }

                  //landed piece
                  else if (gameBoard[row][col] != null) {
                    final Tetromino? tetrominoType = gameBoard[row][col];
                    return Pixel(
                      color: tetrominoColors[tetrominoType],
                      child: '',
                    );
                  } else {
                    //blank piece
                    return Pixel(
                      color: Theme.of(context).colorScheme.primary,
                      child: '',
                    );
                  }
                }),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: Column(
              children: [
                IconButton(
                  onPressed: () {
                    startGame();
                    _isButtonDisabled ? null : handleButtonTap;
                  },
                  color: Theme.of(context).colorScheme.onPrimary,
                  icon: Icon(Icons.play_arrow_rounded),
                  iconSize: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //left
                    IconButton(
                        onPressed: moveLeft,
                        color: Theme.of(context).colorScheme.onPrimary,
                        icon: Icon(Icons.arrow_back_ios)),

                    //rotate
                    IconButton(
                        onPressed: rotatePiece,
                        color: Theme.of(context).colorScheme.onPrimary,
                        icon: Icon(Icons.rotate_right)),

                    //right
                    IconButton(
                        onPressed: moveRight,
                        color: Theme.of(context).colorScheme.onPrimary,
                        icon: Icon(Icons.arrow_forward_ios)),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
