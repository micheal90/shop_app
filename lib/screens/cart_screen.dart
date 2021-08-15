import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/cart_provider.dart';
import 'package:shop/widgets/cart_item_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
  static final routeName = '/cartScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Cart',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<CartProvider>(
              builder: (context, valueCart, child) => Column(
            children: [
              Card(
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Theme.of(context).primaryColor,
                            ),
                            child: Text(
                              '\$${valueCart.getTotalPrice()}',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          TextButton(
                            onPressed: () {},
                            child:
                                Text('ORDER NOW', style: TextStyle(fontSize: 20)),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: ListView.builder(
                    itemCount: valueCart.cartList.length,
                    itemBuilder: (context, index) => CartItemWidget(
                      id: valueCart.cartList[index].id,
                      title: valueCart.cartList[index].title,
                      price: valueCart.cartList[index].price,
                      quantity: valueCart.cartList[index].quantity,
                    ),
                  ),
                ),
              
            ],
          ),
        ),
      ),
    );
  }
}
