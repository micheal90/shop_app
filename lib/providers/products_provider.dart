import 'package:flutter/material.dart';
import 'package:shop/models/product_model.dart';

class ProductsProvider extends ChangeNotifier {
  List<ProductModel> _item = [
    ProductModel(
        id: '1',
        title: 'Jeans Shirt',
        price: 20.0,
        description: 'any description about the product',
        imageUrl:
            'https://4.imimg.com/data4/LL/TW/MY-33084776/men-s-shirt-500x500.jpg'),
    ProductModel(
        id: '2',
        title: 'T-Shirt',
        price: 10.0,
        description: 'any description about the product',
        imageUrl:
            'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F2c%2F82%2F2c82435e88bb7a28468576feaa1fe7c99a2b9946.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5Bmen_tshirtstanks_shortsleeve%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url[file:/product/zoom]&zoom=zoom'),
    ProductModel(
        id: '3',
        title: 'Jeans Shirt',
        price: 20.0,
        description: 'any description about the product',
        imageUrl:
            'https://4.imimg.com/data4/LL/TW/MY-33084776/men-s-shirt-500x500.jpg'),
    ProductModel(
        id: '4',
        title: 'T-Shirt',
        price: 10.0,
        description: 'any description about the product',
        imageUrl:
            'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F2c%2F82%2F2c82435e88bb7a28468576feaa1fe7c99a2b9946.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5Bmen_tshirtstanks_shortsleeve%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url[file:/product/zoom]&zoom=zoom'),
  ];
  List<ProductModel> get item => [..._item];

  Future addProduct(
    String title,
    double price,
    String description,
    String imageUrl,
  ) async {
    _item.add(ProductModel(
      id: DateTime.now().toString(),
      title: title,
      price: price,
      description: description,
      imageUrl: imageUrl,
    ));
    notifyListeners();
  }

  Future updateProduct(
    String id,
    String title,
    double price,
    String description,
    String imageUrl,
  ) async {
    var product = findProductById(id);
    product.title = title;
    product.price = price;
    product.description = description;
    product.imageUrl = imageUrl;

    notifyListeners();
  }

  Future deleteProduct(String id) async {
    _item.removeWhere((prod) => prod.id == id);
    notifyListeners();
  }

  ProductModel findProductById(id) {
    return _item.firstWhere((prod) => prod.id == id);
  }
}
