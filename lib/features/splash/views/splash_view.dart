import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../app/theme/app_colors.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    // Access controller to trigger lazy initialization and navigation
    controller;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppColors.plumGradient),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: AppColors.roseGoldGradient,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.roseGold.withValues(alpha: 0.4),
                      blurRadius: 30,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: const Icon(Icons.auto_awesome, color: Colors.white, size: 56),
              )
                  .animate()
                  .scale(begin: const Offset(0.5, 0.5), end: const Offset(1.0, 1.0), duration: 800.ms, curve: Curves.elasticOut)
                  .shimmer(duration: 1500.ms, delay: 500.ms, color: Colors.white.withValues(alpha: 0.3)),
              const SizedBox(height: 32),
              Text(
                'Glow & Shine',
                style: GoogleFonts.playfairDisplay(fontSize: 36, fontWeight: FontWeight.bold, color: AppColors.champagne, letterSpacing: 1.5),
              ).animate().fadeIn(delay: 400.ms, duration: 600.ms).slideY(begin: 0.3, end: 0, delay: 400.ms, duration: 600.ms),
              const SizedBox(height: 8),
              Text(
                'Your Beauty, Our Passion',
                style: GoogleFonts.poppins(fontSize: 14, color: AppColors.roseGoldLight, letterSpacing: 2),
              ).animate().fadeIn(delay: 800.ms, duration: 600.ms),
            ],
          ),
        ),
      ),
    );
  }
}
