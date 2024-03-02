import 'package:ableeasefinale/pages/UI/navigationBar.dart';
// import 'package:disabilities_traning_app/pages/navigationBar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Main Home Column
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Notification Bar Padding
          const SizedBox(
            height: 42,
            // 37 looked perfect
            // 42 perfect starts right after the notification bar
          ),

          // For Name and Icon
          SizedBox(
            // color: Colors.white,
            height: 200,
            width: 411,

            // To align Name and Icon side by side
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              // To align greattings and Name One below the other
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 70),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      getGreetings(),
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.w300),
                    ),
                    const Text(
                      "Vishhal",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
              // For Padding
              const SizedBox(
                width: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 0, top: 20, left: 30),
                child: CircleAvatar(
                  radius: 67,
                  backgroundColor: Theme.of(context).colorScheme.onPrimary,
                  child: const CircleAvatar(
                    radius: 65,
                    foregroundImage: AssetImage('lib/assets/images/avatar.jpg'),
                  ),
                ),
              )
            ]),
          ),

          // Padding Between Name, Icon and Quote of the day
          const SizedBox(height: 10),

          // Quote of the day
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Theme.of(context).colorScheme.primary),
            width: MediaQuery.of(context).size.width - 25,
            height: 150,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, left: 20),
                    child: Text("Quote of the day"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: Text(
                    "Personal growth is about Progress, not Perfection.",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSecondary,
                        fontSize: 18),
                  ),
                )
              ],
            ),
          ),

          SizedBox(
            height: 25,
          ),

          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Theme.of(context).colorScheme.primary),
                  width: MediaQuery.of(context).size.width / 2 - 25,
                  height: 200,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          "Recommended",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Image(
                          image: AssetImage('lib/assets/images/meditating.png'),
                          width: 100,
                        ),
                      ),
                      Text(
                        "Meditation",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onSecondary),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Theme.of(context).colorScheme.primary),
                  width: MediaQuery.of(context).size.width / 2 - 25,
                  height: 200,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          "Previous",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Image(
                          image:
                              AssetImage('lib/assets/images/MemoryGamePic.png'),
                          width: 250,
                        ),
                      ),
                      Text(
                        "Color Game",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onSecondary),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

String getGreetings() {
  DateTime now = DateTime.now();
  int currentHour = now.hour;

  if (currentHour < 12) {
    return "Good Morning,";
  } else if (currentHour < 18) {
    return "Good Afternoon,";
  } else {
    return "Good Evening,";
  }
}
