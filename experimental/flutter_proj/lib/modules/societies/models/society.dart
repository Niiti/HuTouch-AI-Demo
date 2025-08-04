class Society {
  final int id;
  final String name;

  Society({required this.id, required this.name});

  factory Society.fromJson(Map<String, dynamic> json) {
    return Society(
      id: json['id'] is int ? json['id'] : int.tryParse('${json['id']}') ?? 0,
      name: json['society'] as String? ?? '',
    );
  }
}
