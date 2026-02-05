// import 'package:flutter/material.dart';
// import '../contants/color.dart';
// import '../contants/text_style.dart';
// import '../widgets/background_decoration.dart';

// class HomePage extends StatelessWidget {
//   final String userName = "Ben";
  
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BackgroundDecoration(
//         child: SafeArea(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Top section with Welcome and Profile
//               _buildTopSection(),
              
//               // Messages Received Card
//               _buildMessagesReceivedCard(),
              
//               // Contact List Section (expands to fill remaining space)
//               Expanded(
//                 child: _buildContactListSection(),
//               ),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Start new chat
//         },
//         backgroundColor: AppColors.primary,
//         child: Icon(Icons.add_comment, color: AppColors.secondary),
//       ),
//     );
//   }

//   Widget _buildTopSection() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "Welcome,",
//                 style: AppTextStyle.splashText.copyWith(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w500,
//                   color: AppColors.secondary, // White color for background
//                 ),
//               ),
//               Text(
//                 userName,
//                 style: AppTextStyle.splashText.copyWith(
//                   fontSize: 24,
//                   fontWeight: FontWeight.w700,
//                   color: AppColors.secondary, // White color for background
//                 ),
//               ),
//             ],
//           ),
          
//           Row(
//             children: [
//               // Notification Icon with white background
//               Container(
//                 width: 45,
//                 height: 45,
//                 decoration: BoxDecoration(
//                   color: AppColors.secondary,
//                   borderRadius: BorderRadius.circular(12),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.1),
//                       blurRadius: 5,
//                       spreadRadius: 1,
//                     ),
//                   ],
//                 ),
//                 child: Stack(
//                   alignment: Alignment.center,
//                   children: [
//                     Icon(
//                       Icons.notifications_outlined,
//                       color: AppColors.primary,
//                       size: 24,
//                     ),
//                     Positioned(
//                       right: 10,
//                       top: 10,
//                       child: Container(
//                         width: 8,
//                         height: 8,
//                         decoration: BoxDecoration(
//                           color: Colors.red,
//                           borderRadius: BorderRadius.circular(4),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
              
//               const SizedBox(width: 12),
              
//               // Profile Image with white background
//               Container(
//                 width: 45,
//                 height: 45,
//                 decoration: BoxDecoration(
//                   color: AppColors.secondary,
//                   borderRadius: BorderRadius.circular(12),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.1),
//                       blurRadius: 5,
//                       spreadRadius: 1,
//                     ),
//                   ],
//                 ),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(10),
//                   child: Image.asset(
//                     'assets/images/profile.png',
//                     fit: BoxFit.cover,
//                     errorBuilder: (context, error, stackTrace) => Center(
//                       child: Icon(
//                         Icons.person,
//                         color: AppColors.primary,
//                         size: 24,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildMessagesReceivedCard() {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
//       decoration: BoxDecoration(
//         color: AppColors.secondary,
//         borderRadius: BorderRadius.circular(15),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             blurRadius: 10,
//             spreadRadius: 2,
//             offset: const Offset(0, 3),
//           ),
//         ],
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "You Received",
//                 style: AppTextStyle.splashText.copyWith(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w500,
//                   color: AppColors.textPrimary.withOpacity(0.7),
//                 ),
//               ),
//               const SizedBox(height: 4),
//               Text(
//                 "48 Messages",
//                 style: AppTextStyle.splashText.copyWith(
//                   fontSize: 22,
//                   fontWeight: FontWeight.w700,
//                   color: AppColors.primary,
//                 ),
//               ),
//             ],
//           ),
//           Container(
//             width: 50,
//             height: 50,
//             decoration: BoxDecoration(
//               color: AppColors.primary,
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Center(
//               child: Icon(
//                 Icons.message,
//                 color: AppColors.secondary,
//                 size: 26,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildContactListSection() {
//     final contacts = [
//       {'name': 'Philip Franci', 'message': 'Hey, it\'s been a while since we\'ve...', 'time': '10:00 AM', 'hasUnread': true},
//       {'name': 'Alfredo Saris', 'message': 'Hello. Good Morning Ben!', 'time': '08:00 AM', 'hasUnread': false},
//       {'name': 'Jaylon Franci', 'message': 'Everything\'s good.', 'time': '09:00 AM', 'hasUnread': false},
//       {'name': 'Tatiana Dorwart', 'message': 'Okay Thanks!', 'time': '09:30 AM', 'hasUnread': true},
//       {'name': 'Terry Bergson', 'message': 'Same here!', 'time': '10:00 AM', 'hasUnread': false},
//       {'name': 'Sarah Johnson', 'message': 'See you tomorrow!', 'time': '11:00 AM', 'hasUnread': false},
//       {'name': 'Mike Wilson', 'message': 'Meeting at 2 PM', 'time': '12:00 PM', 'hasUnread': true},
//     ];

//     return Container(
//       width: double.infinity,
//       margin: const EdgeInsets.only(top: 12),
//       decoration: BoxDecoration(
//         color: AppColors.secondary,
//         borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(30),
//           topRight: Radius.circular(30),
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             blurRadius: 20,
//             spreadRadius: 5,
//             offset: const Offset(0, -5),
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           // Contact List Header
//           Padding(
//             padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 15),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "Contact List",
//                   style: AppTextStyle.splashText.copyWith(
//                     fontSize: 22,
//                     fontWeight: FontWeight.w700,
//                     color: AppColors.primary,
//                   ),
//                 ),
//                 Container(
//                   width: 40,
//                   height: 40,
//                   decoration: BoxDecoration(
//                     color: AppColors.primary.withOpacity(0.1),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: IconButton(
//                     onPressed: () {},
//                     icon: Icon(
//                       Icons.search,
//                       color: AppColors.primary,
//                       size: 22,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
          
//           // Divider
//           Container(
//             height: 1,
//             margin: const EdgeInsets.symmetric(horizontal: 20),
//             color: AppColors.primary.withOpacity(0.1),
//           ),
          
//           // Contact List
//           Expanded(
//             child: ListView.builder(
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//               itemCount: contacts.length,
//               itemBuilder: (context, index) {
//                 final contact = contacts[index];
//                 return Container(
//                   margin: const EdgeInsets.only(bottom: 12),
//                   child: Row(
//                     children: [
//                       // Avatar with initials
//                       Container(
//                         width: 48,
//                         height: 48,
//                         decoration: BoxDecoration(
//                           color: AppColors.primary.withOpacity(0.1),
//                           borderRadius: BorderRadius.circular(24),
//                         ),
//                         child: Center(
//                           child: Text(
//                             _getInitials(contact['name'] as String),
//                             style: AppTextStyle.splashText.copyWith(
//                               fontSize: 18,
//                               fontWeight: FontWeight.w700,
//                               color: AppColors.primary,
//                             ),
//                           ),
//                         ),
//                       ),
                      
//                       const SizedBox(width: 15),
                      
//                       // Contact Info
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Expanded(
//                                   child: Text(
//                                     contact['name'] as String,
//                                     style: AppTextStyle.splashText.copyWith(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w600,
//                                       color: AppColors.textPrimary,
//                                     ),
//                                     maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,
//                                   ),
//                                 ),
//                                 if (contact['hasUnread'] as bool)
//                                   Container(
//                                     width: 8,
//                                     height: 8,
//                                     margin: const EdgeInsets.only(left: 5),
//                                     decoration: BoxDecoration(
//                                       color: Colors.red,
//                                       borderRadius: BorderRadius.circular(4),
//                                     ),
//                                   ),
//                               ],
//                             ),
//                             const SizedBox(height: 4),
//                             Text(
//                               contact['message'] as String,
//                               style: AppTextStyle.splashText.copyWith(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w400,
//                                 color: AppColors.textPrimary.withOpacity(0.6),
//                               ),
//                               maxLines: 1,
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ],
//                         ),
//                       ),
                      
//                       const SizedBox(width: 15),
                      
//                       // Time
//                       Text(
//                         contact['time'] as String,
//                         style: AppTextStyle.splashText.copyWith(
//                           fontSize: 12,
//                           fontWeight: FontWeight.w500,
//                           color: AppColors.textPrimary.withOpacity(0.5),
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   String _getInitials(String name) {
//     List<String> nameParts = name.split(' ');
//     if (nameParts.length >= 2) {
//       return nameParts[0][0] + nameParts[1][0];
//     } else if (nameParts.isNotEmpty) {
//       return nameParts[0][0];
//     }
//     return '?';
//   }
// }

import 'package:flutter/material.dart';
import 'package:polychat/screens/chat.dart';
import 'package:polychat/screens/profile.dart';
import 'package:polychat/widgets/button_navbar.dart';
import '../contants/color.dart';
import '../contants/text_style.dart';
import '../widgets/background_decoration.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final String userName = "Ben";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundDecoration(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top section with Welcome and Profile
              _buildTopSection(),
              
              // Messages Received Card
              _buildMessagesReceivedCard(),
              
              // Contact List Section (expands to fill remaining space)
              Expanded(
                child: _buildContactListSection(),
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
          // Navigate to different pages based on index
          if (index == 1) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage()));
          } else if (index == 2) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Start new chat
        },
        backgroundColor: AppColors.primary,
        child: Icon(Icons.add_comment, color: AppColors.secondary),
      ),
    );
  }

  Widget _buildTopSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome,",
                style: AppTextStyle.splashText.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.secondary,
                ),
              ),
              Text(
                userName,
                style: AppTextStyle.splashText.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColors.secondary,
                ),
              ),
            ],
          ),
          
          Row(
            children: [
              // Notification Icon with white background
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Icon(
                      Icons.notifications_outlined,
                      color: AppColors.primary,
                      size: 24,
                    ),
                    Positioned(
                      right: 10,
                      top: 10,
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(width: 12),
              
              // Profile Image with white background
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/profile.png',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Center(
                      child: Icon(
                        Icons.person,
                        color: AppColors.primary,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMessagesReceivedCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "You Received",
                style: AppTextStyle.splashText.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textPrimary.withOpacity(0.7),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "48 Messages",
                style: AppTextStyle.splashText.copyWith(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Icon(
                Icons.message,
                color: AppColors.secondary,
                size: 26,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactListSection() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 12),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            spreadRadius: 5,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Center text
          Text(
            "New Message",
            style: AppTextStyle.splashText.copyWith(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Start a new conversation",
            style: AppTextStyle.splashText.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.textPrimary.withOpacity(0.6),
            ),
          ),
          const SizedBox(height: 30),
          
          // Floating Action Button alternative
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: Icon(
                Icons.add,
                color: AppColors.secondary,
                size: 30,
              ),
            ),
          ),
        ],
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

