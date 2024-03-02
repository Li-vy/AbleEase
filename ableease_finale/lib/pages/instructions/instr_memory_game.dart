import 'package:ableeasefinale/pages/games/memory_game/memory_gameR.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class InstrMemoryGame extends StatefulWidget {
  const InstrMemoryGame({super.key});

  @override
  State<InstrMemoryGame> createState() => _InstrMemoryGameState();
}

class _InstrMemoryGameState extends State<InstrMemoryGame> {
  PageController _controller = PageController();

  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Stack(
          children: [
            PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  onLastPage = (index == 2);
                });
              },
              children: [
                //First Page
                Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 150,
                      ),
                      Text("Step 1:",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 25,
                          )),

                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        "Identify the same color",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: 25,
                        ),
                      ),

                      SizedBox(
                        height: 130,
                      ),
                      //Image
                      Image(
                        image: AssetImage(
                            'lib/assets/images/instructions/ColorGame_1.png'),
                      ),
                    ],
                  ),
                ),

                //Second Page
                Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 150,
                      ),
                      Text("Step 2:",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 25,
                          )),

                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        "Hold & Drag the fruit to its respective color",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: 20,
                        ),
                      ),

                      SizedBox(
                        height: 130,
                      ),
                      //Image
                      Image(
                        image: AssetImage(
                            'lib/assets/images/instructions/ColorGame_1.2.png'),
                      ),
                    ],
                  ),
                ),

                //Third Page
                Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 150,
                      ),
                      Text("Step 3:",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 25,
                          )),

                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        "Release the fruit on color tile",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: 20,
                        ),
                      ),

                      SizedBox(
                        height: 130,
                      ),
                      //Image
                      Image(
                        image: AssetImage(
                            'lib/assets/images/instructions/ColorGame_3.png'),
                      ),

                      SizedBox(
                        height: 70,
                      ),

                      Text("Wohoo! Now follow the steps",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 20,
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Complete in less time to get high score !",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSecondary,
                            fontSize: 13,
                          ))
                    ],
                  ),
                )
              ],
            ),
            Container(
                alignment: Alignment(0, 0.75),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //Skip
                    GestureDetector(
                      onTap: () {
                        _controller.jumpToPage(2);
                      },
                      child: Text(
                        "Skip",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 20),
                      ),
                    ),

                    SmoothPageIndicator(controller: _controller, count: 3),

                    //Next or Start
                    onLastPage
                        ? GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const MemoryGame()));
                            },
                            child: Text(
                              "Start",
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                  fontSize: 20),
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              _controller.nextPage(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeIn);
                            },
                            child: Text(
                              "Next",
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                  fontSize: 20),
                            ),
                          )
                  ],
                ))
          ],
        ));
  }
}
