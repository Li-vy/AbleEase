import 'dart:async';
import 'dart:ui';

import 'package:ableeasefinale/pages/UI/navigationBar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class MedPage extends StatefulWidget {
  const MedPage({super.key});

  @override
  State<MedPage> createState() => _MedPageState();
}

class _MedPageState extends State<MedPage> {
  static const maxSeconds = 60;
  int seconds = maxSeconds;
  bool medStart = false;
  String meditationTime = "1 Minutes";
  Timer? timer;
  final player = AudioPlayer();

  void startTimer() {
    player.play(AssetSource('medAudio.mp3'));
    timer = Timer.periodic(Duration(seconds: 1), (_) {
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
        medStart = false;
        player.stop();
      });
  void stopTimer({bool reset = true}) {
    setState(() {
      player.stop();
      medStart == false;
      resetTimer();
      timer?.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return !medStart
        ? Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            body: Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 150),
                    child: Text(
                      "1",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: 35),
                    ),
                  ),
                ),
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
                    child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image(
                          image: AssetImage('lib/assets/images/meditating.png'),
                        )),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  child: DropdownButton<String>(
                    itemHeight: 50.0,
                    value: meditationTime,
                    icon: const Icon(Icons.keyboard_arrow_down_rounded),
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSecondary,
                        fontSize: 22),
                    underline: Container(
                      height: 2,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        meditationTime = newValue!;
                      });
                    },
                    items: [
                      DropdownMenuItem(
                        value: '1 Minutes',
                        child: Text('1 Minutes'),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary),
                    onPressed: () {
                      setState(() {
                        medStart = true;

                        startTimer();
                      });
                    },
                    child: Column(
                      children: [
                        Text(
                          "2",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        : Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            body: Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 150),
                    child: Text(
                      "Meditation",
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
                            CircularProgressIndicator(
                              color: Theme.of(context).colorScheme.secondary,
                              value: seconds / maxSeconds,
                            ),
                            Container(
                              height: 250,
                              width: 250,
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Image(
                                    image: AssetImage(
                                        "lib/assets/images/meditating.png")),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text('$seconds'),
                    ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary),
                    onPressed: () {
                      setState(() {
                        medStart = false;
                        stopTimer();
                      });
                    },
                    child: Column(
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
}
