class GalleryItemModel {
  GalleryItemModel({
    this.id, 
    required this.imageUrl, 
    this.description,
    this.imageUrlSmall, 
  });
  
  String? id; //to use in hero animation
  final String imageUrl;
  final String? description;
  final String? imageUrlSmall;
}
