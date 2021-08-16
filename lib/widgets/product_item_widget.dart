import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/products_provider.dart';
import 'package:shop/screens/Edit_product.dart';

class ProductItemWidget extends StatelessWidget {
  final String id;
  final String title;
  final double price;
  final String imageUrl;
  const ProductItemWidget({
    Key? key,
    required this.id,
    required this.title,
    required this.price,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Theme.of(context).primaryColor,
        backgroundImage: NetworkImage(imageUrl),
      ),
      title: Text(title),
      subtitle: Text('\$ ${price.toString()}'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, EditProduct.routeName,
                arguments: [id, true]),
            icon: Icon(
              Icons.edit,
              color: Theme.of(context).primaryColor,
            ),
          ),
          IconButton(
            onPressed: ()  =>
                 Provider.of<ProductsProvider>(context, listen: false)
                    .deleteProduct(id),
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
