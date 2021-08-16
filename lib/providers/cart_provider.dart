import 'package:flutter/cupertino.dart';
import 'package:shop/models/cart_model.dart';
import 'package:shop/models/product_model.dart';

class CartProvider extends ChangeNotifier {
  List<CartModel> _cartList = [
    // CartModel(
    //   id: '1',
    //   title: 'title',
    //   price: 24,
    //   quantity: 2,
    // ),
    // CartModel(
    //   id: '2',
    //   title: 'title2',
    //   price: 50.0,
    //   quantity: 3,
    // ),
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

  void addItemToCart(ProductModel productModel) {
    var isExist =
        _cartList.indexWhere((element) => element.id == productModel.id);
    if (isExist == -1) {
      _cartList.add(CartModel(
        id: productModel.id,
        title: productModel.title,
        price: productModel.price,
        quantity: 1,
      ));
    } else {
      increaseQuantity(productModel.id);
    }

    notifyListeners();
  }

  void deleteItemFromCart(String id) {
    _cartList.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  void increaseQuantity(String id) {
    _cartList.firstWhere((element) => element.id == id).quantity++;
    notifyListeners();
  }

  void decreaseQuantity(String id) {
    var item = _cartList.firstWhere((element) => element.id == id);
    if (item.quantity > 1) {
      _cartList.firstWhere((element) => element.id == id).quantity--;
    }
    notifyListeners();
  }

  void clear() {
    _cartList.clear();
    notifyListeners();
  }
}
