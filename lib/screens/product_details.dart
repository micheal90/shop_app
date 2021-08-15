import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/products_provider.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);
  static final routeName = '/productDetails';

  @override
  Widget build(BuildContext context) {
    var productId = ModalRoute.of(context)!.settings.arguments;
    var product = Provider.of<ProductsProvider>(context, listen: false)
        .findProductById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          product.title,
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.4,
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Description',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  product.description,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Price',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  ' ${product.price} \$',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
