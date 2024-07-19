class ArtModel {
  final String name;
  final String imageUrl;
  bool isSelected;

  ArtModel(
      {required this.name, required this.imageUrl, this.isSelected = false});
}
