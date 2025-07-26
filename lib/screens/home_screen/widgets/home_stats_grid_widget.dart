import 'package:flutter/material.dart';
import 'package:smart_home_dashboard/screens/home_screen/widgets/stat_card_item_widget.dart';

class HomeStatsGrid extends StatelessWidget {
  final double temperature;
  final bool isSecurityOn;

  const HomeStatsGrid({
    super.key,
    required this.temperature,
    required this.isSecurityOn,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1.5,
      children: [
        StatCard(
          title: 'الطاقة المستهلكة',
          value: '45.2 kWh',
          icon: Icons.flash_on,
          color: const Color(0xFF00E676),
          delay: 200,
        ),
        StatCard(
          title: 'درجة الحرارة',
          value: '${temperature.toInt()}°C',
          icon: Icons.thermostat,
          color: const Color(0xFFFF5722),
          delay: 400,
        ),
        StatCard(
          title: 'الأجهزة النشطة',
          value: '12/18',
          icon: Icons.devices,
          color: const Color(0xFF2196F3),
          delay: 600,
        ),
        StatCard(
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
}
