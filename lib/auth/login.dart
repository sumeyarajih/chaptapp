// import 'package:flutter/material.dart';
// import 'package:polychat/auth/forgotpass.dart';
// import 'package:polychat/contants/icons.dart';
// import 'package:polychat/contants/text_style.dart';
// import 'package:polychat/screens/home.dart';
// import '../contants/color.dart';
// import '../widgets/background_decoration.dart';
// import './signup.dart';

// class LoginScreen extends StatelessWidget {
//   LoginScreen({Key? key}) : super(key: key);

//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     final bool isSmallScreen = MediaQuery.of(context).size.width < 400;

//     return Scaffold(
//       body: BackgroundDecoration(
//         child: Center(
//           child: SingleChildScrollView(
//             child: Container(
//               width: MediaQuery.of(context).size.width * 0.9,
//               margin: const EdgeInsets.symmetric(vertical: 20),
//               padding: const EdgeInsets.all(24),
//               decoration: BoxDecoration(
//                 color: AppColors.secondary,
//                 borderRadius: BorderRadius.circular(20),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.15),
//                     blurRadius: 20,
//                     spreadRadius: 5,
//                     offset: const Offset(0, 10),
//                   ),
//                 ],
//               ),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Title Section
//                   Center(
//                     child: Column(
//                       children: [
//                         Text(
//                           "Login",
//                           style: AppTextStyle.splashText.copyWith(
//                             fontSize: 28,
//                             fontWeight: FontWeight.w700,
//                             color: AppColors.primary,
//                           ),
//                         ),
//                         const SizedBox(height: 8),
//                         Text(
//                           "Welcome back,",
//                           style: AppTextStyle.splashText.copyWith(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w500,
//                             color: AppColors.textPrimary,
//                           ),
//                         ),
//                         const SizedBox(height: 4),
//                         Text(
//                           "Sign in to continue exploring your message",
//                           style: AppTextStyle.splashText.copyWith(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w400,
//                             color: AppColors.textPrimary.withOpacity(0.7),
//                           ),
//                         ),
//                         const SizedBox(height: 24),
//                       ],
//                     ),
//                   ),

//                   // Divider
//                   Center(
//                     child: Container(
//                       width: 60,
//                       height: 3,
//                       margin: const EdgeInsets.only(bottom: 24),
//                       decoration: BoxDecoration(
//                         color: AppColors.primary.withOpacity(0.5),
//                         borderRadius: BorderRadius.circular(2),
//                       ),
//                     ),
//                   ),

//                   // Form
//                   Form(
//                     key: _formKey,
//                     child: Column(
//                       children: [
//                         // Email/Username
//                         _buildTextField(
//                           label: "Email or Username",
//                           hintText: "Enter your email or username",
//                           controller: _emailController,
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter email or username';
//                             }
//                             return null;
//                           },
//                         ),
                        
//                         const SizedBox(height: 16),
                        
//                         // Password
//                         _buildPasswordField(
//                           label: "Password",
//                           hintText: "Enter your password",
//                           controller: _passwordController,
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter password';
//                             }
//                             if (value.length < 6) {
//                               return 'Password must be at least 6 characters';
//                             }
//                             return null;
//                           },
//                         ),
                        
//                         const SizedBox(height: 16),
                        
//                         // Forgot Password
//                         Align(
//                           alignment: Alignment.centerRight,
//                           child: TextButton(
//                             onPressed: () {
//                               Navigator.of(context).push(
//                                 PageRouteBuilder(
//                                   pageBuilder: (context, animation, secondaryAnimation) => ForgotPasswordScreen(onSendOtp: () {}),
//                                   transitionsBuilder: (context, animation, secondaryAnimation, child) {
//                                     const begin = Offset(1.0, 0.0);
//                                     const end = Offset.zero;
//                                     const curve = Curves.ease;
                                    
//                                     var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
//                                     var offsetAnimation = animation.drive(tween);
                                    
//                                     return SlideTransition(
//                                       position: offsetAnimation,
//                                       child: child,
//                                     );
//                                   },
//                                 ),
//                               );
//                             },
//                             child: Text(
//                               "Forgot password?",
//                               style: AppTextStyle.splashText.copyWith(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w500,
//                                 color: AppColors.primary,
//                               ),
//                             ),
//                           ),
//                         ),
                        
