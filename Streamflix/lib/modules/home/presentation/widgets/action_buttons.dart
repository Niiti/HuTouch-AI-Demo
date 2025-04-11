import 'package:flutter/material.dart';
import 'package:my_project/core/constants/images_asset.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: mediaQuery.size.height * 0.02),
      child: Column(
        children: [
          ElevatedButton.icon(
            onPressed: () {},
            icon: Image.asset(
              ImagesAsset.playNow,
              height: mediaQuery.size.height * 0.03,
            ),
            label: const Text('Play'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              padding: EdgeInsets.symmetric(
                horizontal: mediaQuery.size.width * 0.3,
                vertical: mediaQuery.size.height * 0.02,
              ),
            ),
          ),
          SizedBox(height: mediaQuery.size.height * 0.02),
          ElevatedButton.icon(
            onPressed: () {},
            icon: Image.asset(
              ImagesAsset.downloadVideo,
              height: mediaQuery.size.height * 0.03,
            ),
            label: const Text('Download S1 : E1'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[800],
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(
                horizontal: mediaQuery.size.width * 0.2,
                vertical: mediaQuery.size.height * 0.02,
              ),
            ),
          ),
          SizedBox(height: mediaQuery.size.height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  IconButton(
                    icon: Image.asset(ImagesAsset.myList),
                    onPressed: () {},
                  ),
                  const Text('My List', style: TextStyle(color: Colors.white)),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    icon: Image.asset(ImagesAsset.share),
                    onPressed: () {},
                  ),
                  const Text('Share', style: TextStyle(color: Colors.white)),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    icon: Image.asset(ImagesAsset.allEpisodes),
                    onPressed: () {},
                  ),
                  const Text(
                    'All Episodes',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
