import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class EyeExercise extends StatefulWidget {
  const EyeExercise({super.key});

  @override
  State<EyeExercise> createState() => _EyeExerciseState();
}

class _EyeExerciseState extends State<EyeExercise> {
  static const maxSeconds = 30;
  int seconds = maxSeconds;
  bool eyeStart = false;
  String meditationTime = "1 Minutes";
  Timer? timer;
  final player = AudioPlayer();

  void startTimer() {
    player.play(AssetSource('medAudio.mp3'));
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (seconds > 0) {
        setState(() {
          seconds--;
        });
      } else {
        stopTimer(reset: false);
      }
    });
  }

  void resetTimer() => setState(() {
        seconds = maxSeconds;
        eyeStart = false;
        player.stop();
      });
  void stopTimer({bool reset = true}) {
    setState(() {
      player.stop();
      eyeStart == false;
      resetTimer();
      timer?.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return !eyeStart
        ? Scaffold(
            // App Bar Icon that redirects to the previous page
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
              ),
              backgroundColor: Theme.of(context).colorScheme.background,
              elevation: 0,
            ),
            // Giving Baground Color
            backgroundColor: Theme.of(context).colorScheme.background,
            body: Column(
              children: [
                // Eye Exercise Text
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 75),
                    child: Text(
                      "Eye Exercise",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: 35),
                    ),
                  ),
                ),
                // The Circle with Image
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: Container(
                    height: 250,
                    width: 250,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      shape: BoxShape.circle,
                      boxShadow: [
                        new BoxShadow(
                          offset: Offset(2, 2),
                          color: Colors.black,
                          blurRadius: 5.0,
                        ),
                      ],
                    ),
                    child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Image(
                          image: AssetImage("lib/assets/images/eyeGame.png"),
                        )),
                  ),
                ),
                // Hint Text
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Container(
                    width: 225,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.25),
                      borderRadius: BorderRadius.circular(19),
                    ),
                    child: Center(
                      child: SizedBox(
                        width: 200,
                        height: 60,
                        child: Center(
                          child: Text(
                            "Instructions: Move your eyes in the direction specified without moving your head.",
                            style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimary
                                  .withOpacity(0.9),
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // Start button
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary),
                    onPressed: () {
                      setState(() {
                        eyeStart = true;

                        startTimer();
                      });
                    },
                    child: const Text(
                      "Start",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          )
        : Scaffold(
            // App Bar with Icon to go to the previous page
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
              ),
              backgroundColor: Theme.of(context).colorScheme.background,
              elevation: 0,
            ),
            // Giving Baground Color
            backgroundColor: Theme.of(context).colorScheme.background,
            body: Column(
              children: [
                // Eye Exercise Text
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 75),
                    child: Text(
                      "Eye Exercise",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: 35),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 80),
                    child: Column(children: [
                      SizedBox(
                        width: 250,
                        height: 250,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            // Progress Bar
                            CircularProgressIndicator(
                              color: Theme.of(context).colorScheme.secondary,
                              value: seconds / maxSeconds,
                            ),
                            // Image Container
                            Container(
                              height: 250,
                              width: 250,
                              child: const Padding(
                                padding: EdgeInsets.all(15.0),
                                child: Image(
                                  image: AssetImage(
                                      "lib/assets/images/eyeGame.png"),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text('$seconds'),
                    ]),
                  ),
                ),
                // Stop Button
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary),
                    onPressed: () {
                      setState(() {
                        eyeStart = false;
                        stopTimer();
                      });
                    },
                    child: const Column(
                      children: [
                        Text(
                          "STOP",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       leading: IconButton(
  //         onPressed: () {
  //           Navigator.of(context).pop();
  //         },
  //         icon: const Icon(Icons.arrow_back_ios_new_rounded),
  //       ),
  //       backgroundColor: Theme.of(context).colorScheme.background,
  //       elevation: 0,
  //     ),
  //     body: Column(
  //       children: [
  //         Padding(
  //           padding: const EdgeInsets.only(top: 70),
  //           child: Center(
  //             child: Container(
  //               width: 250,
  //               height: 250,
  //               decoration: BoxDecoration(
  //                 shape: BoxShape.circle,
  //                 color: Theme.of(context).colorScheme.primary,
  //                 image: const DecorationImage(
  //                   image: AssetImage("lib/assets/images/eyeGame.png"),
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
