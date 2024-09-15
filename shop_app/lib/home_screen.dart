import 'package:flutter/material.dart';
import 'product_card.dart';
import 'data.dart';

class HomeScreen extends StatelessWidget {
  final String screenType;

  HomeScreen({required this.screenType});

  @override
  Widget build(BuildContext context) {
    var productList = products.entries.toList();

    return CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: false,
            backgroundColor: Colors.white,
            elevation: 0,
            flexibleSpace: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.grey[300],
                ),
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey[700]),
                    SizedBox(width: 10.0),
                    Text(
                      'Search',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ],
                ),
              ),
            ),
            expandedHeight: 80.0,
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              childAspectRatio: 0.75,
            ),
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
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
                  onRemoveFromCart: () {
                    print('${product['productName']} removed from wishlist');
                  },
                );
              },
              childCount: productList.length,
            ),
          ),
        ],
      );

  }
}
