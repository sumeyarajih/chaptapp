import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:polychat/auth/login.dart';
import 'package:polychat/contants/text_style.dart';
import 'package:polychat/services/auth_service.dart';
import '../contants/color.dart';
import '../widgets/background_decoration.dart';

class EmailVerificationScreen extends StatefulWidget {
  final String email;
  final String fullName;
  
  const EmailVerificationScreen({
    Key? key,
    required this.email,
    required this.fullName,
  }) : super(key: key);

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final AuthService _authService = AuthService();
  bool _isLoading = false;
  bool _isResending = false;
  int _countdown = 0;
  bool _isVerified = false;
  late Timer _verificationTimer;
  late Timer _countdownTimer;
  
  @override
  void initState() {
    super.initState();
    _startCountdown();
    _startVerificationCheck();
  }
  
  void _startCountdown() {
    _countdown = 60;
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_countdown > 0) {
        setState(() => _countdown--);
      } else {
        timer.cancel();
      }
    });
  }
  
  void _startVerificationCheck() {
    // Check verification status every 5 seconds
    _verificationTimer = Timer.periodic(const Duration(seconds: 5), (timer) async {
      if (!_isVerified && mounted) {
        await _checkVerificationStatus();
      }
    });
  }
  
  Future<void> _checkVerificationStatus() async {
    try {
      final isVerified = await _authService.checkVerificationStatus();
      if (isVerified && mounted) {
        setState(() => _isVerified = true);
        _verificationTimer.cancel();
        
        // Navigate to login screen after short delay
        Future.delayed(const Duration(seconds: 2), () {
          if (mounted) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => LoginScreen()),
              (route) => false,
            );
          }
        });
        
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Email verified successfully!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      print('Verification check error: $e');
    }
  }
  
  Future<void> _manualCheckVerification() async {
    if (_isLoading) return;
    
    setState(() => _isLoading = true);
    
    try {
      await _checkVerificationStatus();
      
      if (!_isVerified) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Not verified yet. Please check your email.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error checking verification: $e')),
      );
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }
  
  Future<void> _resendVerification() async {
    if (_countdown > 0) return;
    
    setState(() => _isResending = true);
    
    try {
      await _authService.resendVerificationEmail();
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Verification email sent! Check your inbox.'),
          backgroundColor: Colors.green,
        ),
      );
      
      // Restart countdown
      _startCountdown();
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'Failed to resend email';
      if (e.code == 'too-many-requests') {
        errorMessage = 'Too many requests. Please wait a while.';
      }
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to resend email: $e')),
      );
    } finally {
      if (mounted) {
        setState(() => _isResending = false);
      }
    }
  }
  
  @override
  void dispose() {
    _verificationTimer.cancel();
    _countdownTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundDecoration(
        child: Stack(
          children: [
            // Back Button at top
            Positioned(
              top: MediaQuery.of(context).padding.top + 20,
              left: 20,
              child: IconButton(
                onPressed: () {
                  // Sign out and go back to signup
                  _authService.signOut();
                  Navigator.pop(context);
                },
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.secondary.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 5,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.arrow_back,
                    color: AppColors.primary,
                    size: 24,
                  ),
                ),
              ),
            ),

            // Main content - Centered Container
            Center(
              child: SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: AppColors.secondary,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 20,
                        spreadRadius: 5,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Icon with animation when verified
                      AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        child: Icon(
                          _isVerified ? Icons.verified : Icons.email_outlined,
                          size: 80,
                          color: _isVerified ? Colors.green : AppColors.primary,
                        ),
                      ),
                      
                      const SizedBox(height: 20),
                      
                      // Title
                      Text(
                        _isVerified ? "Email Verified!" : "Verify Your Email",
                        style: AppTextStyle.splashText.copyWith(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: _isVerified ? Colors.green : AppColors.primary,
                        ),
                      ),
                      
                      const SizedBox(height: 8),
                      
                      // Subtitle
                      Text(
                        _isVerified 
                            ? "Your email has been verified successfully!"
                            : "We've sent a verification link to",
                        style: AppTextStyle.splashText.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textPrimary.withOpacity(0.7),
                        ),
                      ),
                      
                      if (!_isVerified) ...[
                        const SizedBox(height: 4),
                        
                        // Email
                        Text(
                          widget.email,
                          style: AppTextStyle.splashText.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                      
                      const SizedBox(height: 24),
                      
                      // Divider
                      Container(
                        width: 60,
                        height: 3,
                        margin: const EdgeInsets.only(bottom: 24),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      
                      if (!_isVerified) ...[
                        // Instructions
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildInstruction(
                              icon: Icons.email,
                              text: "Check your email inbox (and spam folder)",
                            ),
                            const SizedBox(height: 12),
                            _buildInstruction(
                              icon: Icons.link,
                              text: "Click the verification link in the email",
                            ),
                            const SizedBox(height: 12),
                            _buildInstruction(
                              icon: Icons.verified,
                              text: "Your email will be verified automatically",
                            ),
                          ],
                        ),
                        
                        const SizedBox(height: 32),
                        
                        // Check Verification Button
                        _isLoading
                            ? Center(child: CircularProgressIndicator())
                            : SizedBox(
                                width: double.infinity,
                                child: ElevatedButton.icon(
                                  onPressed: _manualCheckVerification,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.primary,
                                    foregroundColor: AppColors.secondary,
                                    padding: const EdgeInsets.symmetric(vertical: 16),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    elevation: 4,
                                  ),
                                  icon: Icon(Icons.refresh),
                                  label: Text(
                                    "Check Verification Status",
                                    style: AppTextStyle.splashText.copyWith(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.secondary,
                                    ),
                                  ),
                                ),
                              ),
                        
                        const SizedBox(height: 16),
                        
                        // Resend Email
                        _isResending
                            ? CircularProgressIndicator()
                            : TextButton(
                                onPressed: _countdown > 0 ? null : _resendVerification,
                                child: Text(
                                  _countdown > 0
                                      ? "Resend available in $_countdown seconds"
                                      : "Resend Verification Email",
                                  style: AppTextStyle.splashText.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: _countdown > 0
                                        ? AppColors.textPrimary.withOpacity(0.5)
                                        : AppColors.primary,
                                  ),
                                ),
                              ),
                        
                        const SizedBox(height: 20),
                      ] else ...[
                        // Verified Success Message
                        Column(
                          children: [
                            Icon(
                              Icons.check_circle,
                              size: 60,
                              color: Colors.green,
                            ),
                            const SizedBox(height: 20),
                            Text(
                              "Redirecting to login...",
                              style: AppTextStyle.splashText.copyWith(
                                fontSize: 16,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            const SizedBox(height: 20),
                            CircularProgressIndicator(),
                          ],
                        ),
                      ],
                      
                      const SizedBox(height: 20),
                      
                      // Note
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Text(
                              "Important:",
                              style: AppTextStyle.splashText.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primary,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              _isVerified
                                  ? "You can now login with your email and password."
                                  : "1. Check spam folder if you don't see the email\n2. Click the link to verify\n3. Return to this screen",
                              textAlign: TextAlign.center,
                              style: AppTextStyle.splashText.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppColors.textPrimary.withOpacity(0.8),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildInstruction({required IconData icon, required String text}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: AppColors.primary,
          size: 20,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: AppTextStyle.splashText.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.textPrimary,
            ),
          ),
        ),
      ],
    );
  }
}