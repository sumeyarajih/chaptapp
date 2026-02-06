import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Email Signup - DO NOT SIGN OUT immediately
  Future<User?> signUpWithEmail(
      String email, String password, String displayName) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      
      // Update display name
      await result.user?.updateDisplayName(displayName);
      
      // Send verification email (FREE - No cost)
      await result.user?.sendEmailVerification();
      
      print('✅ Verification email sent to: $email');
      
      // IMPORTANT: Do NOT sign out here!
      // Keep user signed in to allow immediate verification check
      return result.user;
    } catch (e) {
      if (kDebugMode) {
        print("Signup Error: $e");
      }
      rethrow;
    }
  }

  // Check if email is verified
  Future<bool> isEmailVerified() async {
    User? user = _auth.currentUser;
    if (user != null) {
      // Reload user to get latest verification status
      await user.reload();
      user = _auth.currentUser;
      return user?.emailVerified ?? false;
    }
    return false;
  }

  // Login with email - Check verification status
  Future<User?> loginWithEmail(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      
      // Check if email is verified
      if (!(result.user?.emailVerified ?? false)) {
        // Don't sign out, let user stay on verification screen
        throw FirebaseAuthException(
          code: 'email-not-verified',
          message: 'Please verify your email first. Check your inbox.',
        );
      }
      
      return result.user;
    } catch (e) {
      if (kDebugMode) {
        print("Login Error: $e");
      }
      rethrow;
    }
  }

  // Forgot password - send reset email (FREE)
  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      print('✅ Password reset email sent to: $email');
    } catch (e) {
      if (kDebugMode) {
        print("Reset Password Error: $e");
      }
      rethrow;
    }
  }

  // Resend verification email - FIXED VERSION
  Future<void> resendVerificationEmail() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        await user.sendEmailVerification();
        print('✅ Verification email resent to: ${user.email}');
      } else {
        throw Exception("No user logged in");
      }
    } catch (e) {
      if (kDebugMode) {
        print("Resend Verification Error: $e");
      }
      rethrow;
    }
  }

  // Force sign out (for testing)
  Future<void> signOut() async {
    await _auth.signOut();
    print('✅ User signed out');
  }

  // Get current user
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  // Check verification status periodically
  Future<bool> checkVerificationStatus() async {
    try {
      return await isEmailVerified();
    } catch (e) {
      return false;
    }
  }

  // Auth state changes
  Stream<User?> get authStateChanges {
    return _auth.authStateChanges();
  }
}