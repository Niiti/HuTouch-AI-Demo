import 'package:dating3/widgets/avatar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/constants.dart';
import '../models/user.dart';
import '../models/conversation.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/conversation_widget.dart';

class MessagesScreen extends StatefulWidget {
  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  int _selectedIndex = 4;

  void _onBottomNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<User> avatars = [
    User(imagePath: 'assets/Vanessa.png', name: 'Vanessa'),
    User(imagePath: 'assets/Halima.png', name: 'Halima'),
    User(imagePath: 'assets/Selena.png', name: 'Selena'),
    User(imagePath: 'assets/george.png', name: 'George'),
    User(imagePath: 'assets/brandon.png', name: 'Brandon'),
    User(imagePath: 'assets/Halima.png', name: 'Amina'),
    User(imagePath: 'assets/Selena.png', name: 'Savanna'),
  ];

  final List<Conversation> conversations = [
    Conversation(
      imagePath: 'assets/Vanessa.png',
      name: 'Alfredo Calzoni',
      message: 'What about that new jacket if I ...',
      time: '09:18',
      unread: true,
    ),
    Conversation(
      imagePath: 'assets/Selena.png',
      name: 'Clara Hazel',
      message: 'I know right ?',
      time: '12:44',
      unread: true,
    ),
    Conversation(
      imagePath: 'assets/brandon.png',
      name: 'Brandon Aminoff',
      message: 'I’ve already registered, can’t wai...',
      time: '08:06',
      unread: true,
    ),
    Conversation(
      imagePath: 'assets/Halima.png',
      name: 'Amina Mina',
      message: 'It will have two lines of heading ...',
      time: '09:32',
      unread: false,
    ),
    Conversation(
      imagePath: 'assets/Selena.png',
      name: 'Savanna Hall',
      message: 'It will have two lines of heading ...',
      time: '06:21',
      unread: false,
    ),
    Conversation(
      imagePath: 'assets/Halima.png',
      name: 'Sara Grif',
      message: 'Oh come on!! Is it really that gre...',
      time: '05:01',
      unread: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor, // Primary color for the background
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppSizes.appBarHeight),
        child: AppBar(
          backgroundColor: AppColors.primaryColor,
          elevation: 0,
          leadingWidth: 64,
          leading: Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(
                      color: Colors.white.withOpacity(0.08),
                    ),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
          centerTitle: true,
          title: Text(
            'Messages',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 24,
              fontFamily: AppFonts.primaryFont,
              height: 1.25,
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Center(
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        color: Colors.white.withOpacity(0.08),
                      ),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.more_vert,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Recent Matches Title
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Recent Matches',
              style: TextStyle(
                color: Colors.white,
                fontSize: 19,
                fontWeight: FontWeight.w600,
                fontFamily: AppFonts.primaryFont,
                height: 1.5,
              ),
            ),
          ),
          // Avatars List
          Container(
            height: 132,
            margin: EdgeInsets.only(top: 8.0),
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              scrollDirection: Axis.horizontal,
              itemCount: avatars.length,
              itemBuilder: (context, index) {
                return AvatarWidget(
                  user: avatars[index],
                );
              },
            ),
          ),
          // Conversations List
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: AppColors.backgroundColor, // Set background color for the conversation list only
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: conversations.length,
                  itemBuilder: (context, index) {
                    return ConversationWidget(
                      conversation: conversations[index],
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      // Bottom Navigation Bar with no background color
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 30),
        child: BottomNavBar(
          selectedIndex: _selectedIndex,
          onItemTapped: _onBottomNavTapped,
        ),
      ),
    );
  }
}