import 'package:ableeasefinale/pages/UI/navigationBar.dart';
import 'package:ableeasefinale/pages/remembering_page.dart';
import 'package:flutter/material.dart';

import 'decisionMaking_Page.dart';
import 'lowVision_page.dart';
import 'payingAttention_page.dart';

class DisabilityPage extends StatefulWidget {
  const DisabilityPage({super.key});

  @override
  State<DisabilityPage> createState() => _DisabilityPageState();
}

class _DisabilityPageState extends State<DisabilityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80, left: 25),
            child: Text(
              "Select a Weakness",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary, fontSize: 38),
            ),
          ),

          //Container 1
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => RememberingPage()));
            },
            child: Container(
              height: 140,
              width: 500,
              margin: const EdgeInsets.only(top: 30, left: 25, right: 25),
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
                  ),
                ],
              ),
              child: Container(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 55, left: 20),
                            child: Text(
                              "Remembering",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontSize: 22,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 80),
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Color(0xff8EAAF4),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image(
                              image: AssetImage(
                                "lib/assets/images/remember.png",
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),

          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DecisionMakingPage()));
            },
            child: Container(
              height: 140,
              width: 500,
              margin: const EdgeInsets.only(top: 30, left: 25, right: 25),
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
                  ),
                ],
              ),
              child: Container(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 55, left: 20),
                            child: Text(
                              "Decision Making",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontSize: 22,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 55),
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Color(0xffEEFBB7),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image(
                              image: AssetImage(
                                "lib/assets/images/decision-making.png",
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),

          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PayingAttentionPage()));
            },
            child: Container(
              height: 140,
              width: 500,
              margin: const EdgeInsets.only(top: 30, left: 25, right: 25),
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
                  ),
                ],
              ),
              child: Container(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 55, left: 20),
                            child: Text(
                              "Paying Attension",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontSize: 22,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 50),
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Color(0xffFF7F7F),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image(
                              image: AssetImage(
                                "lib/assets/images/attention.png",
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),

          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const LowVisionPage()));
            },
            child: Container(
              height: 140,
              width: 500,
              margin: const EdgeInsets.only(top: 30, left: 25, right: 25),
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
                  ),
                ],
              ),
              child: Container(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 55, left: 20),
                            child: Text(
                              "Low Vision",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontSize: 22,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 110),
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image(
                              image: AssetImage(
                                "lib/assets/images/vision.png",
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
