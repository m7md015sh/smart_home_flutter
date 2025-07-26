import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class DeviceCard extends StatelessWidget {
  final String name;
  final IconData icon;
  final bool isOn;
  final Color color;
  final Function(bool)? onChanged;
  final int delay;

  const DeviceCard({
    super.key,
    required this.name,
    required this.icon,
    required this.isOn,
    required this.color,
    required this.onChanged,
    required this.delay,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.withAlpha(51),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  isOn ? 'مفعل' : 'معطل',
                  style: TextStyle(
                    fontSize: 12,
                    color: isOn
                        ? const Color(0xFF4CAF50)
                        : Colors.white.withAlpha(128),
                  ),
                ),
              ],
            ),
          ),
          Switch(value: isOn, onChanged: onChanged, activeColor: color),
        ],
      ),
    ).animate().fadeIn(duration: 600.ms, delay: delay.ms).slideX(begin: 0.3);
  }
}
