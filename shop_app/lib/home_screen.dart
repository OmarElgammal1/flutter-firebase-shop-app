import 'package:flutter/material.dart';
import 'product_card.dart';
import 'shop_app_bar.dart';
import 'nav_bar.dart';
import 'data.dart';
import 'product_details_screen.dart';

class HomeScreen extends StatelessWidget {
  final String screenType;

  HomeScreen({required this.screenType});

  @override
  Widget build(BuildContext context) {
    var productList = products.entries.toList();

    return Scaffold(
      appBar: ShopAppBar(
        title: screenType,
      ),
      body: GridView.builder(
        itemCount: productList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          var productEntry = productList[index];
          var product = productEntry.value;

          return ProductCard(
            id: productEntry.key,
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
