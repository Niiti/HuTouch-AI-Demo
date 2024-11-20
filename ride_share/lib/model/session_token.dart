class SessionToken {
  final String session;

  SessionToken({required this.session});

  factory SessionToken.fromJson(Map<String, dynamic> json) {
    return SessionToken(session: json['session'] as String);
  }
}