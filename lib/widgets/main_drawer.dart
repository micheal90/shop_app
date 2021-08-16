import 'package:flutter/material.dart';
import 'package:shop/screens/manage_products.dart';
import 'package:shop/screens/order_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text(
              'Menu',
              style: Theme.of(context).appBarTheme.titleTextStyle,
            ),
            automaticallyImplyLeading: false,
          ),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text(
              'Shop',
              style: Theme.of(context).textTheme.bodyText2,
            ),
            onTap: () => Navigator.pushReplacementNamed(context, '/'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.credit_card),
            title: Text(
              'Order',
              style: Theme.of(context).textTheme.bodyText2,
            ),
            onTap: () => Navigator.pushReplacementNamed(context, OrederScreen.routeName),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text(
              'Manage Products',
              style: Theme.of(context).textTheme.bodyText2,
            ),
            onTap: () => Navigator.pushReplacementNamed(context, ManageProducts.routeName),
          ),
          Divider(),
        ],
      ),
    );
  }
}
