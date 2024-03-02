import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class ColorGameR extends StatefulWidget {
  const ColorGameR({Key? key}) : super(key: key);

  @override
  State<ColorGameR> createState() => _ColorGameRState();
}

class _ColorGameRState extends State<ColorGameR> {
  final Map<String, bool> score = {};
  final Map choices = {
    '🍏': Colors.green,
    '🍋': Colors.yellow,
    '🍅': Colors.red,
    '🍇': Colors.purple,
    '🥥': Colors.brown,
    '🥕': Colors.orange,
  };

  int seed = 0;
  late Timer _timer;
  int _seconds = 0;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        _seconds++;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text('Score ${score.length} / 6'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Colors.white,
        onPressed: () {
          setState(() {
            score.clear();
            seed++;
            _seconds = 0;
            _timer.cancel();
            _startTimer();
          });
        },
      ),
      body: Row(
        children: [
          // Emojis on the left side
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: choices.keys.map((emoji) {
                return Draggable<String>(
                  data: emoji,
                  child: Emoji(emoji: score[emoji] == true ? '✅' : emoji),
                  feedback: Emoji(emoji: emoji),
                  childWhenDragging: Emoji(emoji: '☁️'),
                );
              }).toList(),
            ),
          ),

          // Colors on the right side
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: choices.keys
                  .map((emoji) => _buildDragTarget(emoji))
                  .toList()
                    ..shuffle(Random(seed)),
            ),
          ),
        ],
      ),
      // Align FloatingActionButton at the center bottom
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildDragTarget(String emoji) {
    return DragTarget<String>(
      builder: (BuildContext context, List<String?> incoming, List<dynamic> rejected) {
        if (score[emoji] == true) {
          return Container(
            padding: EdgeInsets.all(10),
            color: Theme.of(context).colorScheme.primary,
            
            alignment: Alignment.center,
            height: 80,
            width: 200,
            child: Text("Correct!",
              style: TextStyle(fontSize: 30,
              color: Theme.of(context).colorScheme.onPrimary,
              ),
              
            ),
          );
        } else {
          return Container(color: choices[emoji], height: 80, width: 200);
        }
      },
      onWillAccept: (data) => data == emoji,
      onAccept: (data) {
        setState(() {
          score[emoji] = true;

          if (score.length == 6) {
            _timer.cancel(); // Stop the timer
            _showEndDialog();
          }
        });
      },
      onLeave: (data) {},
    );
  }

  void _showEndDialog() {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Game Over'),
        content: Container(
          height: 150, // Set the desired height
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Time taken: $_seconds seconds'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                      _restartGame();
                    },
                    child: Text('Restart'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                      Navigator.of(context).pop(); // Close the game screen
                    },
                    child: Text('Go Back'),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}


  void _restartGame() {
    setState(() {
      score.clear();
      seed++;
      _seconds = 0;
      _timer.cancel();
      _startTimer();
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }
}

class Emoji extends StatelessWidget {
  Emoji({Key? key, required this.emoji}) : super(key: key);

  final String emoji;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        alignment: Alignment.center,
        height: 60, // Increase the height as needed
        padding: EdgeInsets.all(10),
        child: Text(
          emoji,
          style: TextStyle(color: Colors.black, fontSize: 35),
        ),
      ),
    );
  }
}
