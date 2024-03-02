import 'package:ableeasefinale/pages/games/memory_game/memory_gameR.dart';
import 'package:ableeasefinale/pages/instructions/instr_color_game.dart';
import 'package:ableeasefinale/pages/instructions/instr_memory_game.dart';
import 'package:flutter/material.dart';

class RememberingPage extends StatefulWidget {
  const RememberingPage({super.key});

  @override
  State<RememberingPage> createState() => _RememberingPageState();
}

class _RememberingPageState extends State<RememberingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 35, top: 24),
            child: Text(
              "Remembering",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSecondary,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35, top: 0),
            child: Text(
              "Select a Game",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: 36,
              ),
            ),
          ),
          Container(
            height: 200,
            margin: const EdgeInsets.only(top: 45, left: 35, right: 35),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(63, 0, 0, 0),
                  blurRadius: 4.0,
                  spreadRadius: -5.0,
                  offset: Offset(
                    0.0, // horizontal, move right 10
                    8.0, // vertical, move down 10
                  ),
                )
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Color Game",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontSize: 22),
                          ),
                          Text(
                            "Level 1",
                            style: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                                fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 70, right: 10, top: 15, bottom: 10),
                        child: Image(
                          image:
                              AssetImage("lib/assets/images/colorGamePic.png"),
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(
                  height: 5,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
                Row(
                  children: [
                    const Padding(padding: const EdgeInsets.only(left: 30)),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          backgroundColor:
                              Theme.of(context).colorScheme.background,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const InstrColorGame()));
                        },
                        child: Row(
                          children: [
                            Text("Start",
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                  fontSize: 18,
                                )),
                            const SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Theme.of(context).colorScheme.secondary,
                              size: 18,
                            )
                          ],
                        )),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text(
                        'EST: < 1 min',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onSecondary),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 200,
            margin:
                const EdgeInsets.only(top: 20, left: 35, right: 35, bottom: 20),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(63, 0, 0, 0),
                  blurRadius: 4.0,
                  spreadRadius: -5.0,
                  offset: Offset(
                    0.0, // horizontal, move right 10
                    8.0, // vertical, move down 10
                  ),
                )
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 0, left: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Memory Game",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontSize: 22),
                          ),
                          Text(
                            "Level 3",
                            style: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                                fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 35, top: 10),
                        child: Image(
                          image:
                              AssetImage("lib/assets/images/MemoryGamePic.png"),
                          // width: 300,
                          height: 130,
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(
                  height: 5,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
                Row(
                  children: [
                    const Padding(padding: const EdgeInsets.only(left: 30)),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          backgroundColor:
                              Theme.of(context).colorScheme.background,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const InstrMemoryGame()));
                        },
                        child: Row(
                          children: [
                            Text("Start",
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                  fontSize: 18,
                                )),
                            const SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Theme.of(context).colorScheme.secondary,
                              size: 18,
                            )
                          ],
                        )),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text(
                        'EST: 3 mins',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onSecondary),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
