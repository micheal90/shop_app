import 'package:flutter/cupertino.dart';
import 'package:shop/models/cart_model.dart';

class CartProvider extends ChangeNotifier {
  List<CartModel> _cartList = [
    CartModel(
      id: '1',
      title: 'title',
      price: 24,
      quantity: 2,
    ),
    CartModel(
      id: '2',
      title: 'title2',
      price: 50.0,
      quantity: 3,
    ),
  ];
  List<CartModel> get cartList => [..._cartList];

  double getTotalPrice() {
    double totalPrice = 0;
    _cartList.forEach((item) {
      var amount = item.price * item.quantity;
      totalPrice += amount;
    });
    return totalPrice;
  }

  Future addItemToCart() async {
    // _cartList.add('value');
  }
  Future deleteItemFromCart(String id) async {
    _cartList.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  Future increaseQuantity(String id) async {
    _cartList.firstWhere((element) => element.id == id).quantity++;
    notifyListeners();
  }

  Future decreaseQuantity(String id) async {
    var item = _cartList.firstWhere((element) => element.id == id);
    if (item.quantity > 1) {
      _cartList.firstWhere((element) => element.id == id).quantity--;
    } else {
      await deleteItemFromCart(id);
    }
    notifyListeners();
  }
}
