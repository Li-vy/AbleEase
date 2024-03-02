import 'dart:async';

import 'package:ableeasefinale/pages/remembering_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'components/info_card.dart';

void main() {
  runApp(const MemoryGame());
}

class Game {
  final Color hiddenCard = Colors.red;
  List<Color>? gameColors;
  List<String>? gameImg;
  List<Color> cards = [
    Colors.green,
    Colors.yellow,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.blue
  ];
  final String hiddenCardpath = "lib/assets/images/Memory_game/hidden.png";
  List<String> cards_list = [
    "lib/assets/images/Memory_game/circle.png",
    "lib/assets/images/Memory_game/triangle.png",
    "lib/assets/images/Memory_game/circle.png",
    "lib/assets/images/Memory_game/heart.png",
    "lib/assets/images/Memory_game/star.png",
    "lib/assets/images/Memory_game/triangle.png",
    "lib/assets/images/Memory_game/star.png",
    "lib/assets/images/Memory_game/heart.png",
  ];
  final int cardCount = 8;
  List<Map<int, String>> matchCheck = [];

  //methods
  void initGame() {
    gameColors = List.generate(cardCount, (index) => hiddenCard);
    gameImg = List.generate(cardCount, (index) => hiddenCardpath);
  }
}

class MemoryGame extends StatelessWidget {
  const MemoryGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //setting text style
  TextStyle whiteText = TextStyle(color: Colors.white);
  bool hideTest = false;
  Game _game = Game();

  //game stats
  int tries = 0;
  int score = 0;
  late Timer _gameTimer;
  Duration _elapsedTime = Duration.zero;

  @override
  void initState() {
    super.initState();
    _game.initGame();
    _startGameTimer();
  }

  void _startGameTimer() {
    _gameTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _elapsedTime += Duration(seconds: 1);
      });
    });
  }

  void _showGameOverDialog() {
    _gameTimer.cancel();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Game Over"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Total Tries: $tries"),
              Text(
                  "Total Time: ${_elapsedTime.inSeconds} seconds"), // You need to calculate and display the total time
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                _restartGame(); // Call your restart method
              },
              child: Text("Restart"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("Go Back"),
            ),
          ],
        );
      },
    );
  }

  // Add this method to restart the game
  void _restartGame() {
    _gameTimer.cancel(); // Stop the current timer
    setState(() {
      tries = 0;
      score = 0;
      _elapsedTime = Duration.zero; // Reset the elapsed time
      _game.initGame();
    });
    _startGameTimer(); // Start a new timer
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      if (score >= 400) {
        _showGameOverDialog();
      }
    });

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const RememberingPage()));
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Color(0xFFE55870),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Memory Game",
              style: TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 24.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              info_card("Tries", "$tries"),
              info_card("Score", "$score"),
            ],
          ),
          SizedBox(
              height: MediaQuery.of(context).size.width,
              width: MediaQuery.of(context).size.width,
              child: GridView.builder(
                  itemCount: _game.gameImg!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                  ),
                  padding: EdgeInsets.all(16.0),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        print(_game.matchCheck);
                        setState(() {
                          //incrementing the clicks
                          tries++;
                          _game.gameImg![index] = _game.cards_list[index];
                          _game.matchCheck
                              .add({index: _game.cards_list[index]});
                          print(_game.matchCheck.first);
                        });
                        if (_game.matchCheck.length == 2) {
                          if (_game.matchCheck[0].values.first ==
                              _game.matchCheck[1].values.first) {
                            print("true");
                            //incrementing the score
                            score += 100;
                            _game.matchCheck.clear();
                          } else {
                            print("false");

                            Future.delayed(Duration(milliseconds: 500), () {
                              print(_game.gameColors);
                              setState(() {
                                _game.gameImg![_game.matchCheck[0].keys.first] =
                                    _game.hiddenCardpath;
                                _game.gameImg![_game.matchCheck[1].keys.first] =
                                    _game.hiddenCardpath;
                                _game.matchCheck.clear();
                              });
                            });
                          }
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFB46A),
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: AssetImage(_game.gameImg![index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
