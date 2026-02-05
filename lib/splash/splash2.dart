import 'package:flutter/material.dart';
import 'package:polychat/contants/text_style.dart';
import '../contants/color.dart';
import '../widgets/background_decoration.dart';

class SplashScreen2 extends StatelessWidget {
  const SplashScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: BackgroundDecoration(
        child: Stack(
          children: [
            // Bottom white container
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: screenHeight * 0.5, // Adjust height as needed
                padding: EdgeInsets.only(
                  top: screenHeight * 0.15, // Space for overlapping image
                  left: 32,
                  right: 32,
                  bottom: 40,
                ),
                decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 25,
                      spreadRadius: 0,
                      offset: const Offset(0, -10),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      "Hello, Let's Chat",
                      textAlign: TextAlign.center,
                      style: AppTextStyle.splashText.copyWith(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        height: 1.3,
                        color: AppColors.primary,
                      ),
                    ),
                    
                    const SizedBox(height: 12),
                    
                    // Divider
                    Container(
                      width: 50,
                      height: 3,
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                    
                    const SizedBox(height: 20),
                    
                    // Subtitle
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "Making lots of friends will make your life more colorful",
                        textAlign: TextAlign.center,
                        style: AppTextStyle.splashText.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 40),
                    
                    // Get Started button
                    SizedBox(
                      width: screenWidth * 0.7,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: AppColors.secondary,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 5,
                        ),
                        child: Text(
                          "Get Started",
                          style: AppTextStyle.splashText.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColors.secondary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Image positioned to overlap the container
            Positioned(
              top: screenHeight * 0.25, // Adjust to position image correctly
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 15,
                        spreadRadius: 2,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Image.asset(
                    'assets/images/chat-girl.png', // Your image here
                    height: screenHeight * 0.3,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}