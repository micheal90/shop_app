import 'package:flutter/cupertino.dart';

class CartModel with ChangeNotifier{
  String id;
  String title;
  double price;
  int quantity;
  CartModel({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
  });
}
