import 'package:flutter/material.dart';
import 'package:my_project/core/constants/images_asset.dart';

class SeriesDetails extends StatelessWidget {
  const SeriesDetails({super.key});
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Padding(
      padding: EdgeInsets.all(mediaQuery.size.width * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'The Night Agent',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: mediaQuery.size.height * 0.01),
          Row(
            children: [
              const Text('2023', style: TextStyle(color: Colors.white)),
              SizedBox(width: mediaQuery.size.width * 0.02),
              Container(
                color: Colors.grey,
                padding: EdgeInsets.symmetric(
                  horizontal: mediaQuery.size.width * 0.02,
                  vertical: mediaQuery.size.height * 0.005,
                ),
                child: const Text(
                  'U/A 16+',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(width: mediaQuery.size.width * 0.02),
              const Text('10 Episodes', style: TextStyle(color: Colors.white)),
              SizedBox(width: mediaQuery.size.width * 0.02),
              Image.asset(
                ImagesAsset.hdIcon,
                height: mediaQuery.size.height * 0.03,
              ),
              SizedBox(width: mediaQuery.size.width * 0.02),
              Image.asset(
                ImagesAsset.audioDescription,
                height: mediaQuery.size.height * 0.03,
              ),
              SizedBox(width: mediaQuery.size.width * 0.02),
              Image.asset(
                ImagesAsset.subtitlesIcon,
                height: mediaQuery.size.height * 0.03,
              ),
            ],
          ),
          SizedBox(height: mediaQuery.size.height * 0.02),
          const Text(
            'He works in the White House basement, monitoring a phone that rarely rings, But when a conspiracy plot threatens the nation, will he answer the call?',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: mediaQuery.size.height * 0.02),
          const Text(
            'Starring: Gabriel Basso, Luciane Buchanan, Ho...',
            style: TextStyle(color: Colors.white),
          ),
          const Text(
            'Creator: Shawn Ryan',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
