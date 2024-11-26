import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import '../../models/conversation.dart';
import '../screens/chat_screen.dart';

class ConversationWidget extends StatelessWidget {
  final Conversation conversation;

  ConversationWidget({required this.conversation});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            // Navigate to chat screen
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatScreen(userName: conversation.name),
              ),
            );
          },
          child: ListTile(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            leading: CircleAvatar(
              backgroundImage: AssetImage(conversation.imagePath),
              radius: 28,
            ),
            title: Text(
              conversation.name,
              style: TextStyle(
                color: AppColors.darkTextColor,
                fontWeight: FontWeight.w600,
                fontSize: 18,
                fontFamily: AppFonts.primaryFont,
                height: 1.35,
              ),
            ),
            subtitle: Text(
              conversation.message,
              style: TextStyle(
                color: conversation.unread
                    ? AppColors.darkTextColor
                    : AppColors.lightTextColor,
                fontSize: 14,
                fontFamily: AppFonts.primaryFont,
                height: 1.4,
              ),
            ),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(height: 4),
                Text(
                  conversation.time,
                  style: TextStyle(
                    color: AppColors.greyColor,
                    fontSize: 14,
                    fontFamily: AppFonts.primaryFont,
                    height: 1.4,
                  ),
                ),
                SizedBox(height: 8),
                conversation.unread
                    ? Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: AppColors.purpleColor,
                          shape: BoxShape.circle,
                        ),
                      )
                    : SizedBox(
                        height: 12,
                      ),
              ],
            ),
          ),
        ),
        Divider(
          color: AppColors.dividerColor.withOpacity(0.08),
          thickness: 1,
        ),
      ],
    );
  }
}
