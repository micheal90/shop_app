import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/orders_provider.dart';
import 'package:shop/widgets/main_drawer.dart';
import 'package:shop/widgets/order_item_widget.dart';

class OrederScreen extends StatelessWidget {
  const OrederScreen({Key? key}) : super(key: key);
  static final routeName = '/orederScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Orders',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: Consumer<OrdersProvider>(
        builder: (context, valueOrder, child) => valueOrder.orderList.isEmpty
            ? Center(
                child: Text('Not found any order',
                    style: Theme.of(context).textTheme.bodyText1))
            : ListView.builder(
                itemCount: valueOrder.orderList.length,
                itemBuilder: (context, index) =>
                    OrderItemWidget(order: valueOrder.orderList[index]),
              ),
      ),
      drawer: MainDrawer(),
    );
  }
}
