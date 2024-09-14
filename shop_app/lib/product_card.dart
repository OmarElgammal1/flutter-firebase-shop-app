import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  final String productName;
  final String imageUrl;
  final double price;
  final bool isFavorite; // Initial favorite status
  final String screenType; // 'Wishlist', 'Cart', etc.
  final VoidCallback? onAddToCart;
  final VoidCallback? onRemoveFromWishlist;

  ProductCard({
    required this.productName,
    required this.imageUrl,
    required this.price,
    this.isFavorite = false,
    required this.screenType,
    this.onAddToCart,
    this.onRemoveFromWishlist,
  });

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  late bool _isFavorite;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.isFavorite; // Set initial favorite state
  }

  void toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite; // Toggle favorite state
    });

    if (_isFavorite) {
      print('${widget.productName} added to wishlist');
      // Add your logic to handle adding to wishlist
    } else {
      print('${widget.productName} removed from wishlist');
      // Add your logic to handle removing from wishlist
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              // Product Image
              Image.network(widget.imageUrl, fit: BoxFit.cover, height: 120, width: double.infinity),

              // Heart Icon for Wishlist (top-right corner)
              Positioned(
                top: 8,
                right: 8,
                child: GestureDetector(
                  onTap: toggleFavorite, // Toggle favorite status
                  child: Icon(
                    _isFavorite ? Icons.favorite : Icons.favorite_border, // Filled or border heart
                    color: _isFavorite ? Colors.red : Colors.grey, // Color based on favorite state
                  ),
                ),
              ),
            ],
          ),

          // Product Name and Price
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.productName, style: TextStyle(fontWeight: FontWeight.bold)),
                Text("\$${widget.price.toString()}", style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),

          // Actions based on screen type
          if (widget.screenType == 'Cart')
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                if (widget.onRemoveFromWishlist != null) widget.onRemoveFromWishlist!();
              },
            ),
        ],
      ),
    );
  }
}
