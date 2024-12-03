import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:get/get.dart';


class ShortsTab extends StatefulWidget {
  @override
  _ShortsTabState createState() => _ShortsTabState();
}

class _ShortsTabState extends State<ShortsTab> {
  late VideoPlayerController _videoController;
  final List<String> videoUrls = [
    // Video paths
    'assets/videos/video1.mp4',
    'assets/videos/video2.mp4',
    'assets/videos/video3.mp4',
  ];

  int currentVideoIndex = 0;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer(currentVideoIndex);
  }

  void _initializeVideoPlayer(int index) {
    if (index < videoUrls.length) {
      _videoController = VideoPlayerController.asset(videoUrls[index])
        ..initialize().then((_) {
          setState(() {});
          _videoController.play();
          _videoController.setLooping(true);
        });
    }
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  void changeVideo(int direction) {
    setState(() {
      if (direction > 0) {
          // Scroll down
          currentVideoIndex = (currentVideoIndex + 1) % videoUrls.length;
      } else {
          // Scroll up
          currentVideoIndex = (currentVideoIndex - 1 + videoUrls.length) % videoUrls.length;
      }
      
      _initializeVideoPlayer(currentVideoIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          GestureDetector(
            onVerticalDragEnd: (details) {
              if (details.primaryVelocity! < 0) {
                changeVideo(1); // Scroll down
              } else if (details.primaryVelocity! > 0) {
                changeVideo(-1); // Scroll up
              }
            },
            child: VideoPlayer(_videoController),
          ),
          SafeArea(
            child: Padding(
              padding: TopAppBarPadding(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  IconButton(
                    icon: Icon(Icons.camera_alt, color: Colors.white),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20.0,
            left: 20.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VideoDescription(),
                SizedBox(height: 8.0),
                SubscribeRow(),
              ],
            ),
          ),
          Positioned(
            right: 10.0,
            bottom: MediaQuery.of(context).size.height * 0.2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                EngagementButton(
                  icon: Icons.thumb_up,
                  label: '245K',
                  iconSize: 30,
                  onTap: () {}, // Add functionality
                ),
                SizedBox(height: 12),
                EngagementButton(
                  icon: Icons.thumb_down,
                  label: 'Dislike',
                  iconSize: 30,
                  onTap: () {}, // Add functionality
                ),
                SizedBox(height: 12),
                EngagementButton(
                  icon: Icons.comment,
                  label: '952',
                  iconSize: 30,
                  onTap: () {}, // Add functionality
                ),
                SizedBox(height: 12),
                Column(
                  children: [
                    IconButton(
                      icon: ImageIcon(AssetImage('assets/logo/Property 1=32.png'), size: 40,color: Colors.white,),
                      onPressed: () {}
                    ),
                    Text(
                      'Share',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  EdgeInsets TopAppBarPadding() {
    return EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0);
  }
}

class VideoDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "DIY Toys | Satisfying And Relaxing | SADEK Tuts TikTok Competition | Fidget Trading #SADEK #Shorts TikTok",
      style: TextStyle(
        color: Colors.white,
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
      ),
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class SubscribeRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 16,
          backgroundImage: AssetImage('assets/images/profile.png'),
        ),
        SizedBox(width: 8.0),
        Text(
          "SADEK Tuts",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(width: 8.0),
        ElevatedButton(
          onPressed: () {}, // Add subscription functionality
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
          ),
          child: Text(
            "SUBSCRIBE",
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.0,
            ),
          ),
        ),
      ],
    );
  }
}

class EngagementButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final double iconSize;
  final VoidCallback onTap;

  EngagementButton({
    required this.icon,
    required this.label,
    required this.iconSize,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          icon: Icon(icon, size: iconSize, color: Colors.white),
          onPressed: onTap,
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}