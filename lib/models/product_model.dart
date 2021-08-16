class ProductModel {
  String id;
  String title;
  double price;
  String description;
  String imageUrl;
  bool isFavorites;
  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.imageUrl,
    required this.isFavorites,
  });
}
