import 'package:flutter/material.dart';
import 'product_card.dart';

import 'data.dart';



class WishlistScreen extends StatelessWidget {
  final String screenType;

  WishlistScreen({required this.screenType});

  @override
  Widget build(BuildContext context) {
    var favoriteProducts = products.entries
        .where((entry) => entry.value['isFavorite'] == true)
        .toList();

    return GridView.builder(
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
            onRemoveFromCart: () {
              print('${product['productName']} removed from wishlist');
            },
          );
        },
      );

  }
}