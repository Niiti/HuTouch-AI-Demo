import 'package:flutter/material.dart';
import '../controllers/match_controller.dart';
import '../widgets/match_card.dart';
import '../widgets/triangular_clipper.dart';
import 'package:get/get.dart';
import '../../../constants/app_constants.dart';

class MatchBody extends StatelessWidget {
  final MatchController controller;

  const MatchBody({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Tabs: Upcoming and Past Matches
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Matches",
                  style: TextStyle(
                    fontFamily: 'Bebas Neue',
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                ClipPath(
                  clipper: TriangularClipper(),
                  child: Container(
                    color: Colors.red,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      children: const [
                        Text(
                          "FOOTBALL",
                          style: TextStyle(
                            fontFamily: 'Manrope',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.white,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Matches Options (Horizontal Scroll)
          SizedBox(
            height: 90,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _leagueOption("assets/images/league_premium_league.png",
                    "Premier League"),
                _leagueOption(
                    "assets/images/league_cbf_league.png", "CBF League"),
                _leagueOption(
                    "assets/images/league_ligue_league.png", "LIGUE 1 League"),
                _leagueOption(
                    "assets/images/league_korean_league.png", "Korean League"),
              ],
            ),
          ),

          // TabBar Section
          const TabBar(
            labelColor: Colors.red,
            unselectedLabelColor: Colors.black,
            labelStyle: TextStyle(
              fontFamily: 'Manrope',
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            indicatorColor: Colors.red,
            tabs: [
              Tab(text: "Upcoming"),
              Tab(text: "Past Matches"),
            ],
          ),

          // TabBar Content
          Expanded(
            child: TabBarView(
              children: [
                // Upcoming Matches
                // Upcoming Matches
                ListView(
                  padding: const EdgeInsets.all(16.0),
                  children: [
                    const Text(
                      "Friday – February 25",
                      style: TextStyle(
                        fontFamily: 'Manrope',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 16),
                    MatchCard(
                      leagueLogo: "assets/images/league_premium_league.png",
                      homeTeam: "CHELSEA",
                      homeTeamLogo: "assets/images/team_chelsea_logo.png",
                      awayTeam: "MAN UTD",
                      awayTeamLogo: "assets/images/team_man_united_logo.png",
                      time: "7pm",
                      onTap: () {
                        Get.toNamed(AppConstants.statsScreenRoute);
                      },
                    ),
                    MatchCard(
                      leagueLogo: "assets/images/league_premium_league.png",
                      homeTeam: "ALBION",
                      homeTeamLogo: "assets/images/team_albion_logo.png",
                      awayTeam: "ARSENAL",
                      awayTeamLogo: "assets/images/team_arsenal_logo.png",
                      time: "7pm",
                      onTap: () {
                        print('MatchCard pressed!');
                      },
                    ),
                  ],
                ),

                // Past Matches
                const Center(
                  child: Text(
                    "No past matches available.",
                    style: TextStyle(
                        fontFamily: 'Manrope',
                        fontSize: 16,
                        color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _leagueOption(String imagePath, String title) {
    return Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: Colors.grey.shade300, // Add grey border
                  width: 2, // Set border width
                ),
              ),
              child: Image.asset(imagePath, height: 48),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Manrope',
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ));
  }
}
