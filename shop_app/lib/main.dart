import 'package:flutter/material.dart';
import 'product_screen.dart';
import 'reviews_screen.dart';
import 'add_review.dart';
import 'home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(screenType: 'Home'), // Start with Wishlist or any screen type
      //home: ReviewsScreen(),
      //home: AddReviewScreen(),
    );
  }
}
