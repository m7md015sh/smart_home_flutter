import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ControlsScreen extends StatelessWidget {
  final double temperature;
  final double brightness;
  final ValueChanged<double> onTemperatureChanged;
  final ValueChanged<double> onBrightnessChanged;

  const ControlsScreen({
    super.key,
    required this.temperature,
    required this.brightness,
    required this.onTemperatureChanged,
    required this.onBrightnessChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'التحكم',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ).animate().fadeIn(duration: 600.ms).slideX(begin: -0.3),
          const SizedBox(height: 32),
          _buildTemperatureControl(context),
          const SizedBox(height: 32),
          _buildBrightnessControl(context),
          const SizedBox(height: 32),
          _buildQuickActions(),
        ],
      ),
    );
  }

  Widget _buildTemperatureControl(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF1A1A2E), Color(0xFF16213E)],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.thermostat, color: Color(0xFFFF5722), size: 32),
              const SizedBox(width: 12),
              const Text(
                'درجة الحرارة',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  if (temperature > 16) onTemperatureChanged(temperature - 1);
                },
                icon: const Icon(Icons.remove_circle_outline),
                color: const Color(0xFFFF5722),
                iconSize: 48,
              ),
              const SizedBox(width: 32),
              Text(
                '${temperature.toInt()}°C',
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ).animate().scale(duration: 300.ms),
              const SizedBox(width: 32),
              IconButton(
                onPressed: () {
                  if (temperature < 30) onTemperatureChanged(temperature + 1);
                },
                icon: const Icon(Icons.add_circle_outline),
                color: const Color(0xFFFF5722),
                iconSize: 48,
              ),
            ],
          ),
        ],
      ),
    ).animate().fadeIn(duration: 600.ms, delay: 200.ms).slideY(begin: 0.3);
  }

  Widget _buildBrightnessControl(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF1A1A2E), Color(0xFF16213E)],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.brightness_6,
                color: Color(0xFFFFD700),
                size: 32,
              ),
              const SizedBox(width: 12),
              const Text(
                'الإضاءة',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 8,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 16),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 24),
            ),
            child: Slider(
              value: brightness,
              onChanged: onBrightnessChanged,
              activeColor: const Color(0xFFFFD700),
              inactiveColor: const Color(0xFFFFD700).withAlpha(77),
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Text(
              '${(brightness * 100).toInt()}%',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 600.ms, delay: 400.ms).slideY(begin: 0.3);
  }

  Widget _buildQuickActions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'إجراءات سريعة',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ).animate().fadeIn(duration: 600.ms, delay: 600.ms).slideX(begin: -0.3),
        const SizedBox(height: 24),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.2,
          children: [
            _buildQuickActionCard(
              'إطفاء الكل',
              Icons.power_off,
              const Color(0xFFFF5722),
              0,
            ),
            _buildQuickActionCard(
              'وضع النوم',
              Icons.nightlight_round,
              const Color(0xFF9C27B0),
              200,
            ),
            _buildQuickActionCard(
              'وضع التوفير',
              Icons.eco,
              const Color(0xFF4CAF50),
              400,
            ),
            _buildQuickActionCard(
              'مغادرة المنزل',
              Icons.home,
              const Color(0xFF2196F3),
              600,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildQuickActionCard(
    String title,
    IconData icon,
    Color color,
    int delay,
  ) {
    return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [color.withAlpha(25), color.withAlpha(12)],
            ),
            border: Border.all(color: color.withAlpha(77), width: 1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: color, size: 32),
              const SizedBox(height: 12),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        )
        .animate()
        .fadeIn(duration: 600.ms, delay: delay.ms)
        .scale(begin: const Offset(0.8, 0.8));
  }
}
