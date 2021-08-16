import 'package:flutter/material.dart';
import 'package:shop/models/product_model.dart';

class ProductsProvider extends ChangeNotifier {
  List<ProductModel> _item = [
    ProductModel(
      id: '1',
      title: 'Jeans Shirt',
      price: 30.0,
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
          'https://static.zajo.net/content/mediagallery/zajo_dcat/image/product/types/X/9086.png',
      isFavorites: false,
    ),
    ProductModel(
      id: '3',
      title: 'Jacket',
      price: 100.0,
      description: 'any description about the product',
      imageUrl:
          'https://i.sportisimo.com/products/images/960/960351/450x450/champion-213628-gs502-bomber-jacket_0.jpg',
      isFavorites: false,
    ),
    ProductModel(
      id: '4',
      title: 'Leather Jacket',
      price: 150.0,
      description: 'any description about the product',
      imageUrl:
          'https://www.bolf.eu/eng_pl_Mens-Leather-Jacket-Black-Bolf-1107-75137_2.jpg',
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
