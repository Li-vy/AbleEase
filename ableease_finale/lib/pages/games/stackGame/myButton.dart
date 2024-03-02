import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {

  final child;
  final function;

  const MyButton({super.key, this.child, this.function});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              padding: EdgeInsets.all(20),
              color: Theme.of(context).colorScheme.primary,
              child: Center(child: child),
            ),
          ),
        ),
      ),
    );
  }
}