//                         const SizedBox(height: 24),
                        
//                         // Sign In Button
//                         SizedBox(
//                           width: double.infinity,
//                           child: ElevatedButton(
//                             onPressed: () {
//                               Navigator.pushReplacement(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (_) => HomePage(),
//                                 ),
//                               );
//                             },
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: AppColors.primary,
//                               foregroundColor: AppColors.secondary,
//                               padding: const EdgeInsets.symmetric(vertical: 16),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(12),
//                               ),
//                               elevation: 4,
//                             ),
//                             child: Text(
//                               "Sign In",
//                               style: AppTextStyle.splashText.copyWith(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.w600,
//                                 color: AppColors.secondary,
//                               ),
//                             ),
//                           ),
//                         ),
                        
//                         const SizedBox(height: 30),
                        
//                         // Divider with "OR"
//                         Row(
//                           children: [
//                             Expanded(
//                               child: Divider(
//                                 color: AppColors.textPrimary.withOpacity(0.3),
//                                 thickness: 1,
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.symmetric(horizontal: 16),
//                               child: Text(
//                                 "OR",
//                                 style: AppTextStyle.splashText.copyWith(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w500,
//                                   color: AppColors.textPrimary.withOpacity(0.7),
//                                 ),
//                               ),
//                             ),
//                             Expanded(
//                               child: Divider(
//                                 color: AppColors.textPrimary.withOpacity(0.3),
//                                 thickness: 1,
//                               ),
//                             ),
//                           ],
//                         ),
                        
//                         const SizedBox(height: 30),
                        
//                         // Social Login Section
//                         Column(
//                           children: [
//                             Text(
//                               "Continue with",
//                               style: AppTextStyle.splashText.copyWith(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w500,
//                                 color: AppColors.textPrimary.withOpacity(0.8),
//                               ),
//                             ),
                            
//                             const SizedBox(height: 20),
                            
//                             // Social Icons Row
//                             SocialIcons.socialLoginRow(
//                               context: context,
//                               onGooglePressed: () {
//                                 print("Google login pressed");
//                                 // Add Google authentication logic
//                               },
//                               onFacebookPressed: () {
//                                 print("Facebook login pressed");
//                                 // Add Facebook authentication logic
//                               },
//                               onInstagramPressed: () {
//                                 print("Instagram login pressed");
//                                 // Add Instagram authentication logic
//                               },
//                               isSmallScreen: isSmallScreen,
//                             ),
                            
//                             const SizedBox(height: 20),
                            
