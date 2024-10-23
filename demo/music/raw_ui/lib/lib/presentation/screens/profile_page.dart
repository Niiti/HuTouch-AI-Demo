import 'package:flutter/material.dart';
import '../widgets/language_selection_widget.dart';


class ProfilePage extends StatelessWidget {
  final Color backgroundColor = Color(0xFF0D0D0D);
  final Color primaryTextColor = Color.fromRGBO(255, 255, 255, 0.75);
  final Color secondaryTextColor = Color.fromRGBO(255, 255, 255, 0.5);
  final Color buttonBackgroundColor = Color.fromRGBO(255, 255, 255, 0.75);
  final Color buttonIconColor = Color.fromRGBO(0, 0, 0, 0.75);
  final Color statsButtonGradientStart = Color.fromRGBO(255, 255, 255, 0.12);
  final Color statsButtonGradientEnd = Color.fromRGBO(0, 0, 0, 0.12);
  final Color editButtonColor = Color.fromRGBO(255, 255, 255, 0.75);
  final Color editButtonTextColor = Color.fromRGBO(0, 0, 0, 0.75);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.0),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: SizedBox(),
          flexibleSpace: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'My Profile',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: primaryTextColor,
                        height: 28 / 24,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: 68,
                      height: 28,
                      decoration: BoxDecoration(
                        color: editButtonColor,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: editButtonTextColor, elevation: 0, backgroundColor: editButtonColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          padding: EdgeInsets.zero,
                        ),
                        onPressed: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context) => EditProfilePage()),);
                        },
                        icon: Icon(
                          Icons.edit,
                          size: 16,
                          color: buttonIconColor,
                        ),
                        label: Text(
                          'Edit',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: buttonIconColor,
                            height: 16 / 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 8),
                Center(
                  child: Column(
                    children: [
                      SizedBox(height: 24),
                      CircleAvatar(
                        radius: 44,
                        backgroundImage:
                            AssetImage('assets/unsplash_d2MSDujJl2g.jpg'),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Logan Jimmy',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: primaryTextColor,
                          height: 20 / 16,
                        ),
                      ),
                      SizedBox(height: 16),
                      // Email
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Email',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  height: 20 / 16,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'jim_logan01@gmail.com',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: secondaryTextColor,
                                  height: 14 / 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      // Phone Number
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Phone Number',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  height: 20 / 16,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                '8844662200',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: secondaryTextColor,
                                  height: 14 / 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 24),
                      // Stats Section
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Songs Button
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context,MaterialPageRoute(builder: (context) => SongsPage()),);

                              },
                              child: StatsButton(
                                iconAsset: 'assets/favorite_icon.png',
                                label: '120 songs',
                              ),
                            ),
                            // Playlists Button
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context,MaterialPageRoute(builder: (context) => PlaylistsPage()),);
                              },
                              child: StatsButton(
                                iconAsset: 'assets/queue_music_icon.png',
                                label: '12 playlists',
                              ),
                            ),
                            // Artists Button
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context,MaterialPageRoute(builder: (context) => ArtistsPage()),);
                              },
                              child: StatsButton(
                                iconAsset: 'assets/account_music_icon.png',
                                label: '3 artists',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                // Settings Section
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Settings',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: primaryTextColor,
                        height: 28 / 24,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                // Music Language(s)
                SettingItem(
                  title: 'Music Language(s)',
                  value: 'English, Tamil',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => LanguageSelectionWidget(),
                      );
                    },
                ),
                // Streaming Quality
                SettingItem(
                  title: 'Streaming Quality',
                  value: 'HD',
                  onTap: () {
                    // Navigate to streaming quality settings
                  },
                ),
                // Download Quality
                SettingItem(
                  title: 'Download Quality',
                  value: 'HD',
                  onTap: () {
                    // Navigate to download quality settings
                  },
                ),
                // Equalizer
                SettingItem(
                  title: 'Equalizer',
                  value: '',
                  hasSubtitle: true,
                  subtitle: 'Adjust audio settings',
                  hasNavigation: true,
                  onTap: () {
                    // Navigate to equalizer settings
                  },
                ),
                // Auto-Play
                SettingSwitchItem(
                  title: 'Auto-Play',
                  value: true,
                  onChanged: (bool newValue) {
                    // Handle auto-play toggle
                  },
                ),
                // Show Lyrics on Player
                SettingSwitchItem(
                  title: 'Show Lyrics on Player',
                  value: true,
                  onChanged: (bool newValue) {
                    // Handle show lyrics toggle
                  },
                ),
                // Connect to a Device
                SettingItem(
                  title: 'Connect to a Device',
                  value: '',
                  hasSubtitle: true,
                  subtitle: 'Listen to and control music on your devices',
                  hasNavigation: true,
                  onTap: () {
                    // Navigate to device connection settings
                  },
                ),
                SizedBox(height: 24),
                // Others Section
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Others',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: primaryTextColor,
                        height: 28 / 24,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                // Help & Support
                SettingItem(
                  title: 'Help & Support',
                  value: '',
                  hasNavigation: true,
                  onTap: () {
                    // Navigate to help & support
                  },
                ),
                // Logout
                SettingItem(
                  title: 'Logout',
                  value: '',
                  hasNavigation: true,
                  onTap: () {
                    // Handle logout
                  },
                ),
                SizedBox(height: 72),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StatsButton extends StatelessWidget {
  final String iconAsset;
  final String label;

  StatsButton({required this.iconAsset, required this.label});

  final Color statsButtonGradientStart = Color.fromRGBO(255, 255, 255, 0.12);
  final Color statsButtonGradientEnd = Color.fromRGBO(0, 0, 0, 0.12);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 88,
      height: 70,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            statsButtonGradientStart,
            statsButtonGradientEnd,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            offset: Offset(0, 2),
            blurRadius: 4,
          ),
        ],
        borderRadius: BorderRadius.zero,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            iconAsset,
            width: 24,
            height: 24,
            color: Color.fromRGBO(255, 255, 255, 0.75),
          ),
          SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(255, 255, 255, 0.5),
              height: 14 / 12,
            ),
          ),
        ],
      ),
    );
  }
}

