import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/cart_provider.dart';

class CartItemWidget extends StatelessWidget {
 final String id;
  final String title;
  final double price;
  final int quantity;
  const CartItemWidget({
    Key? key,
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).primaryColor,
          child: FittedBox(
              child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text('\$$price'),
          )),
        ),
        title: Text(title),
        subtitle: Text('Total: \$ ${price * quantity}'),
        trailing: FittedBox(
          child: IntrinsicHeight(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('${quantity}x'),
                VerticalDivider(
                  thickness: 1,
                  color: Colors.black,
                  indent: 5,
                  endIndent: 5,
                ),
                IconButton(
                    onPressed: () async =>await Provider.of<CartProvider>(context,listen: false)
                        .decreaseQuantity(id),
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
