import 'package:flutter/material.dart';

class SocialIcons {
  static Widget googleIcon({double size = 24, Color? color}) {
    return Image.asset(
      'assets/icons/google.png', // You'll need to add this asset
      width: size,
      height: size,
      color: color,
      errorBuilder: (context, error, stackTrace) {
        return Icon(
          Icons.g_mobiledata,
          size: size,
          color: color ?? Colors.red,
        );
      },
    );
  }

  static Widget facebookIcon({double size = 24, Color? color}) {
    return Image.asset(
      'assets/icons/facebook.png', // You'll need to add this asset
      width: size,
      height: size,
      color: color,
      errorBuilder: (context, error, stackTrace) {
        return Icon(
          Icons.facebook,
          size: size,
          color: color ?? const Color(0xFF1877F2),
        );
      },
    );
  }

  static Widget appleIcon({double size = 24, Color? color}) {
    return Image.asset(
      'assets/icons/apple.png', // You'll need to add this asset
      width: size,
      height: size,
      color: color,
      errorBuilder: (context, error, stackTrace) {
        return Icon(
          Icons.apple,
          size: size,
          color: color ?? Colors.black,
        );
      },
    );
  }

  static Widget twitterIcon({double size = 24, Color? color}) {
    return Image.asset(
      'assets/icons/twitter.png', // You'll need to add this asset
      width: size,
      height: size,
      color: color,
      errorBuilder: (context, error, stackTrace) {
        return Icon(
          Icons.trending_up, // Fallback icon
          size: size,
          color: color ?? const Color(0xFF1DA1F2),
        );
      },
    );
  }

  // Pre-styled social login buttons
  static Widget googleButton({required VoidCallback onPressed, double size = 24}) {
    return SocialLoginButton(
      icon: googleIcon(size: size),
      text: 'Continue with Google',
      onPressed: onPressed,
      backgroundColor: Colors.white,
      textColor: Colors.black87,
      borderColor: Colors.grey.shade300,
    );
  }

  static Widget facebookButton({required VoidCallback onPressed, double size = 24}) {
    return SocialLoginButton(
      icon: facebookIcon(size: size),
      text: 'Continue with Facebook',
      onPressed: onPressed,
      backgroundColor: const Color(0xFF1877F2),
      textColor: Colors.white,
    );
  }

  static Widget appleButton({required VoidCallback onPressed, double size = 24}) {
    return SocialLoginButton(
      icon: appleIcon(size: size),
      text: 'Continue with Apple',
      onPressed: onPressed,
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );
  }

  static Widget twitterButton({required VoidCallback onPressed, double size = 24}) {
    return SocialLoginButton(
      icon: twitterIcon(size: size),
      text: 'Continue with Twitter',
      onPressed: onPressed,
      backgroundColor: const Color(0xFF1DA1F2),
      textColor: Colors.white,
    );
  }
}

class SocialLoginButton extends StatelessWidget {
  final Widget icon;
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final Color? borderColor;

  const SocialLoginButton({
    Key? key,
    required this.icon,
    required this.text,
    required this.onPressed,
    required this.backgroundColor,
    required this.textColor,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: borderColor != null
              ? BorderSide(color: borderColor!)
              : BorderSide.none,
        ),
        elevation: 1,
        shadowColor: Colors.black.withOpacity(0.1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          const SizedBox(width: 12),
          Text(
            text,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}