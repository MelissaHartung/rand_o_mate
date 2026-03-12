import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:rand_o_mate/model/zufallgenerator.dart';

class Zufallsrad extends StatelessWidget {
  final List<Zufallgenerator> items;
  final Stream<int> selected;
  const Zufallsrad({super.key, required this.items, required this.selected});

  @override
  Widget build(BuildContext context) {
    return FortuneWheel(
      selected: selected,
      indicators: [
        FortuneIndicator(
          alignment: Alignment.topCenter,
          child: TriangleIndicator(color: const Color.fromARGB(255, 0, 4, 221)),
        ),
      ],
      animateFirst: false,
      // physics: NoPanPhysics(),
      items: items
          .map(
            (item) => FortuneItem(
              child: Text(
                item.title,
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          )
          .toList(),
    );
  }
}
