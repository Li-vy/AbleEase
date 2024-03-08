import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:video_player/video_player.dart';

class EyeExercise extends StatefulWidget {
  const EyeExercise({super.key});

  @override
  State<EyeExercise> createState() => _EyeExerciseState();
}

class _EyeExerciseState extends State<EyeExercise> {
  late VideoPlayerController _controller;

  @override
  void initState() {}
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
      body: Column(
        children: [
          Center(
            child: Container(
              width: 300,
              height: 300,
              decoration:
                  BoxDecoration(color: Colors.black, shape: BoxShape.circle),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
