class Feature {
  final String title;
  final String description;
  final String icon;
  final bool isSelected;

  Feature({
    required this.title,
    required this.description,
    required this.icon,
    this.isSelected = false,
  });

  Feature copyWith({bool? isSelected}) {
    return Feature(
      title: this.title,
      description: this.description,
      icon: this.icon,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
