import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../constants/constants.dart';
import '../models/chat_message.dart';
import '../models/match_profile.dart';
import '../widgets/heart_icon_widget.dart';
import '../widgets/match_profile_widget.dart';
import '../widgets/message_item_widget.dart';
import '../widgets/bottom_navigation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final recentMatchesProvider = Provider<List<MatchProfile>>((ref) {
  return [
    MatchProfile(imagePath: 'assets/Fabian.png'),
    MatchProfile(imagePath: 'assets/Halima.png'),
    MatchProfile(imagePath: 'assets/Selena.png'),
    MatchProfile(imagePath: 'assets/Vanessa.png'),
  ];
});

final messagesProvider = FutureProvider<List<ChatMessage>>((ref) async {
  try {
    final baseUrl = 'https://8dd094ed-4489-4f2e-a3f4-f7e07193cb1b.mock.pstmn.io';
    final response = await http.get(Uri.parse('$baseUrl/api/messages'));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body)['data'];
      return data.map((json) => ChatMessage.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load messages');
    }
  } catch (e) {
    throw Exception('Error occurred: $e');
  }
});

class MessagesOverviewScreen extends ConsumerWidget {
  MessagesOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recentMatches = ref.watch(recentMatchesProvider);
    final messages = ref.watch(messagesProvider);

    return Scaffold(
      backgroundColor: kOverlayColor,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 35),
            child: Column(
              children: [
                // Header Section
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              border: Border.all(
                                color: AppColors.whiteColor.withOpacity(0.08),
                                width: 1,
                              ),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.arrow_back,
                                color: AppColors.whiteColor,
                                size: 24,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'Messages',
                        style: AppTextStyles.headerTextStyle,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                // Recent Matches Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Recent Matches',
                        style: AppTextStyles.subHeaderTextStyle,
                      ),
                      const SizedBox(height: 16),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            const HeartIconWidget(),
                            const SizedBox(width: 20),
                            Row(
                              children: recentMatches.map((profile) {
                                return GestureDetector(
                                  onTap: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Tapped on ${profile.imagePath}'),
                                      ),
                                    );
                                    // Implement functionality if needed
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 20),
                                    child: MatchProfileWidget(profile: profile),
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                // Messages List
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(32),
                      ),
                    ),
                    child: messages.when(
                      data: (messageList) => ListView.separated(
                        padding: const EdgeInsets.only(top: 16), // Adjusted padding
                        itemCount: messageList.length,
                        separatorBuilder: (context, index) {
                          return Divider(
                            color: AppColors.blackColor.withOpacity(0.08),
                            height: 1,
                            indent: 24,
                            endIndent: 24,
                          );
                        },
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              // Navigate to conversation screen
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Tapped on ${messageList[index].senderName}'),
                                ),
                              );
                            },
                            child: MessageItemWidget(message: messageList[index]),
                          );
                        },
                      ),
                      loading: () => const Center(child: CircularProgressIndicator()),
                      error: (error, stack) => Center(child: Text('Error: $error')),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Bottom Navigation Bar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                BottomNavigation(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}