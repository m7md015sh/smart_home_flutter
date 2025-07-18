import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SecurityScreen extends StatelessWidget {
  final bool isSecurityOn;
  final VoidCallback onToggleSecurity;
  final AnimationController breathingController;

  const SecurityScreen({
    super.key,
    required this.isSecurityOn,
    required this.onToggleSecurity,
    required this.breathingController,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'الأمان',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ).animate().fadeIn(duration: 600.ms).slideX(begin: -0.3),
          const SizedBox(height: 32),
          _buildSecurityStatus(),
          const SizedBox(height: 32),
          _buildCameraGrid(),
        ],
      ),
    );
  }

  Widget _buildSecurityStatus() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            isSecurityOn
                ? const Color(0xFF4CAF50).withAlpha(25)
                : const Color(0xFFFF5722).withAlpha(12),
            isSecurityOn
                ? const Color(0xFF4CAF50).withAlpha(12)
                : const Color(0xFFFF5722).withAlpha(12),
          ],
        ),
        border: Border.all(
          color: isSecurityOn
              ? const Color(0xFF4CAF50).withAlpha(77)
              : const Color(0xFFFF5722).withAlpha(77),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          AnimatedBuilder(
            animation: breathingController,
            builder: (context, child) {
              return Transform.scale(
                scale: 1.0 + (breathingController.value * 0.1),
                child: Icon(
                  isSecurityOn ? Icons.security : Icons.warning,
                  color: isSecurityOn
                      ? const Color(0xFF4CAF50)
                      : const Color(0xFFFF5722),
                  size: 64,
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          Text(
            isSecurityOn ? 'النظام مفعل' : 'النظام معطل',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            isSecurityOn ? 'المنزل محمي' : 'المنزل غير محمي',
            style: TextStyle(fontSize: 16, color: Colors.white.withAlpha(178)),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: onToggleSecurity,
            style: ElevatedButton.styleFrom(
              backgroundColor: isSecurityOn
                  ? const Color(0xFFFF5722)
                  : const Color(0xFF4CAF50),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: Text(isSecurityOn ? 'إيقاف النظام' : 'تفعيل النظام'),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 600.ms, delay: 200.ms).slideY(begin: 0.3);
  }

  Widget _buildCameraGrid() {
    final cameras = ['المدخل الرئيسي', 'الصالة', 'المطبخ', 'الحديقة'];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'الكاميرات',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ).animate().fadeIn(duration: 600.ms, delay: 400.ms).slideX(begin: -0.3),
        const SizedBox(height: 24),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.2,
          ),
          itemCount: cameras.length,
          itemBuilder: (context, index) {
            return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFF1A1A2E), Color(0xFF16213E)],
                    ),
                    border: Border.all(
                      color: const Color(0xFF4CAF50).withAlpha(77),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.videocam,
                        color: Color(0xFF4CAF50),
                        size: 32,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        cameras[index],
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'نشط',
                        style: TextStyle(
                          fontSize: 12,
                          color: const Color(0xFF4CAF50).withAlpha(191),
                        ),
                      ),
                    ],
                  ),
                )
                .animate()
                .fadeIn(duration: 600.ms, delay: (index * 100 + 600).ms)
                .scale(begin: const Offset(0.8, 0.8));
          },
        ),
      ],
    );
  }
}
