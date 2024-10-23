import 'package:flutter/material.dart';
import '../data/recently_played_data.dart';
import '../widgets/song_entry.dart';
import 'song_options.dart';

class RecentlyPlayedSection extends StatelessWidget {
  const RecentlyPlayedSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recently Played',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0,
                    height: 1.1667,
                    color: Colors.white.withOpacity(0.75),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigate to the full Recently Played screen if required
                  },
                  child: const Text(
                    'See more',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0,
                      height: 1.25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: recentlyPlayedData.length,
            itemBuilder: (context, index) {
              final song = recentlyPlayedData[index];
              return SongEntry(
                imageUrl: song['imageUrl']!,
                songTitle: song['songTitle']!,
                artistName: song['artistName']!,
                onMorePressed: () {
                  showSongOptions(context, song['songTitle']!);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import '../data/recently_played_data.dart';
// import '../widgets/song_entry.dart';
// import 'song_options.dart';

// class RecentlyPlayedSection extends StatelessWidget {
//   const RecentlyPlayedSection({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SliverToBoxAdapter(
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Recently Played',
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.w500,
//                     letterSpacing: 0,
//                     height: 1.1667,
//                     color: Colors.white.withOpacity(0.75),
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     // Navigate to the full Recently Played screen if required
//                   },
//                   child: const Text(
//                     'See more',
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w500,
//                       letterSpacing: 0,
//                       height: 1.25,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           ListView.builder(
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             itemCount: recentlyPlayedData.length,
//             itemBuilder: (context, index) {
//               final song = recentlyPlayedData[index];
//               return SongEntry(
//                 imageUrl: song['imageUrl']!,
//                 songTitle: song['songTitle']!,
//                 artistName: song['artistName']!,
//                 onMorePressed: () {
//                   showSongOptions(context, song['songTitle']!);
//                 },
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }




// import 'package:flutter/material.dart';
// import '../../models/recently_played_model.dart';
// import '../data/music_repository.dart';

// class RecentlyPlayedSection extends StatelessWidget {
//   final MusicRepository _musicRepository = MusicRepository();

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<RecentlyPlayedModel>>(
//       future: _musicRepository.fetchRecentlyPlayed(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return CircularProgressIndicator();
//         } else if (snapshot.hasError) {
//           return Text('Error: ${snapshot.error}');
//         } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//           return Text('No Recently Played Songs');
//         } else {
//           final recentlyPlayed = snapshot.data!;
//           return ListView.builder(
//             shrinkWrap: true,
//             itemCount: recentlyPlayed.length,
//             itemBuilder: (context, index) {
//               final song = recentlyPlayed[index];
//               return ListTile(
//                 leading: Image.network(song.imageUrl),
//                 title: Text(song.title),
//                 subtitle: Text(song.artist),
//               );
//             },
//           );
//         }
//       },
//     );
//   }
// }