import 'package:flutter/material.dart';

class FilterItem {
  final String label;
  final IconData icon;

  const FilterItem({required this.label, required this.icon});
}

class FilterBar extends StatelessWidget {
  final String category;

  const FilterBar({super.key, required this.category});

  List<FilterItem> get filtersForCategory {
    switch (category) {
      case 'Aktivitäten':
        return const [
          FilterItem(label: 'Draußen', icon: Icons.park_outlined),
          FilterItem(label: 'Drinnen', icon: Icons.home_outlined),
          FilterItem(label: 'Sport', icon: Icons.directions_run_outlined),
          FilterItem(label: 'Kreativ', icon: Icons.palette_outlined),
        ];
      case 'Filme':
        return const [
          FilterItem(label: 'Action', icon: Icons.local_fire_department_outlined),
          FilterItem(label: 'Comedy', icon: Icons.sentiment_very_satisfied_outlined),
          FilterItem(label: 'Drama', icon: Icons.theater_comedy_outlined),
          FilterItem(label: 'Kurz', icon: Icons.timer_outlined),
        ];
      default:
        return const [
          FilterItem(label: 'Asiatisch', icon: Icons.eco_outlined),
          FilterItem(label: 'Fleisch', icon: Icons.set_meal_outlined),
          FilterItem(label: 'Süßes', icon: Icons.cake_outlined),
          FilterItem(label: 'Schnell', icon: Icons.timer_outlined),
          FilterItem(label: 'Italienisch', icon: Icons.local_pizza_outlined),
        ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i = 0; i < filtersForCategory.length; i++) ...[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: i == 0 ? const Color(0xFF39B86D) : Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                children: [
                  Icon(filtersForCategory[i].icon, size: 18, color: i == 0 ? Colors.white : Colors.black87),
                  const SizedBox(width: 8),
                  Text(filtersForCategory[i].label),
                ],
              ),
            ),
            if (i != filtersForCategory.length - 1) const SizedBox(width: 12),
          ],
        ],
      ),
    );
  }
}