class SettingItem extends StatelessWidget {
  final String title;
  final String value;
  final bool hasNavigation;
  final bool hasSubtitle;
  final String? subtitle;
  final VoidCallback? onTap;

  SettingItem({
    required this.title,
    required this.value,
    this.hasNavigation = false,
    this.hasSubtitle = false,
    this.subtitle,
    this.onTap,
  });

  final Color primaryTextColor = Color.fromRGBO(255, 255, 255, 0.75);
  final Color valueTextColor = Color.fromRGBO(255, 255, 255, 1);
  final Color subtitleTextColor = Color.fromRGBO(255, 255, 255, 0.5);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: hasSubtitle ? 70 : 56,
      decoration: BoxDecoration(
        border: Border(
          bottom:
              BorderSide(color: Color.fromRGBO(255, 255, 255, 0.12), width: 0.5),
        ),
        color: Color.fromRGBO(0, 0, 0, 0.12),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 24.0),
        title: Text(
          title,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: primaryTextColor,
            height: 20 / 16,
          ),
        ),
        subtitle: hasSubtitle
            ? Text(
                subtitle ?? '',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: subtitleTextColor,
                  height: 14 / 12,
                ),
              )
            : null,
        trailing: hasNavigation
            ? Icon(
                Icons.navigate_next,
                color: Color.fromRGBO(255, 255, 255, 0.75),
              )
            : Text(
                value,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: valueTextColor,
                  height: 16 / 12,
                ),
              ),
        onTap: onTap,
      ),
    );
  }
}

class SettingSwitchItem extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool>? onChanged;

  SettingSwitchItem({
    required this.title,
    required this.value,
    this.onChanged,
  });

  final Color primaryTextColor = Color.fromRGBO(255, 255, 255, 0.75);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        border: Border(
          bottom:
              BorderSide(color: Color.fromRGBO(255, 255, 255, 0.12), width: 0.5),
        ),
        color: Color.fromRGBO(0, 0, 0, 0.12),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 24.0),
        title: Text(
          title,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: primaryTextColor,
            height: 20 / 16,
          ),
        ),
        trailing: Switch(
          value: value,
          onChanged: onChanged,
          activeColor: Color.fromRGBO(255, 255, 255, 0.75),
          inactiveTrackColor: Color.fromRGBO(255, 255, 255, 0.12),
        ),
      ),
    );
  }
}


// Placeholder pages for navigation
class EditProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Implement edit profile UI
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Center(child: Text('Edit Profile Page')),
    );
  }
}

class SongsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Implement songs UI
      appBar: AppBar(
        title: Text('Songs'),
      ),
      body: Center(child: Text('Songs Page')),
    );
  }
}

class PlaylistsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Implement playlists UI
      appBar: AppBar(
        title: Text('Playlists'),
      ),
      body: Center(child: Text('Playlists Page')),
    );
  }
}

class ArtistsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Implement artists UI
      appBar: AppBar(
        title: Text('Artists'),
      ),
      body: Center(child: Text('Artists Page')),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Implement settings UI
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(child: Text('Settings Page')),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Implement home UI
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(child: Text('Home Page')),
    );
  }
}

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Implement search UI
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Center(child: Text('Search Page')),
    );
  }
}

class LibraryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Implement library UI
      appBar: AppBar(
        title: Text('Your Library'),
      ),
      body: Center(child: Text('Your Library Page')),
    );
  }
}

