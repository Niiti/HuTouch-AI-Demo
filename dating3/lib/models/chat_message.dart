class ChatMessage {
  final int id;
  final String senderName;
  final String messageSnippet;
  final String time;
  final String imagePath;
  final bool isUnread;

  ChatMessage({
    required this.id,
    required this.senderName,
    required this.messageSnippet,
    required this.time,
    required this.imagePath,
    required this.isUnread,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      id: json['id'],
      senderName: json['senderName'],
      messageSnippet: json['messageSnippet'],
      time: json['time'],
      imagePath: json['imagePath'] ?? 'assets/default.png', // Default asset path
      isUnread: json['isUnread'] ?? false,
    );
  }
}