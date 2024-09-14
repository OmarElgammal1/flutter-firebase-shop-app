import 'package:flutter/material.dart';
import 'product_card.dart';
import 'shop_app_bar.dart';
import 'nav_bar.dart';
import 'data.dart'; // Import the product data

class HomeScreen extends StatelessWidget {
  final String screenType; // Pass 'Wishlist', 'Cart', etc.

  HomeScreen({required this.screenType});

  @override
  Widget build(BuildContext context) {

    var productList = products.values.toList();

    return Scaffold(
      appBar: ShopAppBar(
        title: screenType,
      ),
      body: GridView.builder(
        itemCount: productList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // items per row
        ),
        itemBuilder: (context, index) {
          var product = productList[index];
          return ProductCard(
            productName: product['productName'],
            imageUrl: product['imageUrls'][0],
            price: product['price'],
            isFavorite: product['isFavorite'],
            screenType: screenType,
            onAddToCart: () {
              print('${product['productName']} added to cart');
            },
            onRemoveFromWishlist: () {

              print('${product['productName']} removed from wishlist');
            },
          );
        },
      ),
      bottomNavigationBar: ShopNavBar(),
    );
  }
}

