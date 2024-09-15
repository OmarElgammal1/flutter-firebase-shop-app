import 'package:flutter/material.dart';
import 'product_card.dart';
import 'shop_app_bar.dart';
import 'nav_bar.dart';
import 'data.dart';



class WishlistScreen extends StatelessWidget {
  final String screenType;

  WishlistScreen({required this.screenType});

  @override
  Widget build(BuildContext context) {
    var favoriteProducts = products.entries
        .where((entry) => entry.value['isFavorite'] == true)
        .toList();

    return Scaffold(
      appBar: ShopAppBar(
        title: screenType,
      ),
      body: GridView.builder(
        itemCount: favoriteProducts.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          var productEntry = favoriteProducts[index];
          var product = productEntry.value;


          return ProductCard(
            id: productEntry.key,
            productName: product['productName'],
            imageUrl: product['imageUrls'][0],
            price: product['price'],
            isFavorite: true,
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