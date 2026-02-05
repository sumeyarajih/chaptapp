import 'dart:async';
import 'package:flutter/material.dart';
import 'package:polychat/contants/color.dart';
import '../widgets/speech_bubble.dart';
import 'splash2.dart';

class Splash1 extends StatefulWidget {
  const Splash1({Key? key}) : super(key: key);

  @override
  State<Splash1> createState() => _Splash1State();
}

class _Splash1State extends State<Splash1>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<Color?> _bgColorAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    // Bubble scale animation
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 25.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    // Background color animation (white → primary)
    _bgColorAnimation = ColorTween(
      begin: AppColors.secondary,
      end: AppColors.primary,
    ).animate(_controller);

    // ⏳ Delay before starting animation
    Timer(const Duration(milliseconds: 500), () {
      _controller.forward();
    });

    // 🚀 Navigate after animation
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const  SplashScreen2(),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: _bgColorAnimation.value,
          body: Center(
            child: Transform.scale(
              scale: _scaleAnimation.value,
              child: const SpeechBubble(
                color: AppColors.primary,
                width: 120,
                height: 90,
              ),
            ),
          ),
        );
      },
    );
  }
}
