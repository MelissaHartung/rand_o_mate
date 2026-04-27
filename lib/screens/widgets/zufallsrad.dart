import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:rand_o_mate/model/zufallgenerator.dart';

class Zufallsrad extends StatelessWidget {
  final List<Zufallgenerator> items;
  final Stream<int> selected;
  const Zufallsrad({super.key, required this.items, required this.selected});

  @override
  Widget build(BuildContext context) {
    final List<Color> wheelColors = [
      const Color.fromARGB(255, 218, 147, 183),
      const Color.fromARGB(255, 167, 27, 99),
      const Color.fromARGB(255, 201, 74, 140),
      const Color.fromARGB(255, 136, 68, 103),
      const Color.fromARGB(255, 201, 74, 140),

      const Color.fromARGB(255, 126, 87, 194),
      const Color.fromARGB(255, 181, 51, 214),
      const Color.fromARGB(255, 77, 166, 124),
      const Color.fromARGB(255, 236, 162, 63),
      const Color.fromARGB(255, 61, 127, 196),
    ];

    return FortuneWheel(
      selected: selected,
      indicators: [
        FortuneIndicator(
          alignment: Alignment.topCenter,
          child: TriangleIndicator(color: const Color.fromARGB(255, 19, 0, 124)),
        ),
      ],
      animateFirst: false,
      // physics: NoPanPhysics(),
      items: items.asMap().entries.map((entry) {
        final index = entry.key;
        final item = entry.value;

        return FortuneItem(
          style: FortuneItemStyle(
            color: wheelColors[index % wheelColors.length],
            borderColor: Color.fromARGB(248, 220, 186, 240),
            borderWidth: 4,
          ),
          child: Text(
            item.title,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 18, color: Colors.white),
          ),
        );
      }).toList(),
    );
  }
}
