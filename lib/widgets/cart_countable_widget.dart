import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/cart_provider.dart';
import 'package:shop/providers/orders_provider.dart';
import 'package:shop/screens/cart_screen.dart';

class CartCountableWidget extends StatelessWidget {
  const CartCountableWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var count = Provider.of<CartProvider>(context).cartList.length;
    return Stack(
      children: [
        IconButton(
          onPressed: () => Navigator.pushNamed(context, CartScreen.routeName),
          icon: Icon(Icons.shopping_cart),
        ),
        count > 0
            ? Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  child: Center(
                    child: FittedBox(
                      child: Text('$count'),
                    ),
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}
