import 'package:flutter/material.dart';
import 'package:untitled/shop_app_bar.dart';
import 'home_screen.dart';
import 'wishlist_screen.dart';
import 'cart_screen.dart';
import 'orders_screen.dart';
import 'nav_bar.dart';
import 'shop_app_bar.dart';



class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final List<String> _types = ["Home", "Wishlist", "Cart", "Orders"];
  final List<Widget> _screens = [
    HomeScreen(screenType: 'Home'),
    WishlistScreen(screenType: 'Wishlist'),
    CartScreen(screenType: 'Cart'),
    OrdersScreen(screenType: 'Orders'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ShopAppBar(title: _types[_currentIndex]),
      body: _screens[_currentIndex],
      bottomNavigationBar: ShopNavBar(
        currentIndex: _currentIndex,
        onTabSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
