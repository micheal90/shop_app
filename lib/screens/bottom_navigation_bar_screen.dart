import 'package:flutter/material.dart';
import 'package:shop/screens/fevorite_screen.dart';
import 'package:shop/screens/products_screen.dart';
import 'package:shop/widgets/cart_countable_widget.dart';
import 'package:shop/widgets/main_drawer.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  @override
  _BottomNavigationBarScreenState createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  var _currentIndex = 0;

  final List<Map<String, dynamic>> pages = [
    {
      'title': 'Products',
      'page': ProductsScreen(),
    },
    {
      'title': 'Favorite',
      'page': FavoriteScreen(),
    }
  ];

  void _selectPage(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          pages[_currentIndex]['title'],
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CartCountableWidget(),
          )
        ],
      ),
      body: pages[_currentIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _currentIndex,
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
            icon:const Icon(Icons.category),
            label: 'Product',
          ),
          BottomNavigationBarItem(
            icon:const Icon(Icons.star),
            label: 'Favorite',
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}

