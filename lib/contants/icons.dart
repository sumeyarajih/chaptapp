import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialIcons {
  // Google icon using FontAwesome
  static Widget googleIcon({double size = 24, Color? color}) {
    return FaIcon(
      FontAwesomeIcons.google,
      size: size,
      color: color ?? const Color(0xFFDB4437), // Google red
    );
  }

  // Facebook icon using FontAwesome
  static Widget facebookIcon({double size = 24, Color? color}) {
    return FaIcon(
      FontAwesomeIcons.facebookF,
      size: size,
      color: color ?? const Color(0xFF1877F2), // Facebook blue
    );
  }

  // Instagram icon using FontAwesome
  static Widget instagramIcon({double size = 24, Color? color}) {
    return FaIcon(
      FontAwesomeIcons.instagram,
      size: size,
      color: color ?? const Color(0xFFE1306C), // Instagram pink
    );
  }

  // Social icon button with circular container
  static Widget socialIconButton({
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
    double size = 50,
    double iconSize = 20,
    Color backgroundColor = Colors.white,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 6,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Center(
          child: FaIcon(
            icon,
            color: color,
            size: iconSize,
          ),
        ),
      ),
    );
  }

  // Ready-to-use social icon buttons
  static Widget googleIconButton({
    required VoidCallback onPressed,
    double size = 50,
    double iconSize = 20,
  }) {
    return socialIconButton(
      icon: FontAwesomeIcons.google,
      color: const Color(0xFFDB4437),
      onPressed: onPressed,
      size: size,
      iconSize: iconSize,
    );
  }

  static Widget facebookIconButton({
    required VoidCallback onPressed,
    double size = 50,
    double iconSize = 20,
  }) {
    return socialIconButton(
      icon: FontAwesomeIcons.facebookF,
      color: const Color(0xFF1877F2),
      onPressed: onPressed,
      size: size,
      iconSize: iconSize,
    );
  }

  static Widget instagramIconButton({
    required VoidCallback onPressed,
    double size = 50,
    double iconSize = 20,
  }) {
    return socialIconButton(
      icon: FontAwesomeIcons.instagram,
      color: const Color(0xFFE1306C),
      onPressed: onPressed,
      size: size,
      iconSize: iconSize,
    );
  }

  // Social row for login screen
  static Widget socialLoginRow({
    required BuildContext context,
    required VoidCallback onGooglePressed,
    required VoidCallback onFacebookPressed,
    required VoidCallback onInstagramPressed,
    bool isSmallScreen = false,
  }) {
    final double size = isSmallScreen ? 40 : 50;
    final double iconSize = isSmallScreen ? 16 : 20;
    final double spacing = isSmallScreen ? 15 : 20;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        googleIconButton(
          onPressed: onGooglePressed,
          size: size,
          iconSize: iconSize,
        ),
        SizedBox(width: spacing),
        facebookIconButton(
          onPressed: onFacebookPressed,
          size: size,
          iconSize: iconSize,
        ),
        SizedBox(width: spacing),
        instagramIconButton(
          onPressed: onInstagramPressed,
          size: size,
          iconSize: iconSize,
        ),
      ],
    );
  }
}