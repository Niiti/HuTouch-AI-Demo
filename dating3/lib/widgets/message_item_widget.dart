import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../models/chat_message.dart';

class MessageItemWidget extends StatelessWidget {
  final ChatMessage message;

  const MessageItemWidget({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 20,
      ),
      child: Row(
        children: [
          // Profile image
          Container(
            width: 56,
            height: 56,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: ClipOval(
              child: Image.network(
                message.imagePath,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/error_image.png',
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  message.senderName,
                  style: AppTextStyles.senderNameTextStyle,
                ),
                const SizedBox(height: 4),
                Text(
                  message.messageSnippet,
                  style: message.isUnread
                      ? AppTextStyles.messageSnippetTextStyleUnread
                      : AppTextStyles.messageSnippetTextStyleRead,
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                message.time,
                style: AppTextStyles.timeTextStyle,
              ),
              const SizedBox(height: 12),
              if (message.isUnread)
                Container(
                  width: 12,
                  height: 12,
                  decoration: const BoxDecoration(
                    color: AppColors.primaryColor,
                    shape: BoxShape.circle,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}