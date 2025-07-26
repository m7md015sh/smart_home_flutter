import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;
  final int delay;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
    required this.delay,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color(0xFF1A1A2E).withAlpha(128),
                const Color(0xFF16213E).withAlpha(96),
              ],
            ),
            border: Border.all(color: color.withAlpha(77), width: 1),
            boxShadow: [
              BoxShadow(
                color: color.withAlpha(25),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: color, size: 28),
              const Spacer(),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                title,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white.withAlpha(178),
                ),
              ),
            ],
          ),
        )
        .animate()
        .fadeIn(duration: 600.ms, delay: delay.ms)
        .slideY(begin: 0.3)
        .then()
        .shimmer(duration: 2000.ms, color: color.withAlpha(25));
  }
}
