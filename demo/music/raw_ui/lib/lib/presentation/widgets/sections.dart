import 'package:flutter/material.dart';
import '../../models/feature_item.dart';
import '../data/featuring_today_repository.dart';
import 'app_constants.dart';



class FeaturingTodaySection extends StatelessWidget {
  final List<Map<String, String>> featuringItems = [
    {
      'image': 'https://picsum.photos/id/54/200/300',
      'title': 'New English Songs',
    },
    {
      'image': 'https://picsum.photos/id/55/200/300',
      'title': 'Weekly TOP 20',
    },
    {
      'image': 'https://picsum.photos/id/39/200/300',
      'title': 'Sing Along with The Chainsmokers',
    },
    {
      'image': 'https://picsum.photos/id/40/200/300',
      'title': 'All New from Tamil Trending',
    },
    {
      'image': 'https://picsum.photos/id/43/200/300',
      'title': 'This Week’s EDM Bangers',
    },
  ];

  void _onFeaturedItemTapped(int index) {
    // Navigate to featured item details
  }

  @override
  Widget build(BuildContext context) {
    return SectionWithTitle(
      title: 'Featuring Today',
      child: Container(
        height: 140,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(left: AppConstants.mediumSpacing),
          itemCount: featuringItems.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => _onFeaturedItemTapped(index),
              child: Container(
                margin: EdgeInsets.only(right: AppConstants.smallSpacing),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        featuringItems[index]['image']!,
                        width: 280,
                        height: 140,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      width: 280,
                      height: 140,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black.withOpacity(0.75),
                            Colors.transparent,
                          ],
                          stops: [0.28, 1],
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    Positioned(
                      left: 16,
                      bottom: 16,
                      child: Text(
                        featuringItems[index]['title']!,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Colors.white.withOpacity(0.75),
                          height: 1.17,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class RecentlyPlayedSection extends StatelessWidget {
  final List<Map<String, String>> recentlyPlayedItems = [
  {
    'image': 'https://picsum.photos/id/10/200/300',
    'title': 'Inside Out',
  },
  {
    'image': 'https://picsum.photos/id/20/200/300',
    'title': 'Young',
  },
  {
    'image': 'https://picsum.photos/id/30/200/300',
    'title': 'Beach House',
  },
  {
    'image': 'https://picsum.photos/id/40/200/300',
    'title': 'Setting Fires',
  },
  {
    'image': 'https://picsum.photos/id/50/200/300',
    'title': 'Kills You Slo...',
  },
  {
    'image': 'https://picsum.photos/id/60/200/300',
    'title': 'Remind me ...',
  },
  {
    'image': 'https://picsum.photos/id/70/200/300',
    'title': 'Somebody',
  },
  {
    'image': 'https://picsum.photos/id/80/200/300',
    'title': 'It Won’t Kill ...',
  },
];

  void _onSongPlayTapped(int index) {
    // Play the selected song
  }

  void _onSeeMoreTapped() {
    // Navigate to the full recently played list
  }

  @override
  Widget build(BuildContext context) {
    return SectionWithTitle(
      title: 'Recently Played',
      hasSeeMore: true,
      onSeeMoreTapped: _onSeeMoreTapped,
      child: Container(
        height: 110,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(left: AppConstants.mediumSpacing),
          itemCount: recentlyPlayedItems.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(right: AppConstants.smallSpacing),
              width: 80,
              child: GestureDetector(
                onTap: () => _onSongPlayTapped(index),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.network(
                            recentlyPlayedItems[index]['image']!,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 8,
                          right: 8,
                          child: Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.75),
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  blurRadius: 4,
                                  offset: Offset(0, 0),
                                ),
                              ],
                            ),
                            child: Icon(
                              Icons.play_arrow,
                              size: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppConstants.smallSpacing),
                    Text(
                      recentlyPlayedItems[index]['title']!,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.white.withOpacity(0.75),
                        height: 1.17,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class MixesForYouSection extends StatelessWidget {
  final List<Map<String, String>> mixes = [
  {
    'image': 'https://picsum.photos/id/11/200/300',
    'title': 'Calvin Harris, Martin Garrix, Dewain Whitmore',
    'label': 'Mix 1',
  },
  {
    'image': 'https://picsum.photos/id/12/200/300',
    'title': 'A R Rahman, Harris Jeyaraj, Yuvan Shankar Raja',
    'label': 'Mix 2',
  },
  {
    'image': 'https://picsum.photos/id/13/200/300',
    'title': 'Maroon 5, Imagine Dragons, Coldplay',
    'label': 'Mix 3',
  },
  {
    'image': 'https://picsum.photos/id/14/200/300',
    'title': 'DNCE, Ariana Grande, Justin Bieber',
    'label': 'Happy Vibes',
  },
  {
    'image': 'https://picsum.photos/id/15/200/300',
    'title': 'Mark Ronson, DNCE, Bruno Mars, The C...',
    'label': 'High Energy',
  },
  {
    'image': 'https://picsum.photos/id/16/200/300',
    'title': 'Snow Patrol, The Chainsmokers, Ros...',
    'label': 'Chill Hits',
  },
];

  void _onMixTapped(int index) {
    // Navigate to mix details or play mix
  }

  @override
  Widget build(BuildContext context) {
    return SectionWithTitle(
      title: 'Mixes for you',
      child: Container(
        height: 164,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(left: AppConstants.mediumSpacing),
          itemCount: mixes.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => _onMixTapped(index),
              child: Container(
                margin: EdgeInsets.only(right: AppConstants.smallSpacing),
                width: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            mixes[index]['image']!,
                            width: 120,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.75),
                              ],
                              stops: [0.7, 1],
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        Positioned(
                          bottom: 8,
                          left: 8,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              mixes[index]['label']!,
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: Colors.white.withOpacity(0.75),
                                height: 1.33,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppConstants.smallSpacing),
                    Text(
                      mixes[index]['title']!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.white.withOpacity(0.75),
                        height: 1.17,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class FromArtistsYouFollowSection extends StatelessWidget {
  final List<Map<String, String>> items = [
    {
      'image': 'https://via.placeholder.com/120',
      'title': 'Maroon 5: Best of the best',
    },
    {
      'image': 'https://via.placeholder.com/120',
      'title': 'This is Maroon 5',
    },
    {
      'image': 'https://via.placeholder.com/120',
      'title': 'Maroon5 live unplugged',
    },
    {
      'image': 'https://via.placeholder.com/120',
      'title': 'Maroon 5 - Top Hits',
    },
    {
      'image': 'https://via.placeholder.com/120',
      'title': 'Coldplay & Maroon 5 hits',
    },
    {
      'image': 'https://via.placeholder.com/120',
      'title': 'Top 10 Soft Rocks',
    },
  ];

  void _onItemTapped(int index) {
    // Navigate to item details
  }

  void _onSeeMoreTapped() {
    // Navigate to the full list
  }

  @override
  Widget build(BuildContext context) {
    return SectionWithTitle(
      title: 'From Artists You Follow',
      hasSeeMore: true,
      onSeeMoreTapped: _onSeeMoreTapped,
      child: Container(
        height: 164,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(left: AppConstants.mediumSpacing),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => _onItemTapped(index),
              child: Container(
                margin: EdgeInsets.only(right: AppConstants.smallSpacing),
                width: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        items[index]['image']!,
                        width: 120,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: AppConstants.smallSpacing),
                    Text(
                      items[index]['title']!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.white.withOpacity(0.75),
                        height: 1.17,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class NewReleasesSection extends StatelessWidget {
  final List<Map<String, String>> newReleases = [
    {
      'image': 'https://via.placeholder.com/80',
      'title': 'Sick Boy',
    },
    {
      'image': 'https://via.placeholder.com/80',
      'title': 'Lonely Toge...',
    },
    {
      'image': 'https://via.placeholder.com/80',
      'title': 'Pay No Mind',
    },
    {
      'image': 'https://via.placeholder.com/80',
      'title': 'Remind me ...',
    },
    {
      'image': 'https://via.placeholder.com/80',
      'title': 'Until You W...',
    },
    {
      'image': 'https://via.placeholder.com/80',
      'title': '#SELFIE',
    },
    {
      'image': 'https://via.placeholder.com/80',
      'title': 'Good Intens...',
    },
    {
      'image': 'https://via.placeholder.com/80',
      'title': 'It Won’t Kill ...',
    },
  ];

  void _onSongPlayTapped(int index) {
    // Play the selected song
  }

  void _onSeeMoreTapped() {
    // Navigate to the full new releases list
  }

  @override
  Widget build(BuildContext context) {
    return SectionWithTitle(
      title: 'New Releases',
      hasSeeMore: true,
      onSeeMoreTapped: _onSeeMoreTapped,
      child: Container(
        height: 110,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(left: AppConstants.mediumSpacing),
          itemCount: newReleases.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(right: AppConstants.smallSpacing),
              width: 80,
              child: GestureDetector(
                onTap: () => _onSongPlayTapped(index),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.network(
                            newReleases[index]['image']!,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 8,
                          right: 8,
                          child: Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.75),
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  blurRadius: 4,
                                  offset: Offset(0, 0),
                                ),
                              ],
                            ),
                            child: Icon(
                              Icons.play_arrow,
                              size: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppConstants.smallSpacing),
                    Text(
                      newReleases[index]['title']!,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.white.withOpacity(0.75),
                        height: 1.17,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class TopPlaylistsSection extends StatelessWidget {
  final List<Map<String, String>> playlists = [
    {
      'image': 'https://via.placeholder.com/120',
      'title': 'GYM PHONK: Aggressive Workout',
    },
    {
      'image': 'https://via.placeholder.com/120',
      'title': 'SIGMA MALE TIKTOK MUSIC',
    },
    {
      'image': 'https://via.placeholder.com/120',
      'title': 'Phonk Villain',
    },
    {
      'image': 'https://via.placeholder.com/120',
      'title': 'Name is Ghost',
    },
    {
      'image': 'https://via.placeholder.com/120',
      'title': 'Drift Phonk',
    },
    {
      'image': 'https://via.placeholder.com/120',
      'title': 'Phonklicious: The Most Delicious Pho...',
    },
  ];

  void _onPlaylistTapped(int index) {
    // Navigate to playlist details
  }

  void _onSeeMoreTapped() {
    // Navigate to the full playlists list
  }

  @override
  Widget build(BuildContext context) {
    return SectionWithTitle(
      title: 'Top Playlists',
      hasSeeMore: true,
      onSeeMoreTapped: _onSeeMoreTapped,
      child: Container(
        height: 164,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(left: AppConstants.mediumSpacing),
          itemCount: playlists.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => _onPlaylistTapped(index),
              child: Container(
                margin: EdgeInsets.only(right: AppConstants.smallSpacing),
                width: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        playlists[index]['image']!,
                        width: 120,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: AppConstants.smallSpacing),
                    Text(
                      playlists[index]['title']!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.white.withOpacity(0.75),
                        height: 1.17,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class SectionWithTitle extends StatelessWidget {
  final String title;
  final Widget child;
  final bool hasSeeMore;
  final VoidCallback? onSeeMoreTapped;

  SectionWithTitle({
    required this.title,
    required this.child,
    this.hasSeeMore = false,
    this.onSeeMoreTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: AppConstants.largeSpacing),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppConstants.mediumSpacing),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Colors.white.withOpacity(0.75),
                      height: 1.17,
                    ),
                  ),
                ),
                if (hasSeeMore)
                  GestureDetector(
                    onTap: onSeeMoreTapped,
                    child: Text(
                      'See more',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        height: 1.25,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(height: AppConstants.smallSpacing),
          child,
        ],
      ),
    );
  }
}