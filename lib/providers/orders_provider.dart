import 'package:flutter/cupertino.dart';
import 'package:shop/models/cart_model.dart';
import 'package:shop/models/order_model.dart';

class OrdersProvider extends ChangeNotifier {
  List<OrderModel> _orderList = [
    OrderModel(
      id: '1',
      products: [
        CartModel(
          id: 'id',
          title: 'Shirt',
          price: 15,
          quantity: 2,
        ),
        CartModel(
          id: 'id',
          title: 'T-Shirt',
          price: 5,
          quantity: 1,
        ),
      ],
      totalAmount: 20,
      date: DateTime.now(),
    ),
  ];
  List<OrderModel> get orderList => [..._orderList];
}
