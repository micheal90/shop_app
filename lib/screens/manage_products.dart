import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/products_provider.dart';
import 'package:shop/screens/Edit_product.dart';
import 'package:shop/widgets/product_item_widget.dart';

class ManageProducts extends StatelessWidget {
  const ManageProducts({Key? key}) : super(key: key);
  static final routeName = '/manageProducts';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Products',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        actions: [
          IconButton(
            onPressed: ()=>Navigator.pushNamed(context, EditProduct.routeName,arguments: []),
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: Consumer<ProductsProvider>(
        builder: (context, valueProduct, child) => valueProduct.item.isEmpty
            ? Center(
                child: Text('Not found any product',
                    style: Theme.of(context).textTheme.bodyText1))
            : ListView.builder(
                itemCount: valueProduct.item.length,
                itemBuilder: (context, index) => ProductItemWidget(
                  id: valueProduct.item[index].id,
                  title: valueProduct.item[index].title,
                  price: valueProduct.item[index].price,
                  imageUrl: valueProduct.item[index].imageUrl,
                ),
              ),
      ),
    );
  }
}
