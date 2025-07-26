import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:smart_home_dashboard/screens/home_screen/widgets/device_list_widget.dart';
import 'package:smart_home_dashboard/screens/home_screen/widgets/home_header_widget.dart';
import 'package:smart_home_dashboard/screens/home_screen/widgets/home_stats_grid_widget.dart';

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
          const HomeHeader(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  const Text(
                    'المنزل الآن',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ).animate().fadeIn(duration: 600.ms).slideX(begin: -0.3),
                  const SizedBox(height: 24),
                  HomeStatsGrid(
                    temperature: temperature,
                    isSecurityOn: isSecurityOn,
                  ),
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
                  DevicesList(
                    isLightOn: isLightOn,
                    isACOn: isACOn,
                    onLightChanged: onLightChanged,
                    onACChanged: onACChanged,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
