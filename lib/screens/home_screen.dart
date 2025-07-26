import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HomeScreen extends StatelessWidget {
  final bool isLightOn;
  final bool isACOn;
  final bool isSecurityOn;
  final double temperature;
  final Function(bool) onLightChanged;
  final Function(bool) onACChanged;

  const HomeScreen({
    super.key,
    required this.isLightOn,
    required this.isACOn,
    required this.isSecurityOn,
    required this.temperature,
    required this.onLightChanged,
    required this.onACChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'مرحباً محمد',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ).animate().fadeIn(duration: 600.ms).slideX(begin: -0.3),
                    const Text(
                          'منزلك الذكي',
                          style: TextStyle(fontSize: 16, color: Colors.white70),
                        )
                        .animate()
                        .fadeIn(duration: 600.ms, delay: 200.ms)
                        .slideX(begin: -0.3),
                  ],
                ),
                Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: const LinearGradient(
                          colors: [Color(0xFF6C63FF), Color(0xFF9C27B0)],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF6C63FF).withAlpha(77),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 24,
                      ),
                    )
                    .animate()
                    .scale(delay: 400.ms, duration: 600.ms)
                    .then()
                    .shimmer(
                      duration: 2000.ms,
                      color: Colors.white.withAlpha(77),
                    ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  const Text(
                    'المنزل الآن',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ).animate().fadeIn(duration: 600.ms).slideX(begin: -0.3),
                  const SizedBox(height: 24),
                  _buildStatsGrid(),
                  const SizedBox(height: 32),
                  const Text(
                        'الأجهزة المفضلة',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )
                      .animate()
                      .fadeIn(duration: 600.ms, delay: 800.ms)
                      .slideX(begin: -0.3),
                  const SizedBox(height: 24),
                  _buildDevicesList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsGrid() {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1.5,
      children: [
        _buildStatCard(
          title: 'الطاقة المستهلكة',
          value: '45.2 kWh',
          icon: Icons.flash_on,
          color: const Color(0xFF00E676),
          delay: 200,
        ),
        _buildStatCard(
          title: 'درجة الحرارة',
          value: '${temperature.toInt()}°C',
          icon: Icons.thermostat,
          color: const Color(0xFFFF5722),
          delay: 400,
        ),
        _buildStatCard(
          title: 'الأجهزة النشطة',
          value: '12/18',
          icon: Icons.devices,
          color: const Color(0xFF2196F3),
          delay: 600,
        ),
        _buildStatCard(
          title: 'الأمان',
          value: isSecurityOn ? 'مفعل' : 'معطل',
          icon: Icons.security,
          color: isSecurityOn
              ? const Color(0xFF4CAF50)
              : const Color(0xFFFF5722),
          delay: 800,
        ),
      ],
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
    required int delay,
  }) {
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

  Widget _buildDevicesList() {
    final devices = [
      {
        'name': 'إضاءة الصالة',
        'icon': Icons.lightbulb,
        'isOn': isLightOn,
        'color': const Color(0xFFFFD700),
        'onChanged': onLightChanged,
      },
      {
        'name': 'المكيف',
        'icon': Icons.ac_unit,
        'isOn': isACOn,
        'color': const Color(0xFF2196F3),
        'onChanged': onACChanged,
      },
      {
        'name': 'التلفاز',
        'icon': Icons.tv,
        'isOn': true,
        'color': const Color(0xFF9C27B0),
        'onChanged': null,
      },
      {
        'name': 'نظام الصوت',
        'icon': Icons.speaker,
        'isOn': false,
        'color': const Color(0xFF4CAF50),
        'onChanged': null,
      },
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: devices.length,
      itemBuilder: (context, index) {
        final device = devices[index];
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
                border: Border.all(
                  color: (device['color'] as Color).withAlpha(77),
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (device['color'] as Color).withAlpha(51),
                    ),
                    child: Icon(
                      device['icon'] as IconData,
                      color: device['color'] as Color,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          device['name'] as String,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          device['isOn'] as bool ? 'مفعل' : 'معطل',
                          style: TextStyle(
                            fontSize: 12,
                            color: device['isOn'] as bool
                                ? const Color(0xFF4CAF50)
                                : Colors.white.withAlpha(128),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Switch(
                    value: device['isOn'] as bool,
                    onChanged: device['onChanged'] != null
                        ? (value) =>
                              (device['onChanged'] as Function(bool))(value)
                        : null,
                    activeColor: device['color'] as Color,
                  ),
                ],
              ),
            )
            .animate()
            .fadeIn(duration: 600.ms, delay: (index * 100).ms)
            .slideX(begin: 0.3);
      },
    );
  }
}
