import 'package:flutter/material.dart';
import 'package:shop/models/order_model.dart';
import 'package:intl/intl.dart';

class OrderItemWidget extends StatelessWidget {
  final OrderModel order;

  const OrderItemWidget({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Card(
      elevation: 10,
      child: ExpansionTile(
          childrenPadding: const EdgeInsets.symmetric(horizontal: 20),
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          title: Text(
            '\$ ${order.totalAmount}',
            style: TextStyle(fontSize: 22),
          ),
          subtitle: Text(
            DateFormat('dd/MM/yyyy hh:mm').format(order.date).toString(),
            style: TextStyle(color: Colors.grey),
          ),
          children: order.products
              .map(
                (element) => Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(element.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                        Text(
                          '${element.quantity} x \$ ${element.price}',
                          style: TextStyle(color: Colors.grey),
                        ),
                                       ],
                    ),
                    Divider()
                  ],
                ),
              )
              .toList()),
    );
  }
}
