import 'package:flutter/material.dart';
import 'product_screen.dart';
import 'reviews_screen.dart';
import 'add_review.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: ProductScreen(screenType: 'Wishlist'), // Start with Wishlist or any screen type
      //home: ReviewsScreen(),
      home: AddReviewScreen(),
    );
  }
}
