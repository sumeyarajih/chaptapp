
import 'package:flutter/material.dart';
import 'package:polychat/screens/profile.dart';
import 'package:polychat/screens/inbox.dart'; // Import the inbox page
import 'package:polychat/widgets/button_navbar.dart';
import '../contants/color.dart';
import '../contants/text_style.dart';
import '../widgets/background_decoration.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();
  int _currentIndex = 1; // Chat is selected in bottom nav
  int _selectedTab = 1; // Default to "All" tab

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedTab = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundDecoration(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // App Bar
              _buildAppBar(),
              
              // Search Bar
              _buildSearchBar(),
              
              // Tab Container (Main container touching edges)
              Expanded(
                child: _buildMainContainer(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          if (index == 0) {
            Navigator.pop(context);
          } else if (index == 2) {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfilePage()));
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
            "Messages",
            style: AppTextStyle.splashText.copyWith(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: AppColors.secondary,
            ),
          ),
            IconButton(
            onPressed: () {},
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.more_vert,
                color: AppColors.secondary,
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: AppColors.primary.withOpacity(0.5),
            size: 22,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search messages...",
                hintStyle: TextStyle(
                  color: AppColors.textPrimary.withOpacity(0.5),
                  fontSize: 16,
                ),
                border: InputBorder.none,
              ),
              style: AppTextStyle.splashText.copyWith(
                fontSize: 16,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              _searchController.clear();
            },
            icon: Icon(
              Icons.clear,
              color: AppColors.primary.withOpacity(0.5),
              size: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainContainer() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 20,
            spreadRadius: 5,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        children: [
          // Tabs inside the main container
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 15),
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: _buildTabItem(0, "Contacts"),
                  ),
                  Container(
                    width: 1,
                    height: 25,
                    color: AppColors.primary.withOpacity(0.2),
                  ),
                  Expanded(
                    child: _buildTabItem(1, "All"),
                  ),
                  Container(
                    width: 1,
                    height: 25,
                    color: AppColors.primary.withOpacity(0.2),
                  ),
                  Expanded(
                    child: _buildTabItem(2, "Missed"),
                  ),
                ],
              ),
            ),
          ),
          
          // Tab Content
          Expanded(
            child: IndexedStack(
              index: _selectedTab,
              children: [
                _buildFilterContactsTab(),
                _buildAllMessagesTab(),
                _buildMissedMessagesTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabItem(int index, String label) {
    bool isSelected = _selectedTab == index;
    
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTab = index;
          _tabController.animateTo(index);
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.transparent,
          borderRadius: _getTabBorderRadius(index),
        ),
        child: Center(
          child: Text(
            label,
            style: AppTextStyle.splashText.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: isSelected ? AppColors.secondary : AppColors.primary,
            ),
          ),
        ),
      ),
    );
  }

  BorderRadius _getTabBorderRadius(int index) {
    if (index == 0) {
      return const BorderRadius.only(
        topLeft: Radius.circular(12),
        bottomLeft: Radius.circular(12),
      );
    } else if (index == 2) {
      return const BorderRadius.only(
        topRight: Radius.circular(12),
        bottomRight: Radius.circular(12),
      );
    }
    return BorderRadius.zero;
  }

  Widget _buildFilterContactsTab() {
    final contacts = [
      {'name': 'Philip Franci', 'lastSeen': 'Online', 'hasStory': true},
      {'name': 'Alfredo Saris', 'lastSeen': '2 min ago', 'hasStory': false},
      {'name': 'Jaylon Franci', 'lastSeen': 'Online', 'hasStory': true},
      {'name': 'Tatiana Dorwart', 'lastSeen': '1 hour ago', 'hasStory': false},
      {'name': 'Terry Bergson', 'lastSeen': 'Yesterday', 'hasStory': true},
      {'name': 'Sarah Johnson', 'lastSeen': '5 min ago', 'hasStory': false},
      {'name': 'Michael Brown', 'lastSeen': 'Just now', 'hasStory': true},
      {'name': 'Emma Wilson', 'lastSeen': '30 min ago', 'hasStory': false},
    ];

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      itemCount: contacts.length,
      itemBuilder: (context, index) {
        final contact = contacts[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => InboxPage(
                  contactName: contact['name'] as String,
                  contactInitials: _getInitials(contact['name'] as String),
                ),
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 4,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Row(
              children: [
                Stack(
                  children: [
                    Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(22.5),
                      ),
                      child: Center(
                        child: Text(
                          _getInitials(contact['name'] as String),
                          style: AppTextStyle.splashText.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ),
                    if (contact['hasStory'] as bool)
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: AppColors.secondary, width: 2),
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        contact['name'] as String,
                        style: AppTextStyle.splashText.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        contact['lastSeen'] as String,
                        style: AppTextStyle.splashText.copyWith(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textPrimary.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InboxPage(
                          contactName: contact['name'] as String,
                          contactInitials: _getInitials(contact['name'] as String),
                        ),
                      ),
                    );
                  },
                  icon: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.chat_bubble_outline,
                      color: AppColors.primary,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildAllMessagesTab() {
    final messages = [
      {'name': 'Philip Franci', 'message': 'Hey, how are you?', 'time': '10:00 AM', 'unread': 2},
      {'name': 'Alfredo Saris', 'message': 'Meeting at 3 PM', 'time': '09:30 AM', 'unread': 0},
      {'name': 'Jaylon Franci', 'message': 'Thanks for your help!', 'time': 'Yesterday', 'unread': 1},
      {'name': 'Tatiana Dorwart', 'message': 'Check this out', 'time': '2 days ago', 'unread': 0},
      {'name': 'Terry Bergson', 'message': 'Same here!', 'time': '3 days ago', 'unread': 3},
      {'name': 'Sarah Johnson', 'message': 'See you tomorrow', 'time': '10:30 AM', 'unread': 0},
      {'name': 'Michael Brown', 'message': 'Can we reschedule?', 'time': '11:00 AM', 'unread': 1},
      {'name': 'Emma Wilson', 'message': 'Great work on the project!', 'time': 'Yesterday', 'unread': 0},
    ];

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => InboxPage(
                  contactName: message['name'] as String,
                  contactInitials: _getInitials(message['name'] as String),
                ),
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 4,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(22.5),
                  ),
                  child: Center(
                    child: Text(
                      _getInitials(message['name'] as String),
                      style: AppTextStyle.splashText.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            message['name'] as String,
                            style: AppTextStyle.splashText.copyWith(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          Text(
                            message['time'] as String,
                            style: AppTextStyle.splashText.copyWith(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textPrimary.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 3),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              message['message'] as String,
                              style: AppTextStyle.splashText.copyWith(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: AppColors.textPrimary.withOpacity(0.6),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          if ((message['unread'] as int) > 0)
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                message['unread'].toString(),
                                style: TextStyle(
                                  color: AppColors.secondary,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
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
        );
      },
    );
  }

  Widget _buildMissedMessagesTab() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Icon(
                Icons.notifications_off,
                color: AppColors.primary,
                size: 50,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "No Missed Messages",
              style: AppTextStyle.splashText.copyWith(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "You're all caught up with your conversations!",
              textAlign: TextAlign.center,
              style: AppTextStyle.splashText.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.textPrimary.withOpacity(0.6),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getInitials(String name) {
    List<String> nameParts = name.split(' ');
    if (nameParts.length >= 2) {
      return nameParts[0][0] + nameParts[1][0];
    } else if (nameParts.isNotEmpty) {
      return nameParts[0][0];
    }
    return '?';
  }
}