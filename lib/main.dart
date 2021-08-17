import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/cart_provider.dart';
import 'package:shop/providers/orders_provider.dart';
import 'package:shop/providers/products_provider.dart';
import 'package:shop/screens/Edit_product.dart';
import 'package:shop/screens/bottom_navigation_bar_screen.dart';
import 'package:shop/screens/cart_screen.dart';
import 'package:shop/screens/fevorite_screen.dart';
import 'package:shop/screens/manage_products.dart';
import 'package:shop/screens/order_screen.dart';
import 'package:shop/screens/product_details.dart';
import 'package:shop/screens/products_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: ProductsProvider()),
      ChangeNotifierProvider.value(value: OrdersProvider()),
      ChangeNotifierProvider.value(value: CartProvider())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My Shop',
        theme: ThemeData(
            primarySwatch: Colors.deepOrange,
            primaryColor: Colors.deepPurple,
            textTheme: TextTheme(
              bodyText1: GoogleFonts.acme(fontSize: 20, color: Colors.grey),
              bodyText2: GoogleFonts.acme(fontSize: 18, color: Colors.black),
              headline6: GoogleFonts.acme(fontSize: 30),
              headline3: GoogleFonts.acme(fontSize: 18, color: Colors.white),
            ),
            appBarTheme: AppBarTheme(
              titleSpacing: 0,
              titleTextStyle: GoogleFonts.acme(),
            )),
        routes: {
          '/': (_) => BottomNavigationBarScreen(),
          ProductsScreen.routeName: (_) => ProductsScreen(),
          FavoriteScreen.routeName: (_) => FavoriteScreen(),
          OrederScreen.routeName: (_) => OrederScreen(),
          ManageProducts.routeName: (_) => ManageProducts(),
          ProductDetails.routeName: (_) => ProductDetails(),
          EditProduct.routeName: (_) => EditProduct(),
          CartScreen.routeName: (_) => CartScreen(),
        });
  }
}
