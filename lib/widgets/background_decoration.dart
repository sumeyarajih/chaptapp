import 'package:flutter/material.dart';
import '../contants/color.dart';

class BackgroundDecoration extends StatelessWidget {
  final Widget child;

  const BackgroundDecoration({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Primary background
        Container(color: AppColors.primary),

        // ===== TOP AREA (dense) =====
        _icon(Icons.chat_bubble_outline, top: -20, left: 10, size: 36),
        _icon(Icons.message_outlined, top: 20, left: 80, size: 30),
        _icon(Icons.chat_outlined, top: 60, right: 40, size: 34),
        _icon(Icons.chat_bubble, top: 10, right: -10, size: 42),
        _icon(Icons.message, top: 110, left: 20, size: 28),

        // ===== CENTER – ABOVE TEXT =====
        _icon(Icons.chat_bubble_outline, top: 220, left: 40, size: 32),
        _icon(Icons.message_outlined, top: 240, right: 50, size: 30),

        // ===== CENTER – BEHIND TEXT (very subtle) =====
        Positioned.fill(
          child: Center(
            child: Icon(
              Icons.chat_bubble,
              size: 180,
              color: AppColors.secondary.withOpacity(0.04),
            ),
          ),
        ),

        // ===== CENTER – BELOW TEXT =====
        _icon(Icons.chat_outlined, bottom: 260, left: 60, size: 32),
        _icon(Icons.message_outlined, bottom: 240, right: 70, size: 30),

        // ===== BOTTOM AREA =====
        _icon(Icons.chat_outlined, bottom: 140, left: 20, size: 36),
        _icon(Icons.chat_bubble, bottom: 80, right: 10, size: 40),
        _icon(Icons.message, bottom: -10, left: 60, size: 34),
        _icon(Icons.chat_bubble_outline, bottom: -30, right: -20, size: 46),

        // ===== FOREGROUND CONTENT =====
        SafeArea(
          child: Center(child: child),
        ),
      ],
    );
  }

  Widget _icon(
    IconData icon, {
    double? top,
    double? bottom,
    double? left,
    double? right,
    required double size,
  }) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: Icon(
        icon,
        size: size,
        color: AppColors.secondary.withOpacity(0.08),
      ),
    );
  }
}
