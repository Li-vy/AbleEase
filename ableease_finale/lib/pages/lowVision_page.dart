import 'package:flutter/material.dart';

class LowVisionPage extends StatefulWidget {
  const LowVisionPage({super.key});

  @override
  State<LowVisionPage> createState() => _LowVisionPageState();
}

class _LowVisionPageState extends State<LowVisionPage> {
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
              "Low Vision",
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
                      padding: const EdgeInsets.only(top: 30, left: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Eye Exercise",
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
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 50, top: 10, right: 15, bottom: 10),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Image(
                            image: AssetImage("lib/assets/images/eye.png"),
                          ),
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
                    const Padding(padding: EdgeInsets.only(left: 30)),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          backgroundColor:
                              Theme.of(context).colorScheme.background,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const LowVisionPage()));
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
                    const Spacer(),
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
