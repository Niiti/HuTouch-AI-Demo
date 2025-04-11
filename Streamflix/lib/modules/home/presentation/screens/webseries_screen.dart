import 'package:flutter/material.dart';
import 'package:my_project/core/themes/app_theme.dart';
import 'package:my_project/modules/home/presentation/widgets/header.dart';
import 'package:my_project/modules/home/presentation/widgets/content_image.dart';
import 'package:my_project/modules/home/presentation/widgets/series_details.dart';
import 'package:my_project/modules/home/presentation/widgets/action_buttons.dart';
import 'package:my_project/modules/home/presentation/widgets/bottom_nav_bar.dart';
import 'package:video_player/video_player.dart'; // New import for video player

class WebseriesScreen extends StatefulWidget {
  const WebseriesScreen({super.key});

  @override
  _WebseriesScreenState createState() => _WebseriesScreenState();
}

class _WebseriesScreenState extends State<WebseriesScreen> {
  late VideoPlayerController _videoController;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _videoController =
        VideoPlayerController.asset('assets/video.mp4')
          ..addListener(() {
            setState(() {});
          })
          ..setLooping(true)
          ..initialize().then((_) => setState(() {}));
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Theme(
      data: AppTheme.lightTheme3,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            children: [
              const Header(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      if (_videoController.value.isInitialized)
                        AspectRatio(
                          aspectRatio: _videoController.value.aspectRatio,
                          child: Stack(
                            children: [
                              VideoPlayer(_videoController),
                              Positioned(
                                bottom: 10,
                                left: 10,
                                child: IconButton(
                                  icon: Icon(
                                    _isPlaying ? Icons.pause : Icons.play_arrow,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isPlaying = !_isPlaying;
                                      _isPlaying
                                          ? _videoController.play()
                                          : _videoController.pause();
                                    });
                                  },
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: VideoProgressIndicator(
                                  _videoController,
                                  allowScrubbing: true,
                                  colors: VideoProgressColors(
                                    backgroundColor: Colors.grey,
                                    playedColor: Colors.red,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      else
                        const CircularProgressIndicator(),
                      const SeriesDetails(),
                      const ActionButtons(),
                      const EpisodesSection(),
                    ],
                  ),
                ),
              ),
              BottomNavBar(
                selectedIndex: 0,
                onItemTapped: (int index) {},
                screenWidth: screenWidth,
                screenHeight: screenHeight,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// New widget for episodes section
class EpisodesSection extends StatelessWidget {
  const EpisodesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final episodes = List.generate(
      10,
      (index) => ListTile(
        title: Text(
          'Episode ${index + 1}',
          style: const TextStyle(color: Colors.white),
        ),
        subtitle: Text(
          'Description for episode ${index + 1}',
          style: const TextStyle(color: Colors.white70),
        ),
        onTap: () {
          // Episode tap logic
        },
      ),
    );

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Episodes',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Column(children: episodes),
        ],
      ),
    );
  }
}
