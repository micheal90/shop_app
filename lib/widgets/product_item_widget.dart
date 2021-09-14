import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/product_model.dart';
import 'package:shop/providers/products_provider.dart';
import 'package:shop/screens/Edit_product.dart';

class ProductItemWidget extends StatelessWidget {
  late final ProductModel prod;
  @override
  Widget build(BuildContext context) {
    prod = Provider.of<ProductModel>(context);
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey.shade500,
        backgroundImage: NetworkImage(prod.imageUrl),
      ),
      title: Text(prod.title),
      subtitle: Text('\$ ${prod.price.toString()}'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, EditProduct.routeName,
                arguments: {'id': prod.id}),
            icon: Icon(
              Icons.edit,
              color: Theme.of(context).primaryColor,
            ),
          ),
          IconButton(
            onPressed: () =>
                Provider.of<ProductsProvider>(context, listen: false)
                    .deleteProduct(prod.id),
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
