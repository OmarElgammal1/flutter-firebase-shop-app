import 'package:flutter/material.dart';
import 'product_card.dart';
import 'data.dart';

class OrdersScreen extends StatelessWidget {
  final String screenType;

  OrdersScreen({required this.screenType});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: orders.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          var orderItem = orders[index];
          var productId = orderItem['id'];
          var size = orderItem['size'];

          var product = products[productId];


          return ProductCard(
            id: productId,
            productName: product?['productName'],
            imageUrl: product?['imageUrls'][0],
            price: product?['price'],
            isFavorite: product?['isFavorite'],
            screenType: screenType,
            size: size,
          );
        },
      );
  }
}
