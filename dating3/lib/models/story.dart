class Story {
  final String imagePath;
  final String label;
  final bool isMyStory;

  Story({
    required this.imagePath,
    required this.label,
    this.isMyStory = false,
  });
}
