import 'package:flutter/material.dart';
import 'package:rand_o_mate/model/rezepte.dart';

class RezeptCard extends StatelessWidget {
  final Rezepte rezept;

  const RezeptCard({super.key, required this.rezept});

  String get _subtitle {
    if (rezept.ingredients.trim().isEmpty) {
      return rezept.category;
    }

    final preview = rezept.ingredients.split(',').take(3).join(', ');
    return preview.length > 36 ? '${preview.substring(0, 33)}...' : preview;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 190,
      child: Container(
        margin: const EdgeInsets.only(right: 16, bottom: 18),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(26),
          boxShadow: const [BoxShadow(color: Color(0x14000000), blurRadius: 24, offset: Offset(0, 10))],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 96,
                height: 96,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [Color(0xFFF3FFF7), Color(0xFFD8F2E0)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: const Icon(Icons.restaurant_menu, size: 42, color: Color(0xFF39B86D)),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              rezept.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Color(0xFF181818)),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    rezept.category,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Color(0xFF181818)),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(color: const Color(0xFFF8F8F8), borderRadius: BorderRadius.circular(18)),
                  child: const Icon(Icons.favorite_border, size: 20, color: Color(0xFF181818)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
