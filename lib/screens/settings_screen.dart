import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'الإعدادات',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ).animate().fadeIn(duration: 600.ms).slideX(begin: -0.3),
          const SizedBox(height: 32),
          _buildSettingCard(
            'الملف الشخصي',
            'أحمد محمد',
            Icons.person,
            const Color(0xFF6C63FF),
            0,
          ),
          const SizedBox(height: 16),
          _buildSettingCard(
            'الإشعارات',
            'مفعل',
            Icons.notifications,
            const Color(0xFF4CAF50),
            200,
          ),
          const SizedBox(height: 16),
          _buildSettingCard(
            'الوضع الليلي',
            'مفعل',
            Icons.dark_mode,
            const Color(0xFF9C27B0),
            400,
          ),
          const SizedBox(height: 16),
          _buildSettingCard(
            'اللغة',
            'العربية',
            Icons.language,
            const Color(0xFF2196F3),
            600,
          ),
          const SizedBox(height: 16),
          _buildSettingCard(
            'التحديثات التلقائية',
            'مفعل',
            Icons.system_update,
            const Color(0xFFFF9800),
            800,
          ),
          const SizedBox(height: 16),
          _buildSettingCard(
            'نسخ احتياطي',
            'آخر نسخة: اليوم',
            Icons.backup,
            const Color(0xFF00BCD4),
            1000,
          ),
          const SizedBox(height: 32),
          Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF1A1A2E), Color(0xFF16213E)],
                  ),
                  border: Border.all(
                    color: const Color(0xFFFF5722).withAlpha(77),
                    width: 1,
                  ),
                ),
                child: Column(
                  children: [
                    const Icon(
                      Icons.info_outline,
                      color: Color(0xFFFF5722),
                      size: 32,
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'حول التطبيق',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'الإصدار 1.0.0',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white.withAlpha(178),
                      ),
                    ),
                  ],
                ),
              )
              .animate()
              .fadeIn(duration: 600.ms, delay: 1200.ms)
              .slideY(begin: 0.3),
        ],
      ),
    );
  }

  Widget _buildSettingCard(
    String title,
    String subtitle,
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
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white.withAlpha(178),
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.white.withAlpha(128),
            size: 16,
          ),
        ],
      ),
    ).animate().fadeIn(duration: 600.ms, delay: delay.ms).slideX(begin: 0.3);
  }
}
