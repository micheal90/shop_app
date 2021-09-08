import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/products_provider.dart';
import 'package:shop/screens/product_details.dart';
import 'package:shop/widgets/product_grid_item_widget.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);
  static final routeName = '/favouriteScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Consumer<ProductsProvider>(
        builder: (context, valueProducts, child) =>
            valueProducts.favoriteList.isEmpty
                ? Center(
                    child: Text('Not found any product',
                        style: Theme.of(context).textTheme.bodyText1))
                : GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 300,
                      childAspectRatio: 1,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: valueProducts.favoriteList.length,
                    itemBuilder: (context, index) => InkWell(
                          onTap: () => Navigator.pushNamed(
                            context,
                            ProductDetails.routeName,
                            arguments: valueProducts.favoriteList[index].id,
                          ),
                          child: ProductGridItemWidget(
                            productModel: valueProducts.favoriteList[index],
                          ),
                        )),
      ),
    ));
  }
}
