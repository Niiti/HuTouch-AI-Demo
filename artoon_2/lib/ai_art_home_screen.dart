import 'package:flutter/material.dart';
import 'dart:ui';

class AIArtHomeScreen extends StatefulWidget {
  @override
  _AIArtHomeScreenState createState() => _AIArtHomeScreenState();
}

class _AIArtHomeScreenState extends State<AIArtHomeScreen> {
  int _selectedTabIndex = 0;
  List<String> trendingAvatars = [
    'assets/images/trending_avatar_1.jpg',
    'assets/images/trending_avatar_2.jpg',
  ];

  void _onTabSelected(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  void _removeAvatar(int index) {
    setState(() {
      trendingAvatars.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Trending Avatars"),
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 19,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.white,
              height: 190,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: List.generate(trendingAvatars.length, (index) {
                    return TrendingAvatarCard(
                      key: Key(trendingAvatars[index]),
                      avatarImg: trendingAvatars[index],
                      nextAvatarImg: index < trendingAvatars.length - 1
                          ? trendingAvatars[index + 1]
                          : trendingAvatars[0],
                      label: 'AUTUMN 3D',
                      onTap: () {
                        print("Try Now for AUTUMN 3D clicked");
                      },
                      onDismissed: () => _removeAvatar(index),
                      width: 310, 
                      height: 200, 
                    );
                  }),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                'assets/images/playnwin.png',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: DefaultTabController(
                length: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TabBar(
                      onTap: (index) {
                        _onTabSelected(index);
                        print("Tab $index selected");
                      },
                      isScrollable: true,
                      labelColor: Colors.blue,
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        Tab(text: 'TRENDING'),
                        Tab(text: 'FASHION'),
                        Tab(text: 'ANIME'),
                        Tab(text: 'DIGITAL ART'),
                      ],
                    ),
                    Container(
                      height: 300,
                      child: TabBarView(
                        children: [
                          AvatarGrid(),
                          AvatarGrid(),
                          AvatarGrid(),
                          AvatarGrid(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedTabIndex,
        onTabSelected: _onTabSelected,
      ),
    );
  }
}

class TrendingAvatarCard extends StatelessWidget {
  final String avatarImg;
  final String nextAvatarImg;
  final String label;
  final VoidCallback onTap;
  final VoidCallback onDismissed;
  final double width;
  final double height;

  const TrendingAvatarCard({
    required Key key,
    required this.avatarImg,
    required this.nextAvatarImg,
    required this.label,
    required this.onTap,
    required this.onDismissed,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Dismissible(
        key: key!,
        onDismissed: (direction) {
          onDismissed();
        },
        background: Container(
          // color: Color.fromARGB(119, 130, 130, 130),
          alignment: Alignment.centerRight,
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Icon(Icons.delete, color: Colors.white),
          ),
        ),
        secondaryBackground: Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Image.asset(
              nextAvatarImg,
              fit: BoxFit.cover,
              width: 310,
              height: 150,
            ),
          ),
        ),
        child: Card(
          elevation: 3,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          clipBehavior: Clip.antiAlias,
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Image.asset(
                avatarImg,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
              Positioned(
                bottom: 10,
                left: 10,
                child: Text(
                  label,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: ElevatedButton(
                  onPressed: onTap,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(1, 129, 253, 1), // Set the background color of the button
                  ),
                  child: Text(
                    'Try Now',
                    style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Proxima Nova',
                    ),
                  ),
                  ),
                ),
              ],
          ),
        ),
      ),
    );
  }
}

class AvatarGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
      ),
      itemCount: 2,
      itemBuilder: (context, index) {
        return AspectRatio(
          aspectRatio: 3 / 5,
          child: Card(
            elevation: 3,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            clipBehavior: Clip.antiAlias,
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Image.asset(
                  'assets/images/grid_avatar_${index + 1}.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Text(
                    'AUTUMN 3D',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabSelected;

  const BottomNavBar({
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: (index) {
        onTabSelected(index);
        print("bottom $index selected");
      },
      selectedItemColor: Colors.blue, // Color when item is selected
      unselectedItemColor: Colors.grey, // Color when item is not selected
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.palette_outlined),
          label: 'AI Art',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.auto_fix_high),
          label: 'AI Enhance',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.enhance_photo_translate_outlined),
          label: 'ArtoonAI',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.brush_outlined),
          label: 'AI Image',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_rounded),
          label: 'Profile',
        ),
      ],
    );
  }
}
