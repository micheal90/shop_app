import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/products_provider.dart';
import 'package:shop/screens/product_details.dart';
import 'package:shop/widgets/product_grid_item_widget.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);
  static final routeName = '/productsScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Consumer<ProductsProvider>(
          builder: (context, valueProducts, child) => GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300,
                childAspectRatio: 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: valueProducts.item.length,
              itemBuilder: (context, index) => InkWell(
                    onTap: () => Navigator.pushNamed(
                      context,
                      ProductDetails.routeName,
                      arguments: valueProducts.item[index].id,
                    ),
                    child: ProductGridItemWidget(
                      text: valueProducts.item[index].title,
                      imageUrl: valueProducts.item[index].imageUrl,
                    ),
                  )),
        ),
      ),
    );
  }
}
