
// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:polychat/screens/chat.dart';
import 'package:polychat/screens/home.dart';
import 'package:polychat/widgets/button_navbar.dart';
import '../contants/color.dart';
import '../contants/text_style.dart';
import '../widgets/background_decoration.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _currentIndex = 2; // Profile is selected in bottom nav

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Full background decoration
          Positioned.fill(
            child: BackgroundDecoration(
              child: Container(),
            ),
          ),
          // Main content
          Column(
            children: [
              // Top section with profile
              Stack(
                children: [
                  SizedBox(
                    height: 280,
                    child: Container(), // Empty container for top section
                  ),
                  SafeArea(
                    child: Column(
                      children: [
                        // App Bar
                        _buildAppBar(),
                        // Centered Profile Info
                        _buildCenteredProfileHeader(),
                      ],
                    ),
                  ),
                ],
              ),
              // Bottom white section - FULL HEIGHT WHITE BACKGROUND
              Expanded(
                child: Container(
                  color: Colors.white, // Solid white to cover black background
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        _buildAccountSection(),
                        _buildNotificationSection(),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          if (index == 0) {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
          } else if (index == 1) {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ChatPage()));
          }
        },
      ),
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Profile",
            style: AppTextStyle.splashText.copyWith(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          Container(
            width: 48, // Placeholder for spacing
          ),
        ],
      ),
    );
  }

  Widget _buildCenteredProfileHeader() {
    return Column(
      children: [
        // Profile Image
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(60),
            border: Border.all(color: Colors.white, width: 4),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 15,
                spreadRadius: 2,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: Image.asset(
              'assets/images/profile.png',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Center(
                child: Icon(
                  Icons.person,
                  color: AppColors.primary,
                  size: 50,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        // Name
        Text(
          "Stefani Wong",
          style: AppTextStyle.splashText.copyWith(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        // Location
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.location_on,
              color: Colors.white.withOpacity(0.8),
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              "Bahawepur, Pakistan",
              style: AppTextStyle.splashText.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white.withOpacity(0.9),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAccountSection() {
    final accountItems = [
      'Persupai Data',
      'Property List',
      'Blog',
    ];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: Text(
              "Account",
              style: AppTextStyle.splashText.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
              ),
            ),
          ),
          ...accountItems.map((item) => _buildMenuItem(item, false)),
        ],
      ),
    );
  }

  Widget _buildNotificationSection() {
    final notificationItems = [
      'Contact Us',
      'Privacy Policy',
      'Settings',
    ];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: Text(
              "Notification",
              style: AppTextStyle.splashText.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
              ),
            ),
          ),
          ...notificationItems.map((item) => _buildMenuItem(item, true)),
        ],
      ),
    );
  }

  Widget _buildMenuItem(String title, bool isNotificationSection) {
    IconData icon;
    
    // Assign icons based on menu item
    switch (title) {
      case 'Persupai Data':
        icon = Icons.data_usage;
        break;
      case 'Property List':
        icon = Icons.list;
        break;
      case 'Blog':
        icon = Icons.article;
        break;
      case 'Contact Us':
        icon = Icons.contact_mail;
        break;
      case 'Privacy Policy':
        icon = Icons.privacy_tip;
        break;
      case 'Settings':
        icon = Icons.settings;
        break;
      default:
        icon = Icons.arrow_forward_ios;
    }

    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: title == 'Settings' || title == 'Blog' 
            ? BorderSide.none 
            : BorderSide(
                color: Colors.grey.shade200,
                width: 1,
              ),
        ),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        leading: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: AppColors.primary,
            size: 24,
          ),
        ),
        title: Text(
          title,
          style: AppTextStyle.splashText.copyWith(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: AppColors.textPrimary.withOpacity(0.5),
          size: 18,
        ),
        onTap: () {
          // Handle menu item tap
          print('Tapped: $title');
        },
      ),
    );
  }
}