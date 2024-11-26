import 'package:dating3/screens/discovery_screen.dart';
import 'package:dating3/screens/matches_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/story_widget.dart';
import '../widgets/tab_button.dart';
import '../widgets/post_widget.dart';
import '../widgets/bottom_nav_bar.dart';
import '../models/story.dart';
import '../models/post.dart';
import '../constants/constants.dart';
import 'add_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onBottomNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  bool _isMakeFriendsSelected = true;

  List<Story> stories = [
    Story(
      imagePath: 'assets/My Story.png',
      label: 'My Story',
      isMyStory: true,
    ),
    Story(
      imagePath: 'assets/Selena.png',
      label: 'Selena',
    ),
    Story(
      imagePath: 'assets/Vanessa.png',
      label: 'Clara',
    ),
    Story(
      imagePath: 'assets/Fabian.png',
      label: 'Fabian',
    ),
    Story(
      imagePath: 'assets/george.png',
      label: 'George',
    ),
  ];

  List<Post> posts = [
    Post(
      imagePath: 'assets/Banner.png',
      categoryIcon: 'assets/tree_icon.png',
      categoryText: 'Travel',
      postText:
          'If you could live anywhere in the world, where would you pick?',
      userName: 'Miranda Kehlani',
      userLocation: 'STUTTGART',
      userImage: 'assets/User_avatar.png',
    ),
    Post(
      imagePath: 'assets/boots.png',
      categoryIcon: 'assets/people.png',
      categoryText: 'Football',
      postText: 'Who do you think will win Euro 2020?',
      userName: 'Brandon Aminoff',
      userLocation: 'Hamburg',
      userImage: 'assets/Halima.png',
    ),
  ];

  void _onSearchPressed() {
    // TODO: Handle search action
  }

  void _onNotificationPressed() {
    // TODO: Handle notification action
  }

  void _onProfilePressed() {
    // TODO: Handle profile action
  }
  void _onTabSelected(bool isMakeFriends) {
    setState(() {
      _isMakeFriendsSelected = isMakeFriends;
      // TODO: Switch between different content
    });
  }

  void _onLikePressed(int index) {
    // TODO: Handle like action
  }

  void _onCommentPressed(int index) {
    // TODO: Handle comment action
  }

  void _onMorePressed(int index) {
    // TODO: Handle more options
  }

  void _onStoryPressed(int index) {
    // TODO: Handle viewing or adding stories
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(48),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Padding(
            padding: EdgeInsets.only(left: 16),
            child: Center(
              child: Text(
                'Friendzy',
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Hellix',
                  height: 38.4 / 28,
                ),
              ),
            ),
          ),
          leadingWidth: 200,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: kPrimaryColor,
                        width: 1,
                      ),
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.notifications_none,
                        color: kPrimaryColor,
                        size: 24,
                      ),
                      onPressed: () {
                        // TODO: Handle notification icon press
                      },
                    ),
                  ),
                  Positioned(
                    top: 12,
                    right: 12,
                    child: CircleAvatar(
                      radius: 4,
                      backgroundColor: kAccentColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Story Section
          Container(
            padding: EdgeInsets.only(top: 16),
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: stories.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) return SizedBox(width: 16);
                final story = stories[index - 1];
                return GestureDetector(
                  onTap: () => _onStoryPressed(index - 1),
                  child: StoryWidget(
                    story: story,
                  ),
                );
              },
            ),
          ),
          // Tabs
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              height: 44,
              decoration: BoxDecoration(
                color: kTabBackgroundColor,
                borderRadius: BorderRadius.circular(22),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _onTabSelected(true),
                      child: TabButton(
                        text: 'Make Friends',
                        isSelected: _isMakeFriendsSelected,
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _onTabSelected(false),
                      child: TabButton(
                        text: 'Search Partners',
                        isSelected: !_isMakeFriendsSelected,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          // Post Section
          Expanded(
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return PostWidget(
                  post: post,
                  onLikePressed: () => _onLikePressed(index),
                  onCommentPressed: () => _onCommentPressed(index),
                  onMorePressed: () => _onMorePressed(index),
                );
              },
            ),
          ),
        ],
      ),
      //   bottomNavigationBar: BottomNavBar(
      //   selectedIndex: _selectedIndex,
      //   onItemTapped: _onBottomNavTapped,
      // ),
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