//                             // Alternative method using individual icons
//                             /*
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 _socialIcon(
//                                   FontAwesomeIcons.google,
//                                   const Color(0xFFDB4437),
//                                   isSmallScreen ? 40 : 50,
//                                   isSmallScreen ? 16 : 20,
//                                   () {
//                                     print("Google login");
//                                   },
//                                 ),
//                                 SizedBox(width: isSmallScreen ? 15 : 20),
//                                 _socialIcon(
//                                   FontAwesomeIcons.facebookF,
//                                   const Color(0xFF1877F2),
//                                   isSmallScreen ? 40 : 50,
//                                   isSmallScreen ? 16 : 20,
//                                   () {
//                                     print("Facebook login");
//                                   },
//                                 ),
//                                 SizedBox(width: isSmallScreen ? 15 : 20),
//                                 _socialIcon(
//                                   FontAwesomeIcons.instagram,
//                                   const Color(0xFFE1306C),
//                                   isSmallScreen ? 40 : 50,
//                                   isSmallScreen ? 16 : 20,
//                                   () {
//                                     print("Instagram login");
//                                   },
//                                 ),
//                               ],
//                             ),
//                             */
//                           ],
//                         ),
                        
//                         const SizedBox(height: 30),
                        
//                         // Create Account
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               "Don't have an account? ",
//                               style: AppTextStyle.splashText.copyWith(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w400,
//                                 color: AppColors.textPrimary,
//                               ),
//                             ),
//                             TextButton(
//                               onPressed: () {
//                                 Navigator.of(context).push(
//                                   MaterialPageRoute(
//                                     builder: (context) => SignupScreen(),
//                                   ),
//                                 );
//                               },
//                               child: Text(
//                                 "Create account",
//                                 style: AppTextStyle.splashText.copyWith(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w600,
//                                   color: AppColors.primary,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // Helper method for social icons (alternative to SocialIcons class)

//   Widget _buildTextField({
//     required String label,
//     required String hintText,
//     required TextEditingController controller,
//     required FormFieldValidator<String> validator,
//     bool obscureText = false,
//     TextInputType keyboardType = TextInputType.text,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: AppTextStyle.splashText.copyWith(
//             fontSize: 14,
//             fontWeight: FontWeight.w500,
//             color: AppColors.textPrimary,
//           ),
//         ),
//         const SizedBox(height: 8),
//         TextFormField(
//           controller: controller,
//           obscureText: obscureText,
//           keyboardType: keyboardType,
//           validator: validator,
//           style: AppTextStyle.splashText.copyWith(
//             fontSize: 16,
//             color: AppColors.textPrimary,
//           ),
//           decoration: InputDecoration(
//             hintText: hintText,
//             hintStyle: TextStyle(color: AppColors.textPrimary.withOpacity(0.5)),
//             filled: true,
//             fillColor: Colors.white,
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: BorderSide(color: AppColors.primary.withOpacity(0.3)),
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: BorderSide(color: AppColors.primary.withOpacity(0.3)),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: BorderSide(color: AppColors.primary, width: 2),
//             ),
//             contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildPasswordField({
//     required String label,
//     required String hintText,
//     required TextEditingController controller,
//     required FormFieldValidator<String> validator,
//   }) {
//     ValueNotifier<bool> obscureText = ValueNotifier<bool>(true);
    
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: AppTextStyle.splashText.copyWith(
//             fontSize: 14,
//             fontWeight: FontWeight.w500,
//             color: AppColors.textPrimary,
//           ),
//         ),
//         const SizedBox(height: 8),
//         ValueListenableBuilder<bool>(
//           valueListenable: obscureText,
//           builder: (context, isObscure, child) {
//             return TextFormField(
//               controller: controller,
//               obscureText: isObscure,
//               validator: validator,
//               style: AppTextStyle.splashText.copyWith(
//                 fontSize: 16,
//                 color: AppColors.textPrimary,
//               ),
//               decoration: InputDecoration(
//                 hintText: hintText,
//                 hintStyle: TextStyle(color: AppColors.textPrimary.withOpacity(0.5)),
//                 filled: true,
//                 fillColor: Colors.white,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                   borderSide: BorderSide(color: AppColors.primary.withOpacity(0.3)),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                   borderSide: BorderSide(color: AppColors.primary.withOpacity(0.3)),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                   borderSide: BorderSide(color: AppColors.primary, width: 2),
//                 ),
//                 contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
//                 suffixIcon: IconButton(
//                   icon: Icon(
//                     isObscure ? Icons.visibility_off : Icons.visibility,
//                     color: AppColors.primary.withOpacity(0.6),
//                   ),
//                   onPressed: () {
//                     obscureText.value = !isObscure;
//                   },
//                 ),
//               ),
//             );
//           },
//         ),
//       ],
//     );
//   }
// }

/////////////
///
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:polychat/auth/email_verification_screen.dart';
import 'package:polychat/auth/forgotpass.dart';
import 'package:polychat/auth/signup.dart';
import 'package:polychat/contants/text_style.dart';
import 'package:polychat/services/auth_service.dart';
import '../contants/color.dart';
import '../widgets/background_decoration.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  
  final AuthService _authService = AuthService();
  bool _isLoading = false;
  bool _obscurePassword = true;

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
                onPressed: () => Navigator.pop(context),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title Section
                      Center(
                        child: Column(
                          children: [
                            Text(
                              "Welcome Back",
                              style: AppTextStyle.splashText.copyWith(
                                fontSize: 28,
                                fontWeight: FontWeight.w700,
                                color: AppColors.primary,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Sign in to continue",
                              style: AppTextStyle.splashText.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.textPrimary.withOpacity(0.7),
                              ),
                            ),
                            const SizedBox(height: 24),
                          ],
                        ),
                      ),

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

                      // Form
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            // Email
                            _buildTextField(
                              label: "Email",
                              hintText: "Enter your email",
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                }
                                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                            ),
                            
                            const SizedBox(height: 16),
                            
                            // Password
                            _buildPasswordField(
                              label: "Password",
                              hintText: "Enter your password",
                              controller: _passwordController,
                              obscureText: _obscurePassword,
                              toggleObscure: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                return null;
                              },
                            ),
                            
                            const SizedBox(height: 8),
                            
                            // Forgot Password
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => ForgotPasswordScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Forgot Password?",
                                  style: AppTextStyle.splashText.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primary,
                                  ),
                                ),
                              ),
                            ),
                            
                            const SizedBox(height: 24),
                            
                            // Sign In Button
                            _isLoading
                                ? Center(child: CircularProgressIndicator())
                                : SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: _login,
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.primary,
                                        foregroundColor: AppColors.secondary,
                                        padding: const EdgeInsets.symmetric(vertical: 16),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        elevation: 4,
                                      ),
                                      child: Text(
                                        "Sign In",
                                        style: AppTextStyle.splashText.copyWith(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.secondary,
                                        ),
                                      ),
                                    ),
                                  ),
                            
                            const SizedBox(height: 20),
                            
                            // Don't have account
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't have an account? ",
                                  style: AppTextStyle.splashText.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => SignupScreen(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "Sign Up",
                                    style: AppTextStyle.splashText.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ),
                              ],
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

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      
      try {
        await _authService.loginWithEmail(
          _emailController.text.trim(),
          _passwordController.text,
        );
        
        // Login successful - navigate to home screen
        // Replace with your home screen navigation
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login successful!')),
        );
        
        // Navigate to home screen
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen()));
        
      } on FirebaseAuthException catch (e) {
        String errorMessage = 'Login failed';
        
        if (e.code == 'email-not-verified') {
          errorMessage = 'Email not verified. Please check your inbox.';
          
          // Navigate to verification screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => EmailVerificationScreen(
                email: _emailController.text.trim(),
                // password: _passwordController.text,
                fullName: '',
              ),
            ),
          );
        } else if (e.code == 'user-not-found') {
          errorMessage = 'No account found with this email';
        } else if (e.code == 'wrong-password') {
          errorMessage = 'Incorrect password';
        } else if (e.code == 'too-many-requests') {
          errorMessage = 'Too many attempts. Try again later';
        } else if (e.code == 'user-disabled') {
          errorMessage = 'Account has been disabled';
        }
        
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage)),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('An error occurred: $e')),
        );
      } finally {
        setState(() => _isLoading = false);
      }
    }
  }

  Widget _buildTextField({
    required String label,
    required String hintText,
    required TextEditingController controller,
    required FormFieldValidator<String> validator,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyle.splashText.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          validator: validator,
          style: AppTextStyle.splashText.copyWith(
            fontSize: 16,
            color: AppColors.textPrimary,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: AppColors.textPrimary.withOpacity(0.5)),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.primary.withOpacity(0.3)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.primary.withOpacity(0.3)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.primary, width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordField({
    required String label,
    required String hintText,
    required TextEditingController controller,
    required bool obscureText,
    required VoidCallback toggleObscure,
    required FormFieldValidator<String> validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyle.splashText.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          validator: validator,
          style: AppTextStyle.splashText.copyWith(
            fontSize: 16,
            color: AppColors.textPrimary,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: AppColors.textPrimary.withOpacity(0.5)),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.primary.withOpacity(0.3)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.primary.withOpacity(0.3)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.primary, width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            suffixIcon: IconButton(
              icon: Icon(
                obscureText ? Icons.visibility_off : Icons.visibility,
                color: AppColors.primary.withOpacity(0.6),
              ),
              onPressed: toggleObscure,
            ),
          ),
        ),
      ],
    );
  }
}