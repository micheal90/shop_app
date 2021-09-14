import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/product_model.dart';
import 'package:shop/providers/cart_provider.dart';
import 'package:shop/providers/products_provider.dart';

class ProductGridItemWidget extends StatelessWidget {
  late final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    productModel = Provider.of<ProductModel>(context);
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      )),
      child: GridTile(
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          child: Image.network(
            productModel.imageUrl,
            fit: BoxFit.fill,
          ),
        ),
        footer: Container(
          color: Colors.black45,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () =>
                      Provider.of<ProductsProvider>(context, listen: false)
                          .setFavorite(productModel.id),
                  icon: Icon(
                    productModel.isFavorite
                        ? Icons.favorite
                        : Icons.favorite_outline,
                    color: Colors.red,
                  )),
              Text(
                productModel.title,
                style: Theme.of(context).textTheme.headline3,
              ),
              IconButton(
                  onPressed: () =>
                      Provider.of<CartProvider>(context, listen: false)
                          .addItemToCart(productModel),
                  icon: Icon(
                    Icons.add_shopping_cart_rounded,
                    color: Colors.red,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
