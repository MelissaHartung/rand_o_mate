import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

class Zufallsrad extends StatelessWidget {
  const Zufallsrad({super.key});

  @override
  Widget build(BuildContext context) {
    return FortuneWheel(
      indicators: [
        FortuneIndicator(
          alignment: Alignment.topCenter,
          child: TriangleIndicator(color: const Color.fromARGB(255, 0, 4, 221)),
        ),
      ],
      animateFirst: false,
      // physics: NoPanPhysics(),
      items: [
        FortuneItem(child: Text('Option 1')),
        FortuneItem(child: Text('Option 2')),
        FortuneItem(child: Text('Option 3')),
        FortuneItem(child: Text('Option 4')),
        FortuneItem(child: Text('Option 5')),
      ],
    );
  }
}
