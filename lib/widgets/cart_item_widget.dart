import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/cart_model.dart';
import 'package:shop/providers/cart_provider.dart';

class CartItemWidget extends StatelessWidget {
  late final CartModel cartModel;
  @override
  Widget build(BuildContext context) {
    cartModel = Provider.of<CartModel>(context);
    return Card(
      elevation: 10,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).primaryColor,
          child: FittedBox(
              child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text('\$${cartModel.price}'),
          )),
        ),
        title: Text(
          cartModel.title,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        subtitle: Text('Total: \$ ${cartModel.price * cartModel.quantity}'),
        //isThreeLine: true,
        trailing: FittedBox(
          child: IntrinsicHeight(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  //mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        constraints: BoxConstraints(),
                        padding: EdgeInsets.zero,
                        onPressed: () =>
                            Provider.of<CartProvider>(context, listen: false)
                                .decreaseQuantity(cartModel.id),
                        icon: Icon(
                          Icons.remove_circle_outline,
                        )),
                    Text('${cartModel.quantity}'),
                    IconButton(
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                        onPressed: () =>
                            Provider.of<CartProvider>(context, listen: false)
                                .increaseQuantity(cartModel.id),
                        icon: Icon(
                          Icons.add_circle_outline,
                        )),
                  ],
                ),
                VerticalDivider(
                  thickness: 1,
                  color: Colors.black,
                  // indent: 5,
                  // endIndent: 5,
                ),
                IconButton(
                    constraints: BoxConstraints(),
                    padding: EdgeInsets.zero,
                    onPressed: () =>
                        Provider.of<CartProvider>(context, listen: false)
                            .deleteItemFromCart(cartModel.id),
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
