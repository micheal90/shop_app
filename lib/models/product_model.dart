import 'package:flutter/cupertino.dart';

class ProductModel with ChangeNotifier {
  String id;
  String title;
  double price;
  String description;
  String imageUrl;
  bool isFavorite;
  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.imageUrl,
    required this.isFavorite,
  });
}
