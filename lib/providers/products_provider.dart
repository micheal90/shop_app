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
          'https://4.imimg.com/data4/LL/TW/MY-33084776/men-s-shirt-500x500.jpg',
      isFavorites: false,
    ),
    ProductModel(
      id: '2',
      title: 'T-Shirt',
      price: 10.0,
      description: 'any description about the product',
      imageUrl:
          'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F2c%2F82%2F2c82435e88bb7a28468576feaa1fe7c99a2b9946.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5Bmen_tshirtstanks_shortsleeve%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url[file:/product/zoom]&zoom=zoom',
      isFavorites: false,
    ),
    ProductModel(
      id: '3',
      title: 'Jeans Shirt',
      price: 20.0,
      description: 'any description about the product',
      imageUrl:
          'https://4.imimg.com/data4/LL/TW/MY-33084776/men-s-shirt-500x500.jpg',
      isFavorites: false,
    ),
    ProductModel(
      id: '4',
      title: 'T-Shirt',
      price: 10.0,
      description: 'any description about the product',
      imageUrl:
          'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F2c%2F82%2F2c82435e88bb7a28468576feaa1fe7c99a2b9946.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5Bmen_tshirtstanks_shortsleeve%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url[file:/product/zoom]&zoom=zoom',
      isFavorites: false,
    ),
  ];
  List<ProductModel> get item => [..._item];
  List<ProductModel> _favoriteList = [];
  List<ProductModel> get favoriteList => [..._favoriteList];

  void addProduct(
    String title,
    double price,
    String description,
    String imageUrl,
  ) {
    _item.add(ProductModel(
        id: DateTime.now().toString(),
        title: title,
        price: price,
        description: description,
        imageUrl: imageUrl,
        isFavorites: false));
    notifyListeners();
  }

  void updateProduct(
    String id,
    String title,
    double price,
    String description,
    String imageUrl,
  ) {
    var product = findProductById(id);
    product.title = title;
    product.price = price;
    product.description = description;
    product.imageUrl = imageUrl;

    notifyListeners();
  }

  void deleteProduct(String id) {
    _item.removeWhere((prod) => prod.id == id);
    notifyListeners();
  }

  ProductModel findProductById(id) {
    return _item.firstWhere((prod) => prod.id == id);
  }

  Future setFavorite(String id) async {
    var product = _item.firstWhere((element) => element.id == id);
    if (product.isFavorites) {
      product.isFavorites = false;
      _favoriteList.remove(product);
    } else {
      product.isFavorites = true;
      _favoriteList.add(product);
    }
    notifyListeners();
  }
}
