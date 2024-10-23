import 'package:flutter/material.dart';

void showSongOptions(BuildContext context, String songTitle) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        color: const Color(0xFF050505),
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.add, color: Colors.white),
              title: const Text('Add to Playlist', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                // Add your functionality here
              },
            ),
            ListTile(
              leading: const Icon(Icons.share, color: Colors.white),
              title: const Text('Share', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                // Add your functionality here
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete, color: Colors.white),
              title: const Text('Remove from Library', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                // Add your functionality here
              },
            ),
          ],
        ),
      );
    },
  );
}