import 'package:flutter/material.dart';
import 'reviews_screen.dart';
import 'add_review.dart';
import 'home_screen.dart';
import 'product_details_screen.dart';
import 'wishlist_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WishlistScreen(screenType: "Wishlist"),
      //home: ProductDetailScreen(id: 1),
      //home: HomeScreen(screenType: 'Home'), // Start with Wishlist or any screen type
      //home: ReviewsScreen(id: 1),
      //home: AddReviewScreen(),
    );
  }
}
