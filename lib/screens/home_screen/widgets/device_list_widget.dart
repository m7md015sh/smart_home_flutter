import 'package:flutter/material.dart';
import 'package:smart_home_dashboard/screens/home_screen/widgets/device_card_widget.dart';

class DevicesList extends StatelessWidget {
  final bool isLightOn;
  final bool isACOn;
  final Function(bool) onLightChanged;
  final Function(bool) onACChanged;

  const DevicesList({
    super.key,
    required this.isLightOn,
    required this.isACOn,
    required this.onLightChanged,
    required this.onACChanged,
  });

  @override
  Widget build(BuildContext context) {
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
        return DeviceCard(
          name: device['name'] as String,
          icon: device['icon'] as IconData,
          isOn: device['isOn'] as bool,
          color: device['color'] as Color,
          onChanged: device['onChanged'] as Function(bool)?,
          delay: index * 100,
        );
      },
    );
  }
}
