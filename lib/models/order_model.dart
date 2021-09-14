import 'package:flutter/cupertino.dart';
import 'package:shop/models/cart_model.dart';

class OrderModel with ChangeNotifier{
  String id;
  List<CartModel> products;
  double totalAmount;
  DateTime date;
  OrderModel({
    required this.id,
    required this.products,
    required this.totalAmount,
    required this.date,
  });
}
