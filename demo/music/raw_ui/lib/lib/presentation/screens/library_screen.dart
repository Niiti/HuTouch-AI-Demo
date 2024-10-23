import 'package:flutter/material.dart';
import '../../main.dart';
import '../widgets/library_header.dart';
import '../widgets/recently_played_section.dart';
import '../widgets/song_entry.dart';
import '../widgets/grid_item.dart';
import '../data/artists_data.dart';


class LibraryScreen extends StatefulWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  _LibraryScreenState createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: libHeaderSection(title: 'Your Library'),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              sliver: SliverGrid.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 148 / 110,
                children: [
                  GridItem(
                    icon: Icons.favorite_border,
                    title: 'Liked Songs',
                    subtitle: '120 songs',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LikedSongsScreen()),
                      );
                    },
                  ),
                  GridItem(
                    icon: Icons.download_for_offline_outlined,
                    title: 'Downloads',
                    subtitle: '210 songs',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DownloadsScreen()),
                      );
                    },
                  ),
                  GridItem(
                    icon: Icons.queue_music,
                    title: 'Playlists',
                    subtitle: '12 playlists',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PlaylistsScreen()),
                      );
                    },
                  ),
                  GridItem(
                    icon: Icons.music_note,
                    title: 'Artists',
                    subtitle: '3 artists',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  ArtistsScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
            const RecentlyPlayedSection(),
            const SliverToBoxAdapter(
              child: SizedBox(height: 72),
            ),
          ],
        ),
      ),
    );
  }
}